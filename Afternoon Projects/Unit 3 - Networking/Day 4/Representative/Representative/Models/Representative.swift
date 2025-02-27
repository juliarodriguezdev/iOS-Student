//
//  Representative.swift
//  Representative
//
//  Created by Julia Rodriguez on 6/27/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import Foundation

struct TopLevelJSON: Codable {
    let results: [Representative]
}

struct Representative: Codable {
    
    let name: String
    let party: String
    let state: String
    let district: String
    let phone: String
    let office: String
    let link: URL
    
}
