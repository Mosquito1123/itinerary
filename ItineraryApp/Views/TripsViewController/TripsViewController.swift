//
//  TripsViewController.swift
//  ItineraryApp
//
//  Created by Cosmin Iulian on 27/08/2019.
//  Copyright © 2019 Cosmin Iulian. All rights reserved.
//
import UIKit


class TripsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTripsButton: UIButton!
    @IBOutlet var helpView: UIVisualEffectView!
    
    var tripIndexToEdit: Int?
    var seenHelpView = "seenHelpView"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        TripFunctions.readTrip(completion: { [unowned self] in
            self.tableView.reloadData()
            
            if Data.tripModels.count > 0 { // if exists row then show up the help view
                if UserDefaults.standard.bool(forKey: self.seenHelpView) == false{ // if the help view was seen
                    //self.view.addSubview(self.helpView)    // set the    !!!!!!
                    //self.helpView.frame = self.view.frame //     help view
                }
            }
        })
        
        view.backgroundColor = Theme.background
        
        addTripsButton.backgroundColor = Theme.tint
        addTripsButton.addFloatingAndRoundedStyle()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // ! !
        
        if segue.identifier == "toAddTripSegue" {
            let popup = segue.destination as! AddTripViewController
            popup.tripIndexToEdit = self.tripIndexToEdit
            
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
            tripIndexToEdit = nil // reset the value of index to edit after close the popup
        }
        
    }
    
    @IBAction func closeInfoBtn(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.helpView.alpha = 0
        }) { (succes) in
            self.helpView.removeFromSuperview()
            UserDefaults.standard.set(true, forKey: self.seenHelpView)
        }
    }
    
    
}


extension TripsViewController: UITableViewDataSource, UITableViewDelegate {
    
    // the number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    // the content of cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TripsTableViewCell.Identifier) as! TripsTableViewCell // for optimize I use
        // dequeueReusableCell
        
        cell.setup(tripModel: Data.tripModels[indexPath.row])
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 160 // the heigth of the row
    }
    
    // Trailing Swipe Action (Delete Action)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let trip = Data.tripModels[indexPath.row]
        
        // the actual delete button
        let delete = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: @escaping (Bool) -> ()) in
            
            // Alert action
            let alertAction = UIAlertController(title: "Delete Trip", message: "Are you sure you want to delete this trip: \(trip.title)", preferredStyle: .alert)
            
            alertAction.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) in
                actionPerformed(false)
            }))
            
            alertAction.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (alertAction) in
                // Perform data
                TripFunctions.deleteTrip(index: indexPath.row) // delete data
                tableView.deleteRows(at: [indexPath], with: .automatic) // delete dataView with animation
                actionPerformed(true) // disappear delete button after pressed
                
            }))
            
            self.present(alertAction, animated: true)
        }
        delete.image = #imageLiteral(resourceName: "delete_icon")
        
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    // Leading Swipe Action (Edit Action)
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Edit") { (contextualAction, view, actionPerformed:(Bool) -> ()) in
            self.tripIndexToEdit = indexPath.row
            self.performSegue(withIdentifier: "toAddTripSegue", sender: nil)
            actionPerformed(true)
        }
        edit.image = #imageLiteral(resourceName: "edit_icon")
        edit.backgroundColor = UIColor(named: "Edit-Color")
        
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
    /* row selected function */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //Extract the current trip
        let trip = Data.tripModels[indexPath.row]
        
        /* Navigate to ActivitiesViewController */
        let storyboard = UIStoryboard(name: String(describing: ActivitiesViewController.self), bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! ActivitiesViewController
        vc.tripId = trip.id
        vc.tripTitle = trip.title
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
