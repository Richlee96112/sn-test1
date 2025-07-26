import SwiftUI

struct StatusBarItem: View {
  let icon: String
  let count: Int
  let label: String

  var body: some View {
    VStack {
      HStack {
        Image(systemName: icon)
          .foregroundColor(.blue)
        Text("\(count)")
          .bold()
      }
      Text(label)
        .font(.caption)
        .foregroundColor(.secondary)
    }
    .frame(maxWidth: .infinity)
  }
}
