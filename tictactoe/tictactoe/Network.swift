//
//  Network.swift
//  tictactoe
//
//  Created by Andrew Carvajal on 9/10/18.
//  Copyright © 2018 Tendigi. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

class Network: NSObject {
    
    static let shared = Network()
    fileprivate override init() {}
    
    var peopleCollectionRef: CollectionReference!
    var colorsCollectionRef: CollectionReference!
    var currentGameDocumentRef: DocumentReference!
    var peopleListener: ListenerRegistration?
    var colorsListener: ListenerRegistration?
    var currentGameListener: ListenerRegistration?
    var colors = [String: String]()
    var thisPersonsColor: String?
    var thisPersonsName: String?
    var currentGame = [String: String]()
    
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
    
    func updateFirestoreRefs() {
        peopleCollectionRef = Firestore.firestore().collection("people")
        colorsCollectionRef = Firestore.firestore().collection("colors")
        currentGameDocumentRef = Firestore.firestore().collection("games").document("currentGame")
    }
    
    func updateCurrentGameListenerAndSingleton(completion: @escaping () -> Void) {
        updateFirestoreRefs()
        currentGameListener = currentGameDocumentRef.addSnapshotListener({ (snapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let snapshot = snapshot else { return }
            let square = snapshot.documentID
            guard let documentData = snapshot.data() else { return }
            guard let played = documentData[square] as? String else { return }
            self.currentGame[square] = played
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "CurrentGameUpdated"), object: nil)
            completion()
        })
    }
    
    func updateSquare(_ square: String, with played: String, completion: @escaping () -> Void) {
        currentGameDocumentRef.updateData([square: played]) { (error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("\(square) is now \(played).")
                self.currentGame[square] = played
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "CurrentGameUpdated"), object: nil)
                completion()
            }
        }
    }
    
    func updateColorsListenerAndSingleton(completion: @escaping () -> Void) {
        updateFirestoreRefs()
        colorsListener = colorsCollectionRef.addSnapshotListener({ (snapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let snapshot = snapshot else { return }
            if !snapshot.isEmpty {
                for document in snapshot.documents {
                    let documentData = document.data()
                    let color = document.documentID
                    guard let person = documentData["name"] as? String else { return }
                    self.colors[color] = person
                }
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ColorsUpdated"), object: nil)
                completion()
            }
        })
    }
    
    func updateColor(_ color: String, with name: String, completion: @escaping () -> Void) {
        colorsCollectionRef.document(color).updateData(["name": name]) { (error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("\(name) is now \(color).")
                completion()
            }
        }
    }
    
//    func updateImageForPerson(_ imageURL: String, completionHandler: @escaping () -> Void) {
//        let storageRef = Storage.storage().reference(forURL: imageURL)
//    }
}
