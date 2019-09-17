//
//  AddDayViewController.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 16/09/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import UIKit


class AddDayViewController: UIViewController {

    @IBOutlet weak var addDayLabel: UILabel!
    @IBOutlet weak var titleDayTextField: UITextField!
    @IBOutlet weak var subtitleDayTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!

    
    var doneSaving: (() -> ())? // a variable with type function
    var tripIndexToEdit: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        addDayLabel.font = UIFont(name: Theme.mainFontName, size: 24)
    }
    
    // Cancel Button Pressed
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // Save Button Pressed
    @IBAction func saveBtnPressed(_ sender: UIButton) {
        
        guard titleDayTextField.hasValue, let newDayTitle = titleDayTextField.text else { return }
        
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }

}
