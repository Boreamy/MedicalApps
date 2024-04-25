//
//  SignUpView.swift
//  medical
//
//  Created by Elias Farzad  on 4/11/24.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding()
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .border(Color(UIColor.separator))

            SecureField("Password", text: $password)
                .padding()
                .border(Color(UIColor.separator))

            Button("Sign Up") {
                createUser(email: email, password: password)
            }
            .padding()

            if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
        }
        .padding()
        .navigationTitle("Sign Up")
    }

    func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                print("User signed up successfully")
                // Optionally verify email
                sendVerificationMail()
            }
        }
    }

    func sendVerificationMail() {
        if let user = Auth.auth().currentUser, !user.isEmailVerified {
            user.sendEmailVerification { error in
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    return
                }
                // Inform the user to check their email
                print("Verification email sent")
            }
        }
    }
}


#Preview {
    SignUpView()
}
