//
//  QuestionViewController.swift
//  Personal Quiz
//
//  Created by Bertran on 06.09.2018.
//  Copyright © 2018 Bertran. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView  : UIStackView!
    
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    @IBOutlet weak var rangedStackView  : UIStackView!
    
    @IBOutlet weak var rangeLabel1: UILabel!
    @IBOutlet weak var rengeLabel2: UILabel!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    var questions : [ Question ] = [
        Question(text: "Какая еда вам нравится?",
                 type: .single,
                 answers: [
                    Answer(text: "Стейк", type: .dog),
                    Answer(text: "Рыба", type: .cat),
                    Answer(text: "Морковка", type: .rabbit),
                    Answer(text: "Кукуруза", type: .turtle),
            ]),
        
        Question(text: "Что вам нравится делать?",
                 type: .multiply,
                 answers: [
                    Answer(text: "Есть", type: .dog),
                    Answer(text: "Спать", type: .cat),
                    Answer(text: "Прыгать", type: .rabbit),
                    Answer(text: "Плавать", type: .turtle),
            ]),
        
        Question(text: "На сколько вам нравятся поездки на машине",
                 type: .ranged,
                 answers: [
                    Answer(text: "Ненавижу", type: .cat),
                    Answer(text: "Немного нервничаю", type: .rabbit),
                    Answer(text: "Почти не замечаю", type: .turtle),
                    Answer(text: "Обожаю", type: .dog),
                    
            ])
    ]
    
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    func updateUI() {
        singleStackView.isHidden   = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden   = true
        
        navigationItem.title = "Вопрос № \(questionIndex + 1)"
        
        let currentQuestion  = questions[questionIndex]
        let currentAnswers   = currentQuestion.answers
        let totalProgress    = Float(questionIndex) / Float (questions.count)
        
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            // singleStackView.isHidden = false
            updateSingleStack(using: currentAnswers)
        case .multiply:
            // multipleStackView.isHidden = false
            updatemultipleStack(using: currentAnswers)
        case .ranged:
            // rangedStackView.isHidden = false
            updateRangedStack(using: currentAnswers)
        }
    }

    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updatemultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangeLabel1.text = answers[0].text
        rengeLabel2.text = answers.last?.text
    }
}
