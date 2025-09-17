//
//  AddToDoTableViewController.swift
//  ListProject
//
//  Created by Anushka on 01/09/25.
//

import UIKit

class AddToDoTableViewController: UITableViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var dueDatePicker: UIDatePicker!
    @IBOutlet weak var notesTextView: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var existingToDo: ToDo?
    var todoItem: ToDo? {
        let title = titleTextField.text ?? ""
        let isComplete = isCompleteButton.isSelected
        let dueDate = dueDatePicker.date
        let notes = notesTextView.text ?? ""
        
        guard !title.isEmpty else { return nil }
        
        return ToDo(title: title, isComplete: isComplete, dueDate: dueDate, notes: notes)
    }
    
    
    override func viewDidLoad() {
        exitingToDo()
        super.viewDidLoad()
        let midnightToday =  Calendar.current.startOfDay(for: Date())
        dueDatePicker.minimumDate = midnightToday
        dueDatePicker.date = midnightToday
        updateDates()
        updateSaveButtonState()

    }
    
    func exitingToDo(){
        guard let existingToDo = existingToDo else {return}
        titleTextField.text = existingToDo.title
        isCompleteButton.isSelected = existingToDo.isComplete
        dueDatePicker.date = existingToDo.dueDate
        notesTextView.text = existingToDo.notes
    }
    
    let DatePickerIndexPath = IndexPath(row: 1, section: 1)
    let DatePickerNameIndexPath = IndexPath(row: 0, section: 1)
    let notesIndexPath = IndexPath(row: 0, section: 2)
    
    
    func updateSaveButtonState(){
        let shouldEnableSaveButton = titleTextField.text?.isEmpty == false
        
        saveButton.isEnabled = shouldEnableSaveButton
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    @IBAction func returnPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func isCompleteButtonTapped(_ sender: UIButton) {
        isCompleteButton.isSelected.toggle()
    }
    
    var DueDatePickerVisible: Bool = false {
        didSet{
            dueDatePicker.isHidden = !DueDatePickerVisible
        }
    }
    
    func updateDates(){
        dueDateLabel.text = dueDatePicker.date.formatted(.dateTime.month(.defaultDigits).day().year(.twoDigits).hour().minute())
    }
    
    @IBAction func dataPickerValue(_ sender: UIDatePicker) {
        updateDates()
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case DatePickerIndexPath where DueDatePickerVisible == false:
            return 0
        case notesIndexPath:
            return 200
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case DatePickerIndexPath:
            return 220
        case notesIndexPath:
            return 200
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == DatePickerNameIndexPath {
            DueDatePickerVisible.toggle()
            updateDates()
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "unwind", sender: self)
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
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
