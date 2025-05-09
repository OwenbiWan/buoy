//
//  CreateEventView.swift
//  waypoint
//
//  Created by Owen Walls on 4/1/25.
//


import SwiftUI

// MARK: - Create Event View

/// The view where users can create a new event.
struct CreateEventView: View {
    @State private var sport: String = ""
    @State private var eventDate: Date = Date()
    @State private var location: String = ""
    @State private var playerCount: String = ""
    @State private var tags: String = ""
    @State private var description: String = ""
    @State private var hostType: String = "Pickup"
    
    // Options for host type
    let hostTypes = ["Pickup", "Organized"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Event Details")) {
                    TextField("Sport", text: $sport)
                    DatePicker("Time", selection: $eventDate, displayedComponents: [.date, .hourAndMinute])
                    TextField("Location", text: $location)
                    TextField("Player Count (e.g., 5/8)", text: $playerCount)
                    TextField("Tags (comma separated)", text: $tags)
                    TextField("Description", text: $description)
                    
                    Picker("Host Type", selection: $hostType) {
                        ForEach(hostTypes, id: \.self) { type in
                            Text(type)
                        }
                    }
                }
                
                Section {
                    Button(action: {
                        // Handle event creation logic here.
                        print("Event created: \(sport) at \(location)")
                    }) {
                        Text("Create Event")
                            .fontWeight(.bold)
                    }
                }
            }
            .navigationTitle("Create Event")
        }
    }
}

// MARK: - Preview

struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView()
    }
}