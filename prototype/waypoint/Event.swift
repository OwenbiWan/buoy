import SwiftUI

// MARK: - Model

/// Represents an event in the app.
struct Event: Identifiable {
    let id = UUID()
    let sport: String
    let time: String
    let location: String
    let playerCount: String
    let tags: [String]
    let description: String?
    let hostType: String
    var isJoined: Bool = false
    var isExpanded: Bool = false
}
