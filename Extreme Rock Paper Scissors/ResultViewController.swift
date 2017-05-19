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
    var win: Bool = false
    var winStreak: Int!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        result()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! ChoiceViewController
        if win{
            if winStreak < 0{
                controller.winStreak = 1
            }else{
                controller.winStreak = winStreak + 1
            }
        }else{
             if winStreak > 0{
                controller.winStreak = -1
             }else{
                controller.winStreak = winStreak - 1
            }
        }
    }
    
    //MARK: Probabilidades de ganar
    //Seria muy aburrido que fuera un juego justo
    
    func result(){
        let randomValue = 1 + arc4random() % 100
        if randomValue >= 97{
            descriptionLabel.text = createAWin(choice: yourChoice)
            resultLabel.text = "YOU WIN"
            win = true
        }else if randomValue >= 90{
            descriptionLabel.text = createATie(choice: yourChoice)
            resultLabel.text = "IT'S A TIE \n actually is like a lose"
        }else{
            descriptionLabel.text = createALose(choice: yourChoice)
            resultLabel.text = "YOU LOSE"
        }
    }
    
    func createALose(choice: Int) -> String{
        var result: String = ""
        switch Choice(rawValue: choice)! {
            case .rock:
                result = "rock is covered by paper"
                winingImage(winner: Choice.paper.rawValue)
            case .paper:
                result = "paper is cut by scissors"
                winingImage(winner: Choice.scissors.rawValue)
            case .scissors:
                result = "scissors are crushed by the rock"
                winingImage(winner: Choice.rock.rawValue)
        }
        return result
    }
    
    func createATie(choice: Int) -> String{
        var result: String = ""
        switch Choice(rawValue: choice)! {
        case .rock:
            result = "Rock to rock"
        case .paper:
            result = "Paper to paper"
        case .scissors:
            result = "Scissors to scissors"
        }
        resultImage.image = #imageLiteral(resourceName: "itsATie")
        return result
    }
    
    func createAWin(choice: Int) -> String{
        var result: String = ""
        switch Choice(rawValue: choice)! {
        case .rock:
            result = "Rock breaks scissors"
        case .paper:
            result = "Paper covers rock"
        case .scissors:
            result = "Scissors cuts paper"
        }
        winingImage(winner: choice)
        return result
    }
    
    func winingImage(winner: Int){
        switch Choice(rawValue: winner)! {
        case .rock:
            resultImage.image = #imageLiteral(resourceName: "RockCrushesScissors")
        case .paper:
            resultImage.image = #imageLiteral(resourceName: "PaperCoversRock")
        case .scissors:
            resultImage.image = #imageLiteral(resourceName: "ScissorsCutPaper")
        }
    }
}
