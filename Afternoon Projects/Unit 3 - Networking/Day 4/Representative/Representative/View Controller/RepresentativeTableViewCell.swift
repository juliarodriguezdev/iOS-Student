//
//  RepresentativeTableViewCell.swift
//  Representative
//
//  Created by Julia Rodriguez on 6/27/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import UIKit

class RepresentativeTableViewCell: UITableViewCell {

    var rep: Representative? {
        didSet{
            updateViews()
        }
    }
    
    @IBOutlet weak var nameText: UILabel!
    
    @IBOutlet weak var partyText: UILabel!
    
    @IBOutlet weak var districtText: UILabel!
    
    @IBOutlet weak var websiteText: UILabel!
    
    @IBOutlet weak var phoneNumberText: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateViews() {
        
        guard let rep = rep else { return }
        
        nameText.text = rep.name
        partyText.text = rep.party
        districtText.text = rep.district
        websiteText.text = "\(rep.link)"
        phoneNumberText.text = rep.phone
    }

}
