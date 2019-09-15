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
    
    var tripId: UUID! // store the current id
    var tripTitle = "" // for fast reaction on trip title
    var tripModel: TripModel? // and the current model
    var sectionHeaderHeight: CGFloat = 0.0 // the height of header table stored
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = tripTitle
        
        tableView.dataSource = self
        tableView.delegate = self
        
        TripFunctions.readTrip(by: tripId) { [weak self] (model) in
            guard let self = self else { return } // swift 4.2
            // if the self exists then
            self.tripModel = model
            
            guard let model = model else { return } // swift 4.2
            self.backgroundImageView.image = model.image
            self.tableView.reloadData()
        }
        sectionHeaderHeight = tableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.Identifier)?.bounds.height ?? 0
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
    
}
