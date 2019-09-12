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
    var tripModel: TripModel? // and the current model
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        TripFunctions.readTrip(by: tripId) { [weak self] (model) in
            guard let self = self else { return } // swift 4.2
            // if the self exists then
            self.tripModel = model
            
            guard let model = model else { return } // swift 4.2
            self.title = model.title
            self.backgroundImageView.image = model.image
            self.tableView.reloadData()
        }
    }
    
}

extension ActivitiesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tripModel?.dayModels[section].activityModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            cell  = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.textLabel?.text = tripModel?.dayModels[indexPath.section].activityModels[indexPath.row].title
        
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  tripModel?.dayModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = tripModel?.dayModels[section].title ?? ""
        let subtitle = tripModel?.dayModels[section].subtitle ?? ""
        
        return "\(title) - \(subtitle)"
    }
    
}
