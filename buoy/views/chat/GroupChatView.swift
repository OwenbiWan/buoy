import SwiftUI

struct GroupChatView: View {
  let event: Event
  @State private var draft = ""

  var body: some View {
    VStack {
      ScrollView {
        LazyVStack(alignment: .leading, spacing: 12) {
          ForEach(event.messages) { msg in
            HStack {
              if msg.isOwn { Spacer() }
              Text(msg.text)
                .padding()
                .background(msg.isOwn ? Color("BuoyOrange") : Color.gray.opacity(0.2))
                .foregroundColor(msg.isOwn ? .white : .primary)
                .cornerRadius(12)
              if !msg.isOwn { Spacer() }
            }
          }
        }
        .padding()
      }

      HStack {
        TextField("Message...", text: $draft)
          .textFieldStyle(.roundedBorder)
        Button("Send") {
          // mock append if you like
        }
        .disabled(draft.isEmpty)
      }
      .padding()
    }
    .navigationTitle(event.title)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct GroupChatView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      GroupChatView(event: Event.mockHome[0])
    }
  }
}
