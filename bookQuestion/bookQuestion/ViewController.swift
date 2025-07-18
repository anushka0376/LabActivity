//
//  ViewController.swift
//  bookQuestion
//
//  Created by Student on 16/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TextField: UITextField!
    
    @IBOutlet weak var TargetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   
    @IBAction func setTextButtonTapped(_ sender: UIButton) {
        let str = TextField.text
        TargetLabel.text = str
    }
    
    @IBAction func clearTextButtonTapped(_ sender: UIButton) {
        TargetLabel.text = ""
        TextField.text = ""
    }
}

