//
//  AddEditTableViewController.swift
//  EmojiProject
//
//  Created by Anushka on 21/08/25.
//

import UIKit

class AddEditTableViewController: UITableViewController {
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var textField3: UITextField!
    @IBOutlet weak var textField4: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var emoji: Emoji?
    
    init?(coder: NSCoder, emoji: Emoji?){
        self.emoji = emoji
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.isEnabled = false
        guard let emoji = emoji else { return  }
        textField1.text = emoji.symbol
        textField2.text = emoji.name
        textField3.text = emoji.description
        textField4.text = emoji.usage
        updateButtonState()
        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    func updateButtonState(){
        if textField1.text != "" &&  textField2.text != "" &&  textField3.text != "" &&  textField4.text != ""{
            saveButton.isEnabled = true
        }
    }
    
    @IBAction func textFieldUpdate(_ sender: UITextField) {
        updateButtonState()
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        guard let symbol = textField1.text, let name = textField2.text, let desc = textField3.text , let usage = textField4.text else {
            return
        }
        emoji = Emoji(symbol: symbol, name: name, description: desc, usage: usage)
        
        performSegue(withIdentifier: "unwind", sender: self)
        
    }
    
    @IBAction func dismissPageButton(_ sender: Any) {
        performSegue(withIdentifier: "unwind", sender: nil)
    }
    
/*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
