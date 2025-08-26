//
//  ResultViewController.swift
//  personalityQuiz
//
//  Created by Anushka Bhatnagar on 30/07/25.
//

import UIKit


class ResultViewController: UIViewController {
    
    
    
    var responses: [Answer]
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinationLabel: UILabel!
    init?(coder: NSCoder , responses: [Answer]){
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculatePersonalityResult()
        // Do any additional setup after loading the view.
    }
    
    
    func calculatePersonalityResult(){
        let frequencyofAnswer = responses.reduce(into: [AnimalType: Int]()) {
            (counts , answer) in
            if let existingCount = counts[answer.type] {
                counts[answer.type] = existingCount + 1
            } else {
                counts[answer.type] = 1
            }
            
        }
        
        _ = frequencyofAnswer.sorted(by : { (pair1 , pair2) in
            return pair1.value > pair2.value
        })
        let mostcommonAnswer = frequencyofAnswer.sorted { $0.value > $1.value }.first!.key
        
        resultAnswerLabel.text = "you are a \(mostcommonAnswer.rawValue)!"
        resultDefinationLabel.text = mostcommonAnswer.definition
    }
    
    
}
