//
//  ViewController.swift
//  Login_Lab
//
//  Created by Sagar Midha on 18/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var forgotUsername: UIButton!
    @IBOutlet weak var forgotPassword: UIButton!
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        segue.destination.navigationItem.title=username.text
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return }
        if sender == forgotPassword {
            segue.destination.navigationItem.title = "Forgot Password"
        }
        else if sender == forgotUsername {
            segue.destination.navigationItem.title = "Forgot Username"
        }
        else {
            segue.destination.navigationItem.title = username.text
        }
    }
    
    @IBAction func forgotPasswordAction(_ sender: Any) {
        performSegue(withIdentifier: "login", sender: sender)
    }
    @IBAction func forgotUsernameAction(_ sender: Any) {
        performSegue(withIdentifier: "login", sender: sender)
    }
    

}

