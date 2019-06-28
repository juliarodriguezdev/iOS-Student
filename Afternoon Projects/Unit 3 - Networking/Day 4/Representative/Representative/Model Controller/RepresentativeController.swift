//
//  RepresentativeController.swift
//  Representative
//
//  Created by Julia Rodriguez on 6/27/19.
//  Copyright © 2019 DevMtnStudent. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    // http://whoismyrepresentative.com/getall_reps_bystate.php?state=CA
    static var baseURL = URL(string: "http://whoismyrepresentative.com")
    
    static func searchRepresentatives(forState state: String, completion: @escaping ([Representative]) -> Void) {
        
        guard var url = baseURL else { completion([]); return}
        
        url.appendPathComponent("getall_reps_bystate.php")
        
        // Add query items for search
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        // Query: state=CA
        let stateSearchQuery = URLQueryItem(name: "state", value: state)
        // Query: output=json
        
        let jsonSearchQuery = URLQueryItem(name: "output", value: "json")
        
        // final appending & query items
        components?.queryItems = [stateSearchQuery, jsonSearchQuery]
        
        // components.url = finalURL (all components + queryItems)
        guard let finalURL = components?.url else { completion([]);return }
       // Debugging
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            
            if let error = error {
                print("There is an error collecting data \(error.localizedDescription)")
                completion([])
                return
            }
            guard let data = data,
            let newData = String(data: data, encoding: .ascii)?.data(using:.utf8)
            
                else { completion([]); return }
            
            do {
                let decoder = JSONDecoder()
                let topLevelJSON = try decoder.decode(TopLevelJSON.self, from: newData)
                completion(topLevelJSON.results)
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
                completion([])
                return
            }
        }.resume()
        
        
        
    }
}
