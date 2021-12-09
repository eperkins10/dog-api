//
//  DogImageViewController.swift
//  RandomDog
//
//  Created by Ethan Perkins on 12/2/21.
//

import UIKit

class DogImageViewController: UIViewController {
    
    var dog: Dog?
    
    
    @IBOutlet weak var dogImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func fetchImageAndUpdateViews(with dog: Dog) {
        DogController.fetchImage(for: dog) { (result) in
            DispatchQueue.main.async {
                switch result {
                
                case .success(let dog):
                    self.dogImageView.image = dog
                case .failure(let error):
                    print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")

                }
            }
        }
    }
    

    @IBAction func newDogButtonPressed(_ sender: Any) {
        
        DogController.fetchDog { (result) in
            switch result {
            
            case .success(let dog):
                self.fetchImageAndUpdateViews(with: dog)
            case .failure(let error):
                print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
            }
        }
        

    }
    

}
