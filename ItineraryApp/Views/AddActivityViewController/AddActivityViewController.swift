//
//  AddActivityViewController.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 25/09/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import UIKit


class AddActivityViewController: UITableViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dayPickerView: UIPickerView!
    @IBOutlet var activityTypeButtons: [UIButton]!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var subtitleTextField: UITextField!

    
    var doneSaving: ((Int, ActivityModel) -> ())? // a variable with type function
    var tripIndex: Int! // Needed for saving
    var tripModel: TripModel! // Needed for showing days in picker view
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        
        dayPickerView.dataSource = self
        dayPickerView.delegate = self
    }
    
    @IBAction func cancelPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        guard titleTextField.hasValue, let newTitle = titleTextField.text else { return }
        let activityType: ActivityType = getSelectedActivityType()
        
        let dayIndex = dayPickerView.selectedRow(inComponent: 0)
        let activityModel = ActivityModel(title: newTitle, subtitle: subtitleTextField.text ?? "", activityType: activityType)
        
        //ActivityFunction.createActivity(at: tripIndex, for: dayIndex, using: activityModel) ??? idk what is the problem
        
        if let doneSaving = doneSaving {
            doneSaving(dayIndex, activityModel)
        }
        
        dismiss(animated: true)
    }
    
    func getSelectedActivityType() -> ActivityType {
        
        for (index, button) in activityTypeButtons.enumerated() {
            if button.tintColor == Theme.tint {
                return ActivityType(rawValue: index) ?? .auto
            }
        }
        return .auto
    }
    
    @IBAction func activityTypeSelected(_ sender: UIButton) {
        activityTypeButtons.forEach({ $0.tintColor = Theme.accent })
        
        sender.tintColor = Theme.tint
        
    }
    
    // Done Action for text field
    @IBAction func doneAction(_ sender: UITextField) {
        sender.resignFirstResponder() // dismiss the keyboard in your case
    }
    
}


extension AddActivityViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tripModel.dayModels.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tripModel.dayModels[row].title.mediumDate()
    }
    
}
