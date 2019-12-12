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
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var subtitleDayTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var doneSaving: ((DayModel) -> ())? // a variable with type function
    var tripIndex: Int!
    var tripModel: TripModel!
    
    
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
        if alreadyExists(datePicker.date) {
            let alert = UIAlertController(title: "Day Already Exists", message: "Choose another date", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel)
            
            alert.addAction(okAction)
            present(alert, animated: true)
            return
        }
        
        let dayModel = DayModel(title: datePicker.date, subtitle: subtitleDayTextField.text ?? "", data: nil)
        //DayFunctions.createDay(at: tripIndex, using: dayModel)  ??? idk what is the problem
        
        if let doneSaving = doneSaving {
            doneSaving(dayModel)
        }
        dismiss(animated: true)
    }
    
    // If a date already exists return true
    func alreadyExists(_ date: Date) -> Bool {
        if tripModel.dayModels.contains(where: { (dayModel) -> Bool in
            
            return dayModel.title.mediumDate() == date.mediumDate() })
        {
            return true
        }
        return false
    }
    
    // Done Action for text field (description)
    @IBAction func doneAction(_ sender: UITextField) {
        sender.resignFirstResponder() // dismiss the keyboard in your case
    }
    
}
