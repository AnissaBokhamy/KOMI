//
//  FirebaseDataManager.swift
//  KOMI
//
//  Created by Anissa Bokhamy on 16/07/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage

class FirebaseDataManager {

    private static var db = Firestore.firestore()
    
    enum FirebaseCollection {
        case inventory
        
        var name: String {
            switch self {
            case .inventory: return "inventory"
            }
        }
    }
    
    // MARK: - User data
    private static func loadUser(success: ((User?) -> Void)?, failure: (() -> Void)?) {
        db.collection("users")
            .whereField("firstName", isEqualTo: "Anissa")
            .whereField("lastName", isEqualTo: "Bokhamy")
            .addSnapshotListener { (querySnapshot, error) in
                guard let documents = querySnapshot?.documents else {
                    print("Error fetching documents: \(error!)")
                    failure?()
                    return
                }
                let users = documents.compactMap { document -> User? in
                    guard let foundUsers = try? document.data(as: User.self) else {
                        failure?()
                        return nil
                    }
                    return foundUsers
                }
                guard documents.count == 1 else {
                    print("Error in finding user in database : \(error)")
                    failure?()
                    return
                }
                let user = users[0]
                print("User found: \(user.firstName) \(user.lastName)")
                success?(user)
        }
    }
    
    static func getUser() -> User? {
        var foundUser: User?
        FirebaseDataManager.loadUser(success: { user in
            foundUser = user
        }, failure: {
            foundUser = nil
        })
        return foundUser
    }
    
    // MARK: - Image Manager
    private static func loadImage(named imageName: String, success: ((URL?) -> Void)?, failure: (() -> Void)?) {
        let storageRef = Storage.storage().reference(withPath: imageName)
        storageRef.downloadURL { (url, error) in
            if error != nil {
                print((error?.localizedDescription)!)
                failure?()
                return
            }
            success?(url)
        }
    }
    
    static func getImage(named imageName: String) -> URL? {
        var imageUrl: URL?
        loadImage(named: imageName,
                  success: { url in
                    imageUrl = url
                  }, failure: {
                    imageUrl = nil
                  })
        return imageUrl
    }
}
