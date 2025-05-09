import Foundation

struct Event: Identifiable {
    let id = UUID()
    let title: String
    let location: String
    let time: Date
    let playerCount: Int
    var isJoined: Bool = false
    let messages: [ChatMessage]
}

// Sample events for Explore
// In Event.swift, replace your mockExplore with:
extension Event {
    static let mockExplore: [Event] = [
        Event(
            title:       "Run Club",
            location:    "Outside Lowry",
            time:        .todayAt(hour: 16),
            playerCount: 5,
            messages: [
                ChatMessage(
                    text: "How about we take 6 miles slow?",
                    isOwn: false,
                    timestamp: .daysFromNow(0, hour: 21, minute: 1)  // e.g. 15 minutes ago if now is 16:00
                )
            ]
        ),
        Event(
            title:       "Volleyball",
            location:    "Norton Sand Pit",
            time:        .daysFromNow(1, hour: 16),
            playerCount: 7,
            messages: [
                ChatMessage(
                    text: "Anyone have a speaker?",
                    isOwn: true,
                    timestamp: .daysFromNow(0, hour: 9, minute: 30)
                )
            ]
        ),
        Event(
            title:       "Pickleball",
            location:    "Lowry Courts",
            time:        .daysFromNow(1, hour: 17),
            playerCount: 3,
            messages: [
                ChatMessage(
                    text: "I've got extra paddles",
                    isOwn: false,
                    timestamp: .daysFromNow(0, hour: 16, minute: 50)
                )
            ]
        )
        
    ]

    static let mockHome: [Event] = [
        Event(
          title:       "Run Club",
          location:    "Outside Lowry",
          time:        .todayAt(hour: 16),
          playerCount: 5,
          isJoined:    true,
          messages: [
            ChatMessage(
              text:      "Yo what distance are we thinking?",
              isOwn:     false,
              timestamp: .daysFromNow(0, hour: 15, minute: 50)
            ),
            ChatMessage(
              text:      "how bout we take six miles slowly?",
              isOwn:     true,
              timestamp: .daysFromNow(0, hour: 15, minute: 52)
            ),
            ChatMessage(
              text:      "Aye perfect",
              isOwn:     false,
              timestamp: .daysFromNow(0, hour: 15, minute: 54)
            ),
            ChatMessage(
              text:      "omw",
              isOwn:     true,
              timestamp: .daysFromNow(0, hour: 15, minute: 58)
            ),
            ChatMessage(
              text:      "Mm so sore lets see how this goes",
              isOwn:     false,
              timestamp: .daysFromNow(0, hour: 15, minute: 59)
            )
          ]
        )
      ]
}
