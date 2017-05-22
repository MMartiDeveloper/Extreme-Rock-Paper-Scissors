//
//  IntroViewController.swift
//  Extreme Rock Paper Scissors
//
//  Created by Marc Martí Prades on 19/5/17.
//  Copyright © 2017 MMartíDeveloper. All rights reserved.
//

import UIKit
import AVFoundation

class IntroViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playBackgroundMusic()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: MUSICA AMBIENTAL 
    func playBackgroundMusic() {
        let aSound = NSURL(fileURLWithPath: Bundle.main.path(forResource: "audioFile", ofType: "mp3")!)
        do {
            audioPlayer = try AVAudioPlayer(contentsOf:aSound as URL)
            audioPlayer!.numberOfLoops = -1
            audioPlayer!.prepareToPlay()
            audioPlayer!.play()
        } catch {
            print("Cannot play the file")
        }
    }
}
