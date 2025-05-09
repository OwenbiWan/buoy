// CreateEventView.swift
import SwiftUI

struct CreateEventView: View {
  @State private var title    = ""
  @State private var date     = Date()
  @State private var location = ""
  @State private var sport    = "Basketball"
  private let sports = ["Basketball","Soccer","Yoga","Hike"]

  var body: some View {
    Form {
      Section("Sport") {
        Picker("Sport", selection: $sport) {
          ForEach(sports, id: \.self) { Text($0) }
        }
        .pickerStyle(.menu)
      }
      Section("Title") {
        TextField("Evening Run", text: $title)
      }
      Section("Date & Time") {
        DatePicker("When", selection: $date, in: Date()..., displayedComponents: [.date, .hourAndMinute])
      }
      Section("Location") {
        TextField("Riverside Park", text: $location)
      }
      Section {
        Button("Create Event") {
          // mock action
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color("BuoyOrange"))
        .foregroundColor(.white)
        .cornerRadius(12)
      }
    }
    .navigationTitle("Create")
  }
}

struct CreateEventView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView { CreateEventView() }
  }
}
