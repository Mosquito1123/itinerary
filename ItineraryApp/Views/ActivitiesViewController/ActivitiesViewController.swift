//
//  ActivitiesViewController.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 10/09/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import UIKit


class ActivitiesViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: PopupUIButton!
    
    var tripId: UUID! // store the current id
    var tripTitle = "" // for fast reaction on trip title
    var tripModel: TripModel? // and the current model
    var sectionHeaderHeight: CGFloat = 0.0 // the height of header table stored
    
    
    fileprivate func updateTableViewWithTripData() {
        TripFunctions.readTrip(by: tripId) { [weak self] (model) in
            guard let self = self else { return } // swift 4.2
            // if the self exists then
            self.tripModel = model
            
            guard let model = model else { return } // swift 4.2
            self.backgroundImageView.image = model.image
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = tripTitle
        addButton.addFloatingAndRoundedStyle()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        updateTableViewWithTripData()
        
        sectionHeaderHeight = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.Identifier)?.bounds.height ?? 0
    }
    
    // addButton Pressed
    @IBAction func addBtnPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Which would you like to add?", message: nil, preferredStyle: .actionSheet)
        
        let dayAction = UIAlertAction(title: "Day", style: .default, handler: handleAddDay)
        
        let activityAction = UIAlertAction(title: "Activity", style: .default, handler: handleAddActivity)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        if tripModel?.dayModels.count == 0 {
            activityAction.isEnabled = false // disable if there is no day
        }
        
        alert.addAction(dayAction)
        alert.addAction(activityAction)
        alert.addAction(cancelAction) // Cancel action is valid for iPhones
        alert.view.tintColor = Theme.tint
        alert.popoverPresentationController?.sourceView = sender // For iPads
        alert.popoverPresentationController?.sourceRect = CGRect(x: 0, y: -4, width: sender.bounds.width, height: sender.bounds.height) // For iPads
        
        present(alert, animated: true)
    }
    
    
    fileprivate func getTripIndex() -> Int! {
        return Data.tripModels.firstIndex(where: { (tripModel) -> Bool in
            tripModel.id  == tripId
        })
    }
    
    func handleAddDay(action: UIAlertAction) {
        let vc = AddDayViewController.getInstance() as! AddDayViewController
        vc.tripModel = tripModel
        vc.tripIndex = getTripIndex()
        
        vc.doneSaving = { [weak self] (dayModel) -> () in
            guard let self = self else { return }
            
            self.tripModel?.dayModels.append(dayModel)
            let indexArray = [self.tripModel?.dayModels.firstIndex(of: dayModel) ?? 0]
            
            self.tableView.insertSections(IndexSet(indexArray), with: UITableView.RowAnimation.automatic)
        }
        present(vc, animated: true)
    }
    
    func handleAddActivity(action: UIAlertAction) {
        let vc = AddActivityViewController.getInstance() as! AddActivityViewController
        vc.tripModel = tripModel
        vc.tripIndex = getTripIndex()
        
        vc.doneSaving = { [weak self] dayIndex, activityModel in
            guard let self = self else { return }
            
            self.tripModel?.dayModels[dayIndex].activityModels.append(activityModel)
            
            let row = (self.tripModel?.dayModels[dayIndex].activityModels.count)! - 1
            let indexPath = IndexPath(row: row, section: dayIndex)
            
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        present(vc, animated: true)
    }
    
}


extension ActivitiesViewController: UITableViewDataSource, UITableViewDelegate {
    
    // Numbers of rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel?.dayModels[section].activityModels.count ?? 0
    }
    
    // Cell View
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = (tripModel?.dayModels[indexPath.section].activityModels[indexPath.row])
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivitiesTableViewCell.Identifier) as! ActivitiesTableViewCell
        
        cell.setup(model: model!)
        
        return cell
    }
    
    // Number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return  tripModel?.dayModels.count ?? 0
    }
    
    // Header Cell View
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let dayModel = tripModel?.dayModels[section]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.Identifier) as! HeaderTableViewCell
        cell.setup(model: dayModel!)
        
        return cell.contentView
    }
    
    // Height for Header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return sectionHeaderHeight // the height
    }
    
    // Trailing Swipe Action (Delete Action)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let activityModel = tripModel!.dayModels[indexPath.section].activityModels[indexPath.row]
        
        // the actual delete button
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
            
            // Alert action
            let alertAction = UIAlertController(title: "Delete Activity", message: "Are you sure you want to delete this activity: \(activityModel.title)", preferredStyle: .alert)
            
            alertAction.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
                actionPerformed(false)
            }))
            
            alertAction.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in
                // Perform data
                ActivityFunction.deleteActivity(at: self.getTripIndex(), for: indexPath.section, using: activityModel) // delete data
                //self.tripModel!.dayModels[indexPath.section].activityModels.remove(at: indexPath.row) ??? idk why dont work
                tableView.deleteRows(at: [indexPath], with: .automatic) // delete dataView with animation
                actionPerformed(true) // disappear delete button after pressed
                
            }))
            
            self.present(alertAction, animated: true)
        }
        delete.image = #imageLiteral(resourceName: "delete_icon")
        
        
        return UISwipeActionsConfiguration(actions: [delete])
    }

}
