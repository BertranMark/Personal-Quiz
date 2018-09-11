//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by Bertran on 06.09.2018.
//  Copyright © 2018 Bertran. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var responces : [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var textLabel: UILabel!
    
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        let responceTypes = responces.map { $0.type }
        // из массива ответов берем массив типов животных
        
        for animal in responceTypes {
            if  frequencyOfAnswers[animal] == nil {
                frequencyOfAnswers[animal] = 1
            } else {
                frequencyOfAnswers[animal] = frequencyOfAnswers[animal]! + 1
            }
        }
        // подсчет количества ответов связанных с конкретным животным
        
        let freqSorted    = frequencyOfAnswers.sorted { $0.1 > $1.1 }
        let maximumAnimal = freqSorted.first?.key
        let maximumValue  = freqSorted.first?.value
        // поиск животного, встречающегося максимальное количество раз в ответах и определение количества этих ответов
        
        
        if maximumValue == 1 { // это значит, что пользователь выбирал каждый раз ответ для разных животных
            resultLabel.text = "Хм..."
            textLabel.text = "Похоже вам трудно определиться. Нажмите Done и попробуйте пройти тест снова"
        } else {
            resultLabel.text = "Вы \(maximumAnimal!.rawValue)"
            textLabel.text = maximumAnimal?.definition
        }
       
    }

}
