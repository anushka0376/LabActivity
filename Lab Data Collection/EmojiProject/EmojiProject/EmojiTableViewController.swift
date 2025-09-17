//
//  EmojiTableViewController.swift
//  EmojiProject
//
//  Created by Anushka on 21/08/25.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        let saved = loadEmojis()
        if saved.isEmpty {
            emojis = Sampleemojis
            saveEmojis(emojis)
        } else {
            emojis = saved
        }
    }

    // MARK: - TableView Datasource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EmojiTableViewCell
        cell.updateUI(emoji: emojis[indexPath.row])
        cell.showsReorderControl = true
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            saveEmojis(emojis)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    // MARK: - Reorder
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(movedEmoji, at: to.row)
        saveEmojis(emojis)
    }

    // MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "EditScreen", sender: indexPath)
    }

    @IBSegueAction func addeditSegueAction(_ coder: NSCoder, sender: Any?) -> AddEditTableViewController? {
        guard let sender = sender as? IndexPath else {
            return AddEditTableViewController(coder: coder)
        }
        return AddEditTableViewController(coder: coder, emoji: emojis[sender.row])
    }
    
    @IBAction func unwindToList(_ segue: UIStoryboardSegue){
        guard let sourceVC = segue.source as? AddEditTableViewController,
              let emoji = sourceVC.emoji else { return }
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            emojis[selectedIndexPath.row] = emoji
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
            saveEmojis(emojis)
        } else {
            let newIndexPath = IndexPath(row: emojis.count, section: 0)
            emojis.append(emoji)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            saveEmojis(emojis)
        }
        
        
    }
}
