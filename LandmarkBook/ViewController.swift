//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Ayub Ali on 2021-03-12.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var landMarks = [String]()
    var landmarksImages = [UIImage]()
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //string name of images in assets folders
        
        landMarks.append("colosseum")
        landMarks.append("pyramids")
        landMarks.append("sahara deserts")
        landMarks.append("underwater reef")
        
        
        
        //image array
        
        landmarksImages.append(UIImage(named: "colosseum")!)
        landmarksImages.append(UIImage(named: "pyramids")!)
        landmarksImages.append(UIImage(named: "sahara deserts")!)
        landmarksImages.append(UIImage(named: "underwater reef")!)
        
        //navigation title
        navigationItem.title = "Landmark Book"
        
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            landMarks.remove(at: indexPath.row)
            landmarksImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = landMarks[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarks.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landMarks[indexPath.row]
        chosenLandmarkImage = landmarksImages[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController"{
            let destinationVC = segue.destination as! ImageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }

}

