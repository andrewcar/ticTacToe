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
    var gamesCollectionRef: CollectionReference!
    var waitingRoomCollectionRef: CollectionReference!
    var peopleListener: ListenerRegistration?
    var colorsListener: ListenerRegistration?
    var gamesListener: ListenerRegistration?
    var waitingRoomListener: ListenerRegistration?
    var currentGameSquaresListener: ListenerRegistration?
    var currentGameSymbolsListener: ListenerRegistration?
    var colors = [String: String]()
    var thisPersonsColor: String?
    var thisPersonsName: String?
    var games = [String: Any]()
    var currentGameSquares = [String: [String: String]]()
    var currentGameSymbol: String?
    var enemyName: String?
    var enemySymbol: String?
    var challenger: String?
    
    func putBobRossOnTheDumbotron() {
        guard let url = URL(string: "http://proxy.private.tendigi.com/dumbotron/image") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: ["image": UIImage(named: "Bob")])
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
        gamesCollectionRef = Firestore.firestore().collection("games")
    }
    
    func updateCurrentGameSquaresListenerAndSingleton(game: String, completion: @escaping () -> Void) {
        updateFirestoreRefs()
        currentGameSquaresListener = gamesCollectionRef.document(game).collection("squares").addSnapshotListener({ (squaresSnapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            guard let squaresSnapshot = squaresSnapshot else { return }
            
            if !squaresSnapshot.isEmpty {
                guard let squaresDocument = squaresSnapshot.documents.first else { return }
                let squaresDocumentData = squaresDocument.data()
                guard let square1 = squaresDocumentData["square1"] as? [String: String] else { return }
                guard let square2 = squaresDocumentData["square2"] as? [String: String] else { return }
                guard let square3 = squaresDocumentData["square3"] as? [String: String] else { return }
                guard let square4 = squaresDocumentData["square4"] as? [String: String] else { return }
                guard let square5 = squaresDocumentData["square5"] as? [String: String] else { return }
                guard let square6 = squaresDocumentData["square6"] as? [String: String] else { return }
                guard let square7 = squaresDocumentData["square7"] as? [String: String] else { return }
                guard let square8 = squaresDocumentData["square8"] as? [String: String] else { return }
                guard let square9 = squaresDocumentData["square9"] as? [String: String] else { return }
                self.currentGameSquares = ["square1": square1, "square2": square2, "square3": square3, "square4": square4, "square5": square5, "square6": square6, "square7": square7, "square8": square8, "square9": square9]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "CurrentGameSquaresUpdated"), object: nil)
                completion()
            }
        })
    }
    
    func resetGame(completion: @escaping () -> Void) {
        updateFirestoreRefs()
        gamesCollectionRef.document("Andrew_vs_Bob_1").collection("squares").getDocuments { (snapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let snapshot = snapshot else { return }
                guard let squares = snapshot.documents.first else { return }
                let empty = ["0": "0"]
                self.gamesCollectionRef.document("Andrew_vs_Bob_1").collection("squares").document(squares.documentID).setData(["square1": empty, "square2": empty, "square3": empty, "square4": empty, "square5": empty, "square6": empty, "square7": empty, "square8": empty, "square9": empty], completion: { (error) in
                    if let error = error {
                        print(error.localizedDescription)
                    }
                    var colors = [String]()
                    for _ in 1...100 {
                        colors.append(Color.black)
                    }
                    self.set(colors: colors)
                    completion()
                })
            }
        }
    }
    
    func updateSquare(game: String, square: String, symbol: String, color: String, completion: @escaping () -> Void) {
        gamesCollectionRef.document(game).collection("squares").getDocuments(completion: { (snapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let snapshot = snapshot else { return }
                guard let document = snapshot.documents.first else { return }
                let documentID = document.documentID
                self.gamesCollectionRef.document(game).collection("squares").document(documentID).updateData([square: [symbol: color]], completion: { (error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        print("\(square) is now \(symbol)")
                        self.currentGameSquares[square] = [symbol: color]
                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "CurrentGameSquaresUpdated"), object: nil)
                        completion()
                    }
                })
            }
        })
    }
    
    func setGreenToZero() {
        colorsCollectionRef.document("green").updateData(["name": "0"]) { (error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("SET GREEN TO ZERO")
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
}
