//
//  GroupChatView.swift
//  waypoint
//
//  Created by Owen Walls on 4/1/25.
//


import SwiftUI

// MARK: - Group Chat View

struct GroupChatView: View {
    @State private var messages: [String] = [
        "Player 1: Hey, who's ready to play?",
        "Player 2: Count me in!",
        "Player 3: Let's go!"
    ]
    @State private var newMessage: String = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(messages, id: \.self) { message in
                    Text(message)
                }
            }
            
            HStack {
                TextField("Type a message...", text: $newMessage)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    if !newMessage.isEmpty {
                        messages.append("You: \(newMessage)")
                        newMessage = ""
                    }
                }) {
                    Text("Send")
                        .padding(8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .navigationTitle("Group Chat")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct GroupChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GroupChatView()
        }
    }
}