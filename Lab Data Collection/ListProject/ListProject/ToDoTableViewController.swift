import UIKit

class ToDoTableViewController: UITableViewController, ToDoCellDelegate {
    func checkMarkTapped(sender: ToDoCell) {
        if let indexPath = tableView.indexPath(for: sender) {
            var todo = toDos[indexPath.row]
            todo.isComplete.toggle()
            toDos[indexPath.row] = todo
            ToDo.saveToDos(toDos)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let savedToDos = ToDo.loadToDos()
        if savedToDos.isEmpty {
            toDos = ToDo.loadSampleToDos()
        } else {
            toDos = savedToDos
        }
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCellIdentifier", for: indexPath) as! ToDoCell
        let toDo = toDos[indexPath.row]
        cell.titleLabel.text = toDo.title
        cell.delegate = self
        cell.isCompleteButton.isSelected = toDo.isComplete
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "newPage", sender: indexPath)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            toDos.remove(at: indexPath.row)
            ToDo.saveToDos(toDos)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "newPage" {
            if let indexPath = sender as? IndexPath,
               let navController = segue.destination as? UINavigationController,
               let addVC = navController.topViewController as? AddToDoTableViewController {
                addVC.existingToDo = toDos[indexPath.row]
            }
        }
    }

    @IBAction func unwindToMain(_ segue: UIStoryboardSegue) {
        guard let addVC = segue.source as? AddToDoTableViewController,
              let todo = addVC.todoItem else { return }
        
        if let selectedPath = tableView.indexPathForSelectedRow {
            toDos[selectedPath.row] = todo
            tableView.reloadRows(at: [selectedPath], with: .automatic)
        } else {
            let newIndex = IndexPath(row: toDos.count, section: 0)
            toDos.insert(todo, at: newIndex.row)
            tableView.insertRows(at: [newIndex], with: .automatic)
        }
        
        ToDo.saveToDos(toDos)
    }
}
