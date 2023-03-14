//
//  PostersViewController.swift
//  Flixster 3
//
//  Created by Nhi Huynh on 3/12/23.
//

import UIKit
import Nuke

class PostersViewController: UIViewController, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            posters.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath) as! PosterCell

                // Use the indexPath.item to index into the albums array to get the corresponding album
                let poster = posters[indexPath.item]

                // Get the artwork image url
                let imageUrl = "\(poster.baseUrlString)\(poster.poster_path)"

                // Set the image on the image view of the cell
                cell.configure(with: poster)
                Nuke.loadImage(with: URL(string: imageUrl)!, into: cell.PosterImageView)

                return cell
        }

    var posters: [Poster] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        // Do any additional setup after loading the view.

        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=c76416a6fc08db48d5ae035ffbce486a")!
        let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in

            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }

            // Create a JSON Decoder
            let decoder = JSONDecoder()
            do {
                // Try to parse the response into our custom model
                let response = try decoder.decode(PosterSearchResponse.self, from: data)
                let posters = response.results
                print(posters)
                DispatchQueue.main.async {
                    self?.posters = posters
                    self?.collectionView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }

        // Initiate the network request
        task.resume()
        
        print(posters)
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout

        // The minimum spacing between adjacent cells (left / right, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumInteritemSpacing = 0

        // The minimum spacing between adjacent cells (top / bottom, in vertical scrolling collection)
        // Set this to taste.
        layout.minimumLineSpacing = 0

        // Set this to however many columns you want to show in the collection.
        let numberOfColumns: CGFloat = 3
        let numberOfRows: CGFloat = 4

        // Calculate the width each cell need to be to fit the number of columns, taking into account the spacing between cells.
        //let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns
        let width = (collectionView.bounds.width) / numberOfColumns
        let height = (collectionView.bounds.height) / numberOfRows

        // Set the size that each item/cell should display at
        layout.itemSize = CGSize(width: width, height: height)
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // TODO: Pt 1 - Pass the selected track to the detail view controller
        // Get the cell that triggered the segue
        if let cell = sender as? UICollectionViewCell,
           
            // Get the index path of the cell from the table view
           let indexPath = collectionView.indexPath(for: cell),
           
            // Get the detail view controller
           let posterDetailViewController = segue.destination as? PosterDetailViewController {
            
            // Use the index path to get the associated track
            //let poster = poster[indexPath.row]
            
            // Use the index path to get the associated track
            let poster = posters[indexPath.item]
            
            
            
            // Set the track on the detail view controller
            posterDetailViewController.poster = poster
        }
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
