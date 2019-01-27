//
//  ViewController.swift
//  Flix
//
//  Created by Miguel Barba on 1/15/19.
//  Copyright © 2019 MBH. All rights reserved.
//

import UIKit
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var movieTableView: UITableView!
    
    var results : [[String:Any]] = []
    
    let movieSegueIdentifier = "ShowMovieSegue"
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        movieTableView.dataSource = self
        movieTableView.delegate = self
        //movieTableView.reloadData()
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let resultDictionary = dataDictionary["results"] as! [[String:Any]]
                self.results = resultDictionary
                
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data
                self.movieTableView.reloadData()
            }
        }
        movieTableView.reloadData()
        task.resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        print()
        let movie = results[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        
        cell.MovieLabel.text = title
        cell.MovieSummary.text = synopsis
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        cell.MovieImage.af_setImage(withURL: posterUrl!)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the index path from the cell that was tapped
        let indexPath = movieTableView.indexPathForSelectedRow
        // Get the Row of the Index Path and set as index
        let index = indexPath?.row as! Int
        // Get in touch with the DetailViewController
        let movieViewController = segue.destination as! MovieViewController
        // Pass on the data to the Detail ViewController by setting it's indexPathRow value
        
        let movie = results[index]
        movieViewController.movieTitle = movie["title"] as! String
        movieViewController.movieSummary = movie["overview"] as! String
        movieViewController.movieDate = movie["release_date"] as! String
        print(movie)
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let backdropPath = movie["backdrop_path"] as! String
        movieViewController.moviePathForSmallPhoto = baseUrl + posterPath
        movieViewController.moviePathForPhoto = baseUrl + backdropPath
        
        
        
        
    }
    


}

