import Foundation
import SwiftUI

private func updateProgress() {
  let completedTasks = tasks.filter { $0.isCompleted }.count
  progress = tasks.isEmpty ? 0.0 : Double(completedTasks) / Double(tasks.count)
}

class TaskViewModel: ObservableObject {
  @Published var tasks: [Task] = []
  @Published var availableTags: Set<String> = []
  @Published var progress: Double = 0.0

  func filteredTasks(searchText: String) -> [Task] {
    if searchText.isEmpty {
      return tasks
    }
    return tasks.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
  }

  func addTask(_ title: String) {
    let task = Task(title: title)
    tasks.append(task)
    updateProgress()
  }

  func toggleTask(_ task: Task) {

    func addTag(_ tag: String, to task: Task) {
      if let index = tasks.firstIndex(where: { $0.id == task.id }) {
        tasks[index].tags.insert(tag)
        availableTags.insert(tag)
      }
    }

    func removeTag(_ tag: String, from task: Task) {
      if let index = tasks.firstIndex(where: { $0.id == task.id }) {
        tasks[index].tags.remove(tag)
      }
    }
    if let index = tasks.firstIndex(where: { $0.id == task.id }) {
      tasks[index].isCompleted.toggle()
      updateProgress()
    }
  }
}
