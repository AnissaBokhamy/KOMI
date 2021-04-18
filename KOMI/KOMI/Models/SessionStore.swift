//
//  SessionStore.swift
//  KOMI
//
//  Created by Anissa Bokhamy on 26/07/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseAuth
import Combine

class SessionStore: ObservableObject {
    
    var didChange = PassthroughSubject<SessionStore, Never>()
    @Published var user : User? {
        didSet {
            self.didChange.send(self)
        }
    }
    var handle : AuthStateDidChangeListenerHandle?
    
    
    func listen() {
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if let user = user {
                self.user = User(id: user.uid, emailAddress: user.email!)
            } else {
                self.user = nil
            }
        })
    }
    
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    func signIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch {
            print("Error in signing out")
        }
    }
    
    func unbind() {
        if let handle = handle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    deinit {
        unbind()
    }
}

