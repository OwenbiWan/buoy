//
//  SectionHeaderView.swift
//  waypoint
//
//  Created by Owen Walls on 3/20/25.
//
import SwiftUI

// MARK: - Section Header View

/// Custom view for section headers with a title and an expand/collapse button.
struct SectionHeaderView: View {
    let title: String
    let isExpanded: Bool
    let toggle: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Button(action: toggle) {
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(.blue)
            }
        }
        .padding(.vertical, 5)
    }
}
