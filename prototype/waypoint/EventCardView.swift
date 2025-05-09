import SwiftUI

// MARK: - Event Card View

/// Custom view for displaying an event card. Tapping the card expands it to show more details.
struct EventCardView: View {
    @Binding var event: Event

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                // Left: sport, time, location
                VStack(alignment: .leading, spacing: 4) {
                    Text(event.sport)
                        .font(.headline)
                    Text(event.time)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text(event.location)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                Spacer()
                // Right: player count & join button
                VStack(alignment: .trailing, spacing: 4) {
                    Text(event.playerCount)
                        .font(.subheadline)
                    Button(action: {
                        event.isJoined.toggle()
                    }) {
                        Text(event.isJoined ? "Go to Chat" : "Join")
                            .font(.subheadline)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(event.isJoined ? Color.green : Color("BuoyOrange"))
                            .foregroundColor(.white)
                            .cornerRadius(14)
                    }
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation { event.isExpanded.toggle() }
            }

            if event.isExpanded {
                Divider()
                if !event.tags.isEmpty {
                    Text("Tags: \(event.tags.joined(separator: ", "))")
                        .font(.footnote)
                }
                if let desc = event.description {
                    Text(desc)
                        .font(.footnote)
                }
                Text("Host Type: \(event.hostType)")
                    .font(.footnote)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        .padding(.horizontal)
        .padding(.vertical, 6)
    }
}

// MARK: - Preview

struct EventCardView_Previews: PreviewProvider {
    @State static var sampleEvent = Event(
        sport: "Volleyball",
        time: "4:00 PM",
        location: "Mac Court",
        playerCount: "5/8 Players",
        tags: ["Beginner Friendly", "Competitive"],
        description: "Join us for a fun game of volleyball!",
        hostType: "Pickup"
    )

    static var previews: some View {
        EventCardView(event: $sampleEvent)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
