import SwiftUI

struct AddTaskView: View {
  @Environment(\.dismiss) private var dismiss
  @ObservedObject var viewModel: TaskViewModel
  @State private var taskTitle = ""

  var body: some View {
    NavigationView {
      Form {
        TextField("Task title", text: $taskTitle)
      }
      .navigationTitle("Add Task")
      .navigationBarItems(
        leading: Button("Cancel") {
          dismiss()
        },
        trailing: Button(action: {
          if !taskTitle.isEmpty {
            viewModel.addTask(taskTitle)
            dismiss()
          }
        }) {
          Text("Add")
        }
        .disabled(taskTitle.isEmpty)
      )
    }
  }
}
