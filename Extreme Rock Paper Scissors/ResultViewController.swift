//
//  ResultViewController.swift
//  Extreme Rock Paper Scissors
//
//  Created by Marc Martí Prades on 19/5/17.
//  Copyright © 2017 MMartíDeveloper. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var yourChoice: Int!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        result()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func result(){
        let randomValue = arc4random() % 101
        if randomValue >= 98{
            descriptionLabel.text = createAWin(choice: yourChoice)
            resultLabel.text = "YOU WIN"
            resultLabel.textColor = UIColor.red
        }else if randomValue >= 93{
            descriptionLabel.text = createATie(choice: yourChoice)
            resultLabel.text = "IT'S A TIE, actually is like a lose"
        }else{
            descriptionLabel.text = createALose(choice: yourChoice)
            resultLabel.text = "YOU LOSE"
            resultLabel.textColor = UIColor.blue
        }
    }
    
    func createALose(choice: Int) -> String{
        var result: String = ""
        switch Choice(rawValue: choice)! {
            case .rock:
                result = "rock is covered by paper"
                resultImage.image = UIImage(named: "PaperCoversRock")
            case .paper:
                result = "paper is cut by scissors"
                resultImage.image = UIImage(named: "ScissorsCutPaper")
            case .scissors:
                result = "scissors are broke by the rock"
                resultImage.image = UIImage(named: "RockCrushesScissors")
        }
        return result
    }
    
    func createATie(choice: Int) -> String{
        var result: String = ""
        switch Choice(rawValue: choice)! {
        case .rock:
            result = "Rock to rock"
            resultImage.image = UIImage(named: "itsATie")
        case .paper:
            result = "Paper to paper"
            resultImage.image = UIImage(named: "itsATie")
        case .scissors:
            result = "Scissors to scissors"
            resultImage.image = UIImage(named: "itsATie")
        }
        return result
    }
    
    func createAWin(choice: Int) -> String{
        var result: String = ""
        switch Choice(rawValue: choice)! {
        case .rock:
            result = "Rock breaks scissors"
            resultImage.image = UIImage(named: "RockCrushesScissors")
        case .paper:
            result = "Paper covers rock"
            resultImage.image = UIImage(named: "PaperCoversRock")
        case .scissors:
            result = "Scissors cuts paper"
            resultImage.image = UIImage(named: "ScissorsCutPaper")
        }
        return result
    }

}
