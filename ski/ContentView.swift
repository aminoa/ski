//
//  ContentView.swift
//  ski
//
//  Created by OSIRIS on 11/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var username = "OSIRIS"
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false

    var body: some View {
        NavigationStack {
            Text("Login")
                .font(.largeTitle)
                .bold()
                .padding()
            TextField("Username", text: $username)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .border(.red, width: CGFloat(wrongUsername))
            SecureField("Password", text: $password)
                .padding()
                .frame(width: 300, height: 50)
                .background(Color.black.opacity(0.05))
                .cornerRadius(10)
                .border(.red, width: CGFloat(wrongPassword))
            
            Button("Login") {
                authenticateUser(username: username, password: password)
            }
            .foregroundColor(.white)
            .frame(width: 300, height: 50)
            .background(Color.blue)
            .cornerRadius(10)

            NavigationLink(destination: Text("You are logged in"), isActive: $showingLoginScreen) {
                EmptyView()
            }
        }
    }

    func authenticateUser(username: String, password: String) {
        if username == "osiris" {
            wrongUsername = 0
            if password == "csaw_ctf{stringed}" {
                wrongPassword = 0
                showingLoginScreen = true 
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

#Preview {
    ContentView()
}
