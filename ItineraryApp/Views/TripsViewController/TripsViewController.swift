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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        TripFunctions.readTrip(completion: { [weak self] in
            self?.tableView.reloadData()
        })
        
        view.backgroundColor = Theme.background
        
        addTripsButton.backgroundColor = Theme.tint
        addTripsButton.addFloatingAndRoundedStyle()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // ! !
        
        if segue.identifier == "toAddTripSegue" {
            let popup = segue.destination as! AddTripViewController
            
            popup.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TripsTableViewCell // for optimize I use
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
        delete.image = UIImage(named: "delete_icon")
        
        
        
        return UISwipeActionsConfiguration(actions: [delete])
    }
}
