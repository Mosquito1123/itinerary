//
//  AddTripViewController.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 02/09/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import UIKit


class AddTripViewController: UIViewController {
    
    @IBOutlet weak var addTripLabel: UILabel!
    @IBOutlet weak var titleTripTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    var doneSaving: (() -> ())? // a variable with type function
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addTripLabel.font = UIFont(name: Theme.mainFontName, size: 24)
    }
    
    
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        // create a trip with the title of text field
        TripFunctions.createTrip(tripModel: TripModel(title: titleTripTextField.text!))
        
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
    
    
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
}
