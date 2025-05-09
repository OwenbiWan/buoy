import SwiftUI

struct EventCardView: View {
    let event: Event
    @State private var expanded = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(alignment: .top) {
                // Left: title & location
                VStack(alignment: .leading, spacing: 4) {
                    Text(event.title)
                        .font(.headline)
                    Text(event.location)
                        .font(.subheadline)
                }
                Spacer()
                // Right: time, then player count + Join button
                VStack(alignment: .trailing, spacing: 4) {
                    Text(event.time, style: .time)
                        .font(.subheadline)
                    HStack(spacing: 8) {
                        Text("\(event.playerCount) /")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Button("Join") {
                            // mock action
                        }
                        .padding(.vertical, 6)
                        .padding(.horizontal, 12)
                        .background(Color("BuoyOrange"))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                    }
                }
            }

            // Expanded view: last message preview + “x ago”
            // … inside your VStack, replace the `if expanded` section with:
            if expanded, let last = event.messages.last {
                HStack {
                    Text(last.text)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineLimit(1)

                    Spacer()

                    Text(last.timestamp.relativeTimestamp())  // ← use custom formatter
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(16)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        .onTapGesture { expanded.toggle() }
    }
}

struct EventCardView_Previews: PreviewProvider {
    static var previews: some View {
        EventCardView(event: Event.mockExplore[0])
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
