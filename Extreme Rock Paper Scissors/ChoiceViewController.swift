//
//  ChoiceViewController.swift
//  Extreme Rock Paper Scissors
//
//  Created by Marc Martí Prades on 19/5/17.
//  Copyright © 2017 MMartíDeveloper. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {
    
    var winStreak: Int = 0
    
    @IBOutlet weak var winStreakLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winStreakLabel.text = "Win streak: \(String(describing: winStreak))"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let controller = segue.destination as! ResultViewController
        
        if segue.identifier == "paperChoice"{
            controller.yourChoice = Choice.paper.rawValue
        }
        
        if segue.identifier == "scissorsChoice"{
            controller.yourChoice = Choice.scissors.rawValue
        }
        
        controller.winStreak = self.winStreak
    }
    
    @IBAction func paperChoice(_ sender: UIButton) {
        performSegue(withIdentifier: "paperChoice", sender: self)
    }
    
    @IBAction func rockChoice(_ sender: UIButton) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController

        controller.yourChoice = Choice.rock.rawValue
        
        present(controller, animated: true, completion: nil)
    }
}

