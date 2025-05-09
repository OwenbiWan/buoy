import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import GoogleSignInSwift
import UIKit

class AuthManager {
    static let shared = AuthManager()

    func signInWithGoogle(presentingVC: UIViewController, completion: @escaping (Result<String, AuthError>) -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
            completion(.failure(.configError))
            return
        }

        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        GIDSignIn.sharedInstance.signIn(withPresenting: presentingVC) { result, error in
            if let error = error {
                print("Google sign-in failed: \(error)")
                completion(.failure(.googleError(error.localizedDescription)))
                return
            }

            guard
                let user = result?.user,
                let idToken = user.idToken?.tokenString,
                let email = user.profile?.email
            else {
                completion(.failure(.noGoogleUser))
                return
            }

            let accessToken = user.accessToken.tokenString

            // ✅ Restrict to .edu email domains
            guard email.hasSuffix(".edu") else {
                completion(.failure(.invalidDomain))
                return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)

            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    completion(.failure(.firebaseError(error.localizedDescription)))
                } else if let user = authResult?.user {
                    completion(.success(user.uid))
                } else {
                    completion(.failure(.unknown))
                }
            }
        }
    }

    func signInAnonymously(completion: @escaping (Result<String, AuthError>) -> Void) {
        Auth.auth().signInAnonymously { authResult, error in
            if let error = error {
                completion(.failure(.firebaseError(error.localizedDescription)))
            } else if let user = authResult?.user {
                completion(.success(user.uid))
            } else {
                completion(.failure(.unknown))
            }
        }
    }
}

enum AuthError: Error {
    case configError
    case googleError(String)
    case firebaseError(String)
    case invalidDomain
    case noGoogleUser
    case unknown
}
