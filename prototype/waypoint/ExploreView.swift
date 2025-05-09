import SwiftUI

/// A single section of events (e.g. Today)
struct EventSection: Identifiable {
    let id: String          // section title
    let events: [Event]
}

/// The main view for browsing events in three fixed date sections.
struct ExploreView: View {
    // Sample events for demo
    @State private var events: [Event] = [
        Event(sport: "Volleyball", time: "4:00 PM", location: "Mac Court", playerCount: "5/8 Players", tags: ["Beginner Friendly", "Competitive"], description: "Join us for a fun game of volleyball!", hostType: "Pickup"),
        Event(sport: "Basketball", time: "5:00 PM", location: "City Park", playerCount: "3/10 Players", tags: ["Casual"], description: "Friendly match, come join!", hostType: "Organized"),
        Event(sport: "Soccer", time: "6:00 PM", location: "Central Field", playerCount: "7/11 Players", tags: ["Competitive", "Amateur"], description: "Kickoff time soon", hostType: "Pickup"),
        Event(sport: "Tennis", time: "7:00 PM", location: "Local Courts", playerCount: "1/2 Players", tags: ["Singles"], description: "Looking for a match", hostType: "Organized")
    ]

    // Which sections are expanded
    @State private var expanded: Set<String> = ["Today", "Tomorrow", "This Weekend"]

    // Round-robin grouping into three sections
    private var sections: [EventSection] {
        var today: [Event] = []
        var tomorrow: [Event] = []
        var weekend: [Event] = []
        for (i, event) in events.enumerated() {
            switch i % 3 {
            case 0: today.append(event)
            case 1: tomorrow.append(event)
            default: weekend.append(event)
            }
        }
        return [
            EventSection(id: "Today", events: today),
            EventSection(id: "Tomorrow", events: tomorrow),
            EventSection(id: "This Weekend", events: weekend)
        ]
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    // Today Section
                    EventSectionView(section: sections[0], expanded: $expanded)
                    // Tomorrow Section
                    EventSectionView(section: sections[1], expanded: $expanded)
                    // This Weekend Section
                    EventSectionView(section: sections[2], expanded: $expanded)
                }
                .padding(.bottom, 16)
            }
            .navigationTitle("Explore")
        }
    }
}

/// Renders a single EventSection with header and cards
struct EventSectionView: View {
    let section: EventSection
    @Binding var expanded: Set<String>

    var body: some View {
        // Header
        SectionHeaderView(
            title: section.id,
            isExpanded: expanded.contains(section.id),
            toggle: {
                if expanded.contains(section.id) {
                    expanded.remove(section.id)
                } else {
                    expanded.insert(section.id)
                }
            }
        )
        .padding(.horizontal)
        .padding(.top, section.id == "Today" ? 16 : 8)

        // Cards
        if expanded.contains(section.id) {
            ForEach(section.events) { event in
                EventCardView(event: event)
            }
        }
    }
}

// MARK: - Preview

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
