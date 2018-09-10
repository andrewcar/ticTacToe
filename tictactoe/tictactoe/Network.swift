//
//  Network.swift
//  tictactoe
//
//  Created by Andrew Carvajal on 9/10/18.
//  Copyright © 2018 Tendigi. All rights reserved.
//

import Foundation

class Network: NSObject {
    
    static let shared = Network()
    fileprivate override init() {}
    
    func set(colors: [String]) {
        guard let url = URL(string: "http://proxy.private.tendigi.com/dumbotron/set") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: ["colors": colors])
            urlRequest.httpBody = jsonData
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                }.resume()
        } catch {
            print(error.localizedDescription)
        }
    }
}
