//
//  QuestionViewController.swift
//  personalityQuiz
//
//  Created by Anushka Bhatnagar on 30/07/25.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var questionLable: UILabel!
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multipleButton1: UILabel!
    @IBOutlet var multipleButton2: UILabel!
    @IBOutlet var multipleButton3: UILabel!
    @IBOutlet var multipleButton4: UILabel!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedButton1: UILabel!
    @IBOutlet var rangedButton2: UILabel!
    @IBOutlet var questionProgressView: UIProgressView!
    
    @IBOutlet var multiSwitch1: UISwitch!
    @IBOutlet var multiSwitch2: UISwitch!
    @IBOutlet var multiSwitch3: UISwitch!
    @IBOutlet var multiSwitch4: UISwitch!
    
    
    @IBOutlet var rangedSlider: UISlider!
    var questions : [Question] = [
        Question(text:"which food do you like most",
                 type:.single,
                 answers:[
                    Answer(text: "steak",type: .loin),
                    Answer(text: "Fish",type: .cat),
                    Answer(text: "carrots",type: .rabbit),
                    Answer(text: "corn",type: .turtle)
                 ]),
        Question(text:"which activities do you like most",
                 type:.multiple,
                 answers: [
                    Answer(text: "Eating",type: .loin),
                    Answer(text: "sleeping",type: .cat),
                    Answer(text: "cuddling",type: .rabbit),
                    Answer(text: "Swimming",type: .turtle)
                 ]),
        Question(text:"which activities do you like most",
                 type:.ranged,
                 answers: [
                    Answer(text: "I love them",type: .loin),
                    Answer(text: "I dislike them",type: .cat),
                    Answer(text: "I  am little nervous",type: .rabbit),
                    Answer(text: "I barely notice them",type: .turtle)
                 ])
    ]
    var answerChosen: [Answer] = []
    var questionIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func rengedAnswerButtonPressed(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answerChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answerChosen.append(currentAnswers[0])
        case singleButton2:
            answerChosen.append(currentAnswers[1])
        case singleButton3:
            answerChosen.append(currentAnswers[2])
        case singleButton4:
            answerChosen.append(currentAnswers[3])
        default:
            break
        }
        
        nextQuestion()
    }
    
    
    @IBAction func multipleButtonPressed(_ sender: Any) {
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answerChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answerChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answerChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answerChosen.append(currentAnswers[3])
        }
        nextQuestion()
        
    }
    
    
    func updateUI(){
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let currentProgress = Float(questionIndex) / Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLable.text = currentQuestion.text
        questionProgressView.setProgress(currentProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    
    @IBSegueAction func showResult(_ coder: NSCoder) -> ResultViewController? {
        return ResultViewController(coder: coder,responses: answerChosen)
    }
    
    func updateSingleStack(using answers: [Answer]){
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer]){
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multipleButton1.text = answers[0].text
        multipleButton2.text = answers[1].text
        multipleButton3.text = answers[2].text
        multipleButton4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer]){
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedButton1.text = answers.first?.text
        rangedButton2.text = answers.last?.text
        
    }
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI() // show next question
        } else {
            performSegue(withIdentifier: "Results", sender: nil) // all done, show result
        }
    }
   

}
