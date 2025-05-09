import SwiftUI
import Firebase

@main
struct waypointApp: App {
    init() {
        FirebaseApp.configure()
        // Optionally, handle anonymous authentication here
        AuthManager.shared.signInAnonymously { result in
            switch result {
            case .success(let uid):
                print("✅ Anonymous sign-in successful with UID: \(uid)")
            case .failure(let error):
                print("❌ Anonymous sign-in failed with error: \(error)")
            }
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
