//
//  LoginView.swift
//  KOMI
//
//  Created by Anissa Bokhamy on 26/07/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var session: SessionStore
    
    @State var userEmail: String = ""
    @State var password: String = ""
    
    @State var authentificationDidFail = false
    @State var authentificationDidSucceed = false
    
    func logIn(){
        session.signIn(email: self.userEmail, password: self.password, handler: { (result, error) in
            if error != nil {
                self.authentificationDidFail = true
            } else {
                self.userEmail = ""
                self.password = ""
                self.authentificationDidSucceed = true
            }
        })
    }
    
    var body: some View {
        NavigationView {
            Group {
                if self.authentificationDidSucceed {
                    NavigationTabView()
                } else {
                    VStack {
                        Spacer()
                        WelcomeText()
                        EmailAddressField(emailAddress: $userEmail)
                        PasswordField(password: $password)
                        
                        if authentificationDidFail {
                            Text("Email ou mot de passe non reconnu(s)")
                                .font(.subheadline)
                                .foregroundColor(Color("Beige"))
                        }
                        Button(action: {
                            self.logIn()
                        }, label: {
                                Text("Se connecter")
                                    .font(.headline)
                                    .foregroundColor(Color("Light Grey"))
                                    .padding()
                                    .background(Color("Light Green"))
                                    .cornerRadius(5)
                                }
                        )
                        Spacer()
                        signUpSection()
                        Spacer()
                        
                    }
                    .padding()
                    .background(Color("Dark Green"))
                    .edgesIgnoringSafeArea(.all)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct WelcomeText : View {

    var body: some View {
        VStack {
            Text("Bienvenue sur")
                .font(.headline)
                .foregroundColor(Color("Beige"))
            Text("KOMI")
                .font(.title)
                .bold()
                .foregroundColor(Color("Dark Grey"))
            Text("ton assistant de l'épicerie à la cuisine")
                .font(.subheadline)
                .foregroundColor(Color("Beige"))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct EmailAddressField : View {
    
    @Binding var emailAddress: String

    var body: some View {
        TextField("E-mail", text: $emailAddress)
            .textContentType(.emailAddress)
            .padding()
            .background(Color("Light Grey"))
            .cornerRadius(5)
    }
}

struct PasswordField : View {
    @Binding var password: String
    
    var body: some View {
        SecureField("Mot de passe", text: $password)
            .textContentType(.password)
            .padding()
            .background(Color("Light Grey"))
            .cornerRadius(5)
    }
}

struct signUpSection : View {
    
    var body: some View {
        VStack {
            Text("Pas encore de compte ?")
                .font(.caption)
                .foregroundColor(Color("Beige"))
            
            NavigationLink(destination: SignUpView()){
                Text("S'incrire")
                    .font(.footnote)
                    .foregroundColor(Color("Light Grey"))
                    .padding()
                    .background(Color("Light Green"))
                    .cornerRadius(5)
            }
        }
    }
}
