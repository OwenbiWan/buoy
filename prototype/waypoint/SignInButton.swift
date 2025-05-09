//
//  SignInButton.swift
//  waypoint
//
//  Created by Owen Walls on 4/17/25.
//


import SwiftUI
import FirebaseAuth

struct SignInButton: View {
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        Button("Sign in with Google") {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let rootVC = windowScene.windows.first?.rootViewController {
                AuthManager.shared.signInWithGoogle(presentingVC: rootVC) { result in
                    switch result {
                    case .success(let uid):
                        print("✅ Signed in: \(uid)")
                    case .failure(let error):
                        switch error {
                        case .invalidDomain:
                            alertMessage = "Please sign in with a .edu email address."
                        default:
                            alertMessage = "Sign-in failed. Please try again."
                        }
                        showAlert = true
                    }
                }
            }
        }
        .foregroundColor(.white)
        .padding()
        .background(Color.blue)
        .cornerRadius(12)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Sign-In Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
}