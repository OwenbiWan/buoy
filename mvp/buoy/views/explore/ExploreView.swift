// ExploreView.swift
import SwiftUI

struct ExploreView: View {
  // group into Today / Tomorrow / This Weekend
  private var sections: [(String, [Event])] = [
    ("Today", [ .mockExplore[0] ]),
    ("Tomorrow", [ .mockExplore[1], .mockExplore[2] ]),
    ("This Weekend", [])
  ]

  var body: some View {
    ScrollView {
      LazyVStack(spacing: 16) {
        ForEach(sections, id: \.0) { header, events in
          SectionHeaderView(title: header)
          ForEach(events) { event in
            EventCardView(event: event)
              .padding(.horizontal)
          }
        }
      }
      .padding(.vertical)
    }
    .navigationTitle("Explore")
    .navigationBarTitleDisplayMode(.large)
  }
}

struct ExploreView_Previews: PreviewProvider {
  static var previews: some View { ExploreView() }
}
