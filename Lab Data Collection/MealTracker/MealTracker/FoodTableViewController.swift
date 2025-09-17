//
//  FoodTableViewController.swift
//  MealTracker
//
//  Created by Anmol Mehta on 18/08/25.
//

import UIKit

class FoodTableViewController: UITableViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[section].food.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let meal = meals[indexPath.section]
        let food = meal.food[indexPath.row]
    
               var content = cell.defaultContentConfiguration()
               content.text = food.name
               content.secondaryText = food.description
               cell.contentConfiguration = content


        return cell
    }
    
    override func tableView(_ tableView: UITableView,
                               titleForHeaderInSection section: Int) -> String? {
           return meals[section].name
       }


}
