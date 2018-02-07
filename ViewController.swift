//
//  ViewController.swift
//  You Are Awesome Version 3
//
//  Created by Clark Newlove on 2/2/18.
//  Copyright © 2018 Newlove. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var awesomeImage: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var soundSwitch: UISwitch!
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageNumber = -1
    var soundNumber = -1
    var lastSound = -1
    let numberOfImages = 5
    let numberOfSounds = 3
    var soundName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
        if let sound = NSDataAsset(name: soundName) {
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: data in\(soundName) couldn't be played as a sound.")
            }
        } else {
            print("ERROR: file \(soundName) didn't load")
        }
    }

    func nonRepeatingRandom(lastNumber: Int, maxValue: Int) -> Int {
        var newIndex = -1
        repeat {
            newIndex = Int(arc4random_uniform(UInt32(maxValue)))
        } while index == newIndex
        return newIndex
    }
    // MARK: - Actions
    
    
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if !soundSwitch.isOn && soundNumber != -1 {
            if soundNumber != -1 {
                if lastSound != -1 {
            awesomePlayer.stop()
    
            }
        }
    }
}
    @IBAction func messageButtonPressed(_ sender: UIButton!) {
        
        let messages = ["You Are Fantastic!",
                      "You Are Great!",
                      "You Are Amazing!",
                      "When the Genius Bar needs help, they call you!",
                      "You Brighten My Day!",
                      "You Are Da Bomb!",
                      "I can't wait to use your app!",
                      "Fabulous? That's You!"]
        
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        awesomeImage.isHidden = false
        
        imageNumber = nonRepeatingRandom(lastNumber: imageNumber, maxValue: numberOfImages)
        awesomeImage.image = UIImage(named: "image\(imageNumber)")
        
        if soundSwitch.isOn {
            soundNumber = nonRepeatingRandom(lastNumber: soundNumber, maxValue: numberOfSounds)
            
            let soundName = "sound\(soundNumber)"
            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        }
        
        
    }
    
}
