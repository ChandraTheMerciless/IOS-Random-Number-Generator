//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Asar, Chandra on 11/20/16.
//  Copyright © 2016 Asar, Chandra. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieYear: UILabel!
    @IBOutlet var moviePoster: UIImage!
    
    var movieTitleText = String()
    var movieYearText = String()
    var moviePosterLink = String()
    
    //var movieData: movieData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieTitle.text = movieTitleText
        movieYear.text = movieYearText
        
     //   var getImage = UIImage(data: NSData(contentsOf: URL(string:moviePosterLink)!) as Data)
        
        
        let url = NSURL(string:moviePosterLink)
        var data = NSData(contentsOf:url! as URL)
       // if data! = nil {
            moviePoster = UIImage(data:data! as Data)
        //}

      //  if let url = NSURL(string: moviePosterLink) {
      //      if let data = NSData(contentsOf: url as URL) {
      //          moviePoster = UIImage(data: data as Data)
      //      }
      //  }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
