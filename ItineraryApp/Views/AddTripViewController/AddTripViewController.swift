//
//  AddTripViewController.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 02/09/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import UIKit
import Photos


class AddTripViewController: UIViewController {
    
    @IBOutlet weak var addTripLabel: UILabel!
    @IBOutlet weak var titleTripTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var doneSaving: (() -> ())? // a variable with type function
    var tripIndexToEdit: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addTripLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        imageView.layer.cornerRadius = 10 // Add corner radius
        
        // Add dropshadow on title label
        addTripLabel.layer.shadowOpacity = 1
        addTripLabel.layer.shadowColor = UIColor.white.cgColor
        addTripLabel.layer.shadowOffset = CGSize.zero
        addTripLabel.layer.shadowRadius = 5
        
        // Verify if the index(element/member) already exists
        if let index = tripIndexToEdit {
            let trip = Data.tripModels[index]
            titleTripTextField.text = trip.title
            imageView.image = trip.image
            addTripLabel.text = "Edit Trip"
        }
    }
    
    // Save Button Pressed
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        
        titleTripTextField.rightViewMode = .never
        
        guard titleTripTextField.text != "", let newTripTitle = titleTripTextField.text else {
            
            let alertImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 25))
            alertImageView.image = #imageLiteral(resourceName: "warning_icon")
            alertImageView.contentMode = .scaleAspectFit
            
            titleTripTextField.rightView = alertImageView
            
            titleTripTextField.rightViewMode = .always
            return
        }
        if let index = tripIndexToEdit {
            TripFunctions.updateTrip(at: index, title: newTripTitle, image: imageView.image)
        } else {
        // create a trip with the title of text field
        TripFunctions.createTrip(tripModel: TripModel(title: newTripTitle, image: imageView.image))
        }
        
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
    
    // Cancel Button Pressed
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    fileprivate func presentImagePickerController() {
        let myPickerController = UIImagePickerController()
        
        myPickerController.delegate = self
        myPickerController.allowsEditing = true // able to editing
        myPickerController.sourceType = .photoLibrary
        self.present(myPickerController, animated: true)
    }
    
    // Add photo button pressed
    @IBAction func addPhoto(_ sender: UIButton) {
        
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status {
                
            case .authorized:
                self.presentImagePickerController()
                
            case .notDetermined:
                if status == PHAuthorizationStatus.authorized{
                    self.presentImagePickerController()
                }
                
            case .restricted:
                let alert = UIAlertController(title: "Photo Library Restricted", message: "Photo Library acces is restricted and cannot be accesed.", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
            case .denied:
                let alert = UIAlertController(title: "Photo Library Acces Denied", message: "Photo Library acces was previosly denied. Please update your Settings if you wish to change this.    ", preferredStyle: .alert)
                let goToSettingsAction = UIAlertAction(title: "Go to Settings", style: .default) { (action) in
                    DispatchQueue.main.async {
                        let url = URL(string: UIApplication.openSettingsURLString)!
                        UIApplication.shared.open(url, options: [ : ])
                    }
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                
                alert.addAction(goToSettingsAction)
                alert.addAction(cancelAction)
                self.present(alert, animated: true)
                
            @unknown default:
                let alert = UIAlertController(title: "Unknown", message: "Unknown error!", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default)
                alert.addAction(okAction)
                self.present(alert, animated: true)
                
            }
        }
    }
    
}



extension AddTripViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // if the image is edited then
        if let image = info[.editedImage] as? UIImage {
            self.imageView.image = image
        } else  // when we have a image, then the image is stored in 'image' variable
            if let image = info[.originalImage] as? UIImage {
                self.imageView.image = image
        }
        
        
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
