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
//        waitingRoomCollectionRef = Firestore.firestore().collection("waitingRoom")
    }
    
//    func updateGamesListenerAndSingleton(completion: @escaping () -> Void) {
//        updateFirestoreRefs()
//        gamesListener = gamesCollectionRef.addSnapshotListener({ (snapshot, error) in
//            if let error = error {
//                print(error.localizedDescription)
//            } else {
//                guard let snapshot = snapshot else { return }
//                if !snapshot.documents.isEmpty {
//                    for document in snapshot.documents {
//                        self.games[document.documentID] = "0"
//                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "GamesUpdated"), object: nil)
//                    }
//                }
//            }
//        })
//    }
    
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
                guard let square1 = squaresDocumentData["squares1"] as? [String: String] else { return }
                guard let square2 = squaresDocumentData["squares2"] as? [String: String] else { return }
                guard let square3 = squaresDocumentData["squares3"] as? [String: String] else { return }
                guard let square4 = squaresDocumentData["squares4"] as? [String: String] else { return }
                guard let square5 = squaresDocumentData["squares5"] as? [String: String] else { return }
                guard let square6 = squaresDocumentData["squares6"] as? [String: String] else { return }
                guard let square7 = squaresDocumentData["squares7"] as? [String: String] else { return }
                guard let square8 = squaresDocumentData["squares8"] as? [String: String] else { return }
                guard let square9 = squaresDocumentData["squares9"] as? [String: String] else { return }
                self.currentGameSquares = ["square1": square1, "square2": square2, "square3": square3, "square4": square4, "square5": square5, "square6": square6, "square7": square7, "square8": square8, "square9": square9]
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "CurrentGameSquaresUpdated"), object: nil)
                completion()
            }
        })
    }
    
//    func updateCurrentGameSymbolsListenerAndSingleton(game: String, completion: @escaping () -> Void) {
//        updateFirestoreRefs()
//        currentGameSymbolsListener = gamesCollectionRef.document(game).collection("symbols").addSnapshotListener({ (symbolsSnapshot, error) in
//            if let error = error {
//                print(error.localizedDescription)
//            }
//            guard let symbolsSnapshot = symbolsSnapshot else { return }
//
//            if !symbolsSnapshot.isEmpty {
//                guard let symbolsDocument = symbolsSnapshot.documents.first else { return }
//                let symbolsDocumentData = symbolsDocument.data()
//                guard let playerX = symbolsDocumentData["x"] as? String else { return }
//                guard let playerO = symbolsDocumentData["o"] as? String else { return }
//                self.currentGameSymbols = ["x": playerX, "o": playerO]
//                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "CurrentGameSymbolsUpdated"), object: nil)
//                completion()
//            }
//        })
//    }
    
//    func updateWaitingRoomListenerAndSingleton(completion: @escaping () -> Void) {
//        updateFirestoreRefs()
//        waitingRoomCollectionRef.getDocuments { (snapshot, error) in
//            if let error = error {
//                print(error.localizedDescription)
//            } else {
//                guard let snapshot = snapshot else { return }
//                if !snapshot.documents.isEmpty {
//                    for personDocument in snapshot.documents {
//                        let personDocumentData = personDocument.data()
//                        guard let name = personDocumentData["name"] as? String else { return }
//                        guard let myName = self.thisPersonsName else { return }
//                        if myName != self.enemyName {
//                            self.enemyName = name
//                            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "SomeoneJoinedWaitingRoom"), object: nil)
//                        }
//                    }
//                }
//            }
//        }
//    }
//
//    func updateWaitingRoom(name: String, completion: @escaping () -> Void) {
//        waitingRoomCollectionRef.document(name).setData(["nothing": "nothing"]) { (error) in
//            if let error = error {
//                print(error.localizedDescription)
//            } else {
//                print("\(name) joined the waiting room")
//            }
//        }
//    }
    
//    func getGameNumber(person1: String, person2: String, completion: @escaping (Int) -> Void) {
//        gamesCollectionRef.getDocuments { (snapshot, error) in
//            if let error = error {
//                print(error.localizedDescription)
//            } else {
//                guard let snapshot = snapshot else { return }
//                if !snapshot.documents.isEmpty {
//                    for document in snapshot.documents {
//                        if document.documentID.contains(person1) && document.documentID.contains(person2) {
//                            let numberString = document.documentID.suffix(1)
//                            guard let number = Int(numberString) else { return }
//                            completion(number)
//                        }
//                    }
//                }
//            }
//        }
//    }
    
//    func updateGame(game: String, completion: @escaping () -> Void) {
//        gamesCollectionRef.document(game).setData(["nothing": "nothing"]) { (error) in
//            if let error = error {
//                print(error.localizedDescription)
//            } else {
//                print("\(game) has begun!")
//            }
//        }
//    }
    
    func resetGame(completion: @escaping () -> Void) {
        gamesCollectionRef.document("Andrew_vs_Bob_1").collection("squares").getDocuments { (snapshot, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let snapshot = snapshot else { return }
                if !snapshot.documents.isEmpty {
                    for document in snapshot.documents {
                        switch document.documentID {
                        case "square1":
                            self.gamesCollectionRef.document("Andrew_vs_Bob_1").collection("squares").document(document.documentID).setData(["square1": "0"], completion: { (error) in
                                if let error = error {
                                    print(error.localizedDescription)
                                }
                            })
                        case "square2":
                            self.gamesCollectionRef.document("Andrew_vs_Bob_1").collection("squares").document(document.documentID).setData(["square2": "0"], completion: { (error) in
                                if let error = error {
                                    print(error.localizedDescription)
                                }
                            })
                        case "square3":
                            self.gamesCollectionRef.document("Andrew_vs_Bob_1").collection("squares").document(document.documentID).setData(["square3": "0"], completion: { (error) in
                                if let error = error {
                                    print(error.localizedDescription)
                                }
                            })
                        case "square4":
                            self.gamesCollectionRef.document("Andrew_vs_Bob_1").collection("squares").document(document.documentID).setData(["square4": "0"], completion: { (error) in
                                if let error = error {
                                    print(error.localizedDescription)
                                }
                            })
                        case "square5":
                            self.gamesCollectionRef.document("Andrew_vs_Bob_1").collection("squares").document(document.documentID).setData(["square5": "0"], completion: { (error) in
                                if let error = error {
                                    print(error.localizedDescription)
                                }
                            })
                        case "square6":
                            self.gamesCollectionRef.document("Andrew_vs_Bob_1").collection("squares").document(document.documentID).setData(["square6": "0"], completion: { (error) in
                                if let error = error {
                                    print(error.localizedDescription)
                                }
                            })
                        case "square7":
                            self.gamesCollectionRef.document("Andrew_vs_Bob_1").collection("squares").document(document.documentID).setData(["square7": "0"], completion: { (error) in
                                if let error = error {
                                    print(error.localizedDescription)
                                }
                            })
                        case "square8":
                            self.gamesCollectionRef.document("Andrew_vs_Bob_1").collection("squares").document(document.documentID).setData(["square8": "0"], completion: { (error) in
                                if let error = error {
                                    print(error.localizedDescription)
                                }
                            })
                        case "square9":
                            self.gamesCollectionRef.document("Andrew_vs_Bob_1").collection("squares").document(document.documentID).setData(["square9": "0"], completion: { (error) in
                                if let error = error {
                                    print(error.localizedDescription)
                                }
                            })
                        default: break
                        }
                    }
                }
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
                self.gamesCollectionRef.document(game).collection("squares").document(documentID).updateData([square: symbol], completion: { (error) in
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
    
//    func updateSymbol(game: String, symbol: String, name: String, completion: @escaping () -> Void) {
//        gamesCollectionRef.document(game).collection("symbols").getDocuments(completion: { (snapshot, error) in
//            if let error = error {
//                print(error.localizedDescription)
//            } else {
//                guard let snapshot = snapshot else { return }
//                guard let document = snapshot.documents.first else { return }
//                let documentID = document.documentID
//                self.gamesCollectionRef.document(game).collection("symbols").document(documentID).updateData([symbol: name], completion: { (error) in
//                    if let error = error {
//                        print(error.localizedDescription)
//                    } else {
//                        print("\(name) is now \(symbol)")
////                        self.currentGameSymbols[symbol] = name
////                        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "CurrentGameSymbolsUpdated"), object: nil)
//                        completion()
//                    }
//                })
//            }
//        })
//    }
    
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
    
//    func updateImageForPerson(_ imageURL: String, completionHandler: @escaping () -> Void) {
//        let storageRef = Storage.storage().reference(forURL: imageURL)
//    }
}
