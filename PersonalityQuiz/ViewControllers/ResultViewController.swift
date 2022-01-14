//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultWithCharacterLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    var answers: [Answer]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateTestResult()
    }
    
    private func updateTestResult() {
        
        var result: Animal = .cat
        var dictionary = [Animal:Int]()
        
        answers.forEach { (answer) in
            if let existingAnimalCount = dictionary[answer.animal] {
                dictionary[answer.animal] = existingAnimalCount + 1
            } else {
                dictionary[answer.animal] = 1
            }
        }
        
        var maxCountAnimal = 0
        
        for(key, value) in dictionary {
            
            if value > maxCountAnimal {
                maxCountAnimal = value
                result = key
            }
        }
        
        updateUI(with: result)
    }
    
    private func updateUI(with animal: Animal) {
        resultWithCharacterLabel.text = "Вы - \(animal.rawValue)!"
        resultDescriptionLabel.text = "\(animal.definition)"
        
    }

}
 
