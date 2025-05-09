import SwiftUI

struct SectionHeaderView: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(Color("BuoyOrange"))
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(title: "Today")
            .previewLayout(.sizeThatFits)
    }
}
