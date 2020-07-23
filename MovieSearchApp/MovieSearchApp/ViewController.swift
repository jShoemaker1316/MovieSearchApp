//
//  ViewController.swift
//  MovieSearchApp
//
//  Created by Jonathan Shoemaker on 7/22/20.
//  Copyright © 2020 JonathanShoemaker. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    @IBOutlet var field: UITextField!
    
    var movies = [Movie]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        field.delegate = self
    }
    
 //MARK: Field
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchMovies()
        return true
    }
    
    func searchMovies() {
        field.resignFirstResponder()
        
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        URLSession.shared.dataTask(with: URL(string:"https://api.themoviedb.org/3/movie/550?api_key=e458b03c0d11ea1f15006ffa6421e821"), completionHandler: { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            //convert the data
            
            //update movies array
            
            //refresh our table
            
            }).resume()
        
    }
    
//MARK: Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //show movie details
    }


}
//create the struct
struct MovieResult: Codable {
    let Search: [Movie]
    
}

struct Movie: Codable {
    let title: String
    let release_date: String
    let imdb_id: String
   // let Type
    let poster_path: String
    
    private enum CodingKeys: String, CodingKey {
        case title, release_date = "Release Date", imdb_id = "imdbID", poster_path = "posterPath"
        
    }
}

