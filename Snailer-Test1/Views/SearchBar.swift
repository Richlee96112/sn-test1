import SwiftUI

struct SearchBar: View {
  @Binding var text: String

  var body: some View {
    HStack {
      Image(systemName: "magnifyingglass")
        .foregroundColor(.gray)

      TextField("Search tasks...", text: $text)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .autocapitalization(.none)
        .disableAutocorrection(true)

      if !text.isEmpty {
        Button(action: { text = "" }) {
          Image(systemName: "xmark.circle.fill")
            .foregroundColor(.gray)
        }
      }
    }
    .accessibilityElement(children: .combine)
    .accessibilityLabel("Search tasks")
  }
}
