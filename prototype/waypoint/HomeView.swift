import SwiftUI

// MARK: - Home View

/// The Home screen displays events the user has joined, grouped by day.
struct HomeView: View {
    @State private var events: [Event] = [
        // Demo events – make sure they are marked as joined
        Event(sport: "Volleyball",
              time: "4:00 PM",
              location: "Mac Court",
              playerCount: "5/8 Players",
              tags: ["Beginner Friendly", "Competitive"],
              description: "Join us for a fun game of volleyball!",
              hostType: "Pickup",
              isJoined: true),
        Event(sport: "Basketball",
              time: "5:00 PM",
              location: "City Park",
              playerCount: "3/10 Players",
              tags: ["Casual"],
              description: "Friendly match, come join!",
              hostType: "Organized",
              isJoined: true),
        Event(sport: "Soccer",
              time: "6:00 PM",
              location: "Central Field",
              playerCount: "7/11 Players",
              tags: ["Competitive", "Amateur"],
              description: "Kickoff time soon",
              hostType: "Pickup",
              isJoined: true),
        Event(sport: "Tennis",
              time: "7:00 PM",
              location: "Local Courts",
              playerCount: "1/2 Players",
              tags: ["Singles"],
              description: "Looking for a match",
              hostType: "Organized",
              isJoined: true)
    ]
    
    // For demonstration, we group events arbitrarily by index.
    func groupedJoinedEventIndices() -> [String: [Int]] {
        var groups = [String: [Int]]()
        for index in events.indices {
            // Only include events that are joined
            if events[index].isJoined {
                let section = index % 2 == 0 ? "Today" : "Tomorrow"
                groups[section, default: []].append(index)
            }
        }
        return groups
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(sortedSectionKeys(), id: \.self) { section in
                    Section(header: Text(section)) {
                        ForEach(groupedJoinedEventIndices()[section]!, id: \.self) { index in
                            // Use a dedicated Home event card view
                            HomeEventCardView(event: $events[index])
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Home")
        }
    }
    
    /// Returns the sorted section titles.
    func sortedSectionKeys() -> [String] {
        let keys = Array(groupedJoinedEventIndices().keys)
        return keys.sorted() // For demo, "Today" and "Tomorrow"
    }
}

// MARK: - Preview

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
