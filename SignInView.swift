//
//  SignInView.swift
//  medical
//
//  Created by Elias Farzad  on 4/11/24.
//

import SwiftUI
import FirebaseAuth


struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var loginError: String?
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $email)
                    .padding()
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .border(Color(UIColor.separator))
                
                SecureField("Password", text: $password)
                    .padding()
                    .border(Color(UIColor.separator))
                
                Button("Login") {
                    authenticateUser(email: email, password: password)
                }
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                }
                .padding()

                if let loginError = loginError {
                    Text(loginError)
                        .foregroundColor(.red)
                }
            }
            .padding()
            .navigationTitle("Login")
        }
    }
    
    func authenticateUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.loginError = error.localizedDescription
            } else {
                // Navigate to the next screen or update state
                print("Login successful!")
            }
        }
    }
}

#Preview {
    ContentView()
}
