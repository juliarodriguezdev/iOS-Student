//
//  StateListTableViewController.swift
//  Representative
//
//  Created by Julia Rodriguez on 6/27/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import UIKit

class StateListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return States.all.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell", for: indexPath)
        
        let state = States.all[indexPath.row]
        cell.textLabel?.text = state
        // Configure the cell...

        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Identifier
        if segue.identifier == "toDetailVC"{
            // Index
            guard let indexPath = tableView.indexPathForSelectedRow,
            // Destination
                let destinationVC = segue.destination as? StateDetailTableViewController else { return }
            // Object to send
            let state = States.all[indexPath.row]
            
            destinationVC.state = state
        }
    }
    

}
