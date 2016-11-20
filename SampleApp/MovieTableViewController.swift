//
//  MovieTableViewController.swift
//  SampleApp
//
//  Created by Asar, Chandra on 11/19/16.
//  Copyright © 2016 Asar, Chandra. All rights reserved.
//

import UIKit
import Alamofire

class MovieTableViewController: UITableViewController {

    //@IBOutlet var movieYear: UILabel!
    
    var request = URLRequest(url: URL(string: "http://www.omdbapi.com/?t=alien")!)
    var movieData = [JSONObj]()
  //  var movieTitles = [String]()
  //  var movieYears = [String]()
    
    var dataObjToSend: JSONObj = [:]
    
    typealias JSONObj = [String : AnyObject]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getMovieData();
    }
    
    //defines number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieData.count
    }
    
    //defines number of cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieTableViewCell
        
        cell.movieTitleLabel?.text = movieData[indexPath.row]["Title"] as? String
        cell.movieYearLabel?.text = movieData[indexPath.row]["Year"] as? String
        
        return cell
    }
    
    //do i need this func?
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        dataObjToSend = self.movieData[indexPath.row]
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var indexPath: IndexPath = self.tableView.indexPathForSelectedRow!
        
        let movieDetailVC = segue.destination as! MovieDetailViewController
        
//        print(movieData[indexPath.row]["Poster"])

        movieDetailVC.movieTitleText = movieData[indexPath.row]["Title"] as! String
        movieDetailVC.movieYearText = movieData[indexPath.row]["Year"] as! String
        movieDetailVC.moviePosterLink = movieData[indexPath.row]["Poster"] as! String
    }
    
    func getMovieData(){
        Alamofire.request("http://www.omdbapi.com/?s=alien", method: .get).responseJSON(completionHandler: { response in
            self.parseData(JSONData: response.data!)
        })
    }
    
    func parseData(JSONData: Data){
        do {
            var serializedData = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as! [String : AnyObject]
            if let movies = serializedData["Search"] {
                for i in 0..<movies.count{
                    let movie = movies[i] as! JSONObj;
                    movieData.append(movie)
                    self.tableView.reloadData()
                }
            }
        }
        catch{
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    //    func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    
    //        return 1;
    //    }

}
