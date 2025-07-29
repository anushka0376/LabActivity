//
//  ViewController.swift
//  Segue_and_navigation
//
//  Created by Sagar Midha on 18/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textt: UITextField!
   
    @IBOutlet weak var toggleSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func unwindToRed(unwindSegue: UIStoryboardSegue){
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.navigationItem.title = textt.text
    
    }
    
    @IBAction func yellowTapped(_ sender: Any) {
        if toggleSwitch.isOn {
            performSegue(withIdentifier: "yellow", sender: nil)
        }
        else{
            performSegue(withIdentifier: "green", sender: nil)
        }
     
    }
    

}

