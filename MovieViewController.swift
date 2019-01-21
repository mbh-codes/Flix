//
//  MovieViewController.swift
//  Flix
//
//  Created by Miguel Barba on 1/17/19.
//  Copyright © 2019 MBH. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieViewController: UIViewController {

    @IBOutlet weak var MoviePhoto: UIImageView!
    
    @IBOutlet weak var MovieTitle: UILabel!
    @IBOutlet weak var MovieSummary: UILabel!
    
    var movieTitle = String()
    var movieSummary = String()
    var moviePath = String()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        MovieTitle.text = movieTitle
        MovieSummary.text = movieSummary
        MoviePhoto.af_setImage(withURL: (URL(string: moviePath))!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
