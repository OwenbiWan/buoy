// HomeView.swift
import SwiftUI

struct HomeView: View {
  let joinedEvents = Event.mockHome

  var body: some View {
    List(joinedEvents) { event in
      NavigationLink(destination: GroupChatView(event: event)) {
        HStack {
          VStack(alignment: .leading) {
            Text(event.title).font(.headline)
            Text(event.location).font(.subheadline)
            if let last = event.messages.last {
              Text(last.text).font(.caption).foregroundColor(.gray)
            }
          }
          Spacer()
          Text(event.time, style: .time)
        }
        .padding(.vertical, 8)
      }
    }
    .listStyle(.plain)
    .navigationTitle("Home")
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView { HomeView() }
  }
}
