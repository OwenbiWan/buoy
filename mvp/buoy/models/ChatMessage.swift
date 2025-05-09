import Foundation

struct ChatMessage: Identifiable {
    // auto-generated UUID, no need to pass it in
    let id = UUID()
    let text: String
    let isOwn: Bool
    let timestamp: Date
}
