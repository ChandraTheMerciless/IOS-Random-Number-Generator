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
    var movieTitles = [String]()
    var movieYears = [String]()
    
    typealias JSONObj = [String : AnyObject]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getMovieData();
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieTitles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = movieTitles[indexPath.row]
        
        cell.titleLabel.text = self.movieYears[indexPath.row]
        
        return cell
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
                    movieTitles.append(movie["Title"] as! String)
                    movieYears.append(movie["Year"] as! String)
                    
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
