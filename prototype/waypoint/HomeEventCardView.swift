//
//  HomeEventCardView.swift
//  waypoint
//
//  Created by Owen Walls on 4/1/25.
//

import SwiftUI
import CoreLocation

// MARK: - Home Event Card View

/// Specialized card view for the Home page that includes group chat preview and a check-in button.
struct HomeEventCardView: View {
    @Binding var event: Event
    @StateObject private var locationManager = LocationManager()
    @State private var checkInMessage: String = "Press 'Check-In' to verify attendance."
    @State private var showChat: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                // Left column: sport, time, location.
                VStack(alignment: .leading, spacing: 4) {
                    Text(event.sport)
                        .font(.headline)
                    Text(event.time)
                        .font(.subheadline)
                    Text(event.location)
                        .font(.subheadline)
                }
                Spacer()
                // Right column: player count and check-in button.
                VStack(alignment: .trailing, spacing: 4) {
                    Text(event.playerCount)
                        .font(.subheadline)
                    Button(action: {
                        locationManager.requestLocation()
                    }) {
                        Text("Check-In")
                            .font(.subheadline)
                            .padding(8)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation {
                    event.isExpanded.toggle()
                }
            }
            if event.isExpanded {
                Divider()
                // Chat preview placeholder.
                Text("""
                BlueRabbit: Hey everyone, excited for today! \n
                GreenTiger: Me too! Should we meet 10 min early? \n
                RedFox: I'll bring the ball. \n
                YellowWolf: Can't wait, see you all soon! \n
                BlueRabbit: Great see you soon! \n
                """)
                    .font(.footnote)
                    .foregroundColor(.gray)
                if showChat {
                    // Placeholder for the full chat interface.
                    Text("Chat Interface Placeholder")
                        .font(.footnote)
                        .foregroundColor(.blue)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .shadow(radius: 1)
        .padding(.vertical, 4)
        .onReceive(locationManager.$lastLocation) { location in
            if let location = location {
                checkInMessage = "Checked in at \(location.coordinate.latitude.rounded(toPlaces: 4)), \(location.coordinate.longitude.rounded(toPlaces: 4))"
            }
        }
    }
}

// MARK: - Location Manager

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var lastLocation: CLLocation?
    private let manager = CLLocationManager()

    override init() {
        super.init()
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
    }

    func requestLocation() {
        manager.requestLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        lastLocation = locations.first
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get location: \(error.localizedDescription)")
    }
}

// MARK: - Helper Extension

extension Double {
    /// Rounds the double to 'places' decimal places.
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

// MARK: - Preview

struct HomeEventCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeEventCardView(event: .constant(
            Event(sport: "Volleyball",
                  time: "4:00 PM",
                  location: "Mac Court",
                  playerCount: "5/8 Players",
                  tags: ["Beginner Friendly", "Competitive"],
                  description: "Join us for a fun game of volleyball!",
                  hostType: "Pickup",
                  isJoined: true)
        ))
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
