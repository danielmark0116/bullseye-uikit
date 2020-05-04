//
//  ViewController.swift
//  bullsEye
//
//  Created by Daniel Grychtoł on 25/04/2020.
//  Copyright © 2020 Daniel Grychtoł. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var targetLabel: UILabel?;
    @IBOutlet weak var scoreLabel: UILabel?;
    @IBOutlet weak var slider: UISlider?;
    var gameHandler = GameHandler(5) {
        didSet {
            targetLabel?.text = String(gameHandler.target)
            scoreLabel?.text = String(gameHandler.playersPoints)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        targetLabel?.text = String(gameHandler.target)
        scoreLabel?.text = String(gameHandler.playersPoints)
        
        let thumbImg = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        let thumbImgHighlighted = #imageLiteral(resourceName: "SliderThumb-Normal")
        let thumbLeftPart = #imageLiteral(resourceName: "SliderTrackLeft").resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14))
        let thumbRightPart = #imageLiteral(resourceName: "SliderTrackRight").resizableImage(withCapInsets: UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14))
        
        slider?.setThumbImage(thumbImg, for: .normal)
        slider?.setThumbImage(thumbImgHighlighted, for: .highlighted)
        
        slider?.setMinimumTrackImage(thumbLeftPart, for: .normal)
        slider?.setMaximumTrackImage(thumbRightPart, for: .normal)
    }
    
    
    func updateGame() {
        gameHandler.getNewTarget()
//        scoreLabel?.text = String(gameHandler.playersPoints)
//        targetLabel?.text = String(gameHandler.target)
    }
    
    func handleAlert(alert: UIAlertAction) {
        updateGame()
    }
   
    @IBAction func sliderHandler(_ sender: UISlider) {
        gameHandler.setValue(sender.value * 100)
    }
    
    @IBAction func resetGame(_ sender: UIButton) {
        print("reset game")
        gameHandler.gameReset()
        slider?.setValue(0, animated: true)
    }
    
    @IBAction func hitMe(_ sender: UIButton) {
        let wasGuessClose = gameHandler.wasCloseToTarget()
        
        let title: String = wasGuessClose ? "Congratz!" : "Try again..."
        let message: String = wasGuessClose ? "You gain 10 points!" : "You get ZERO points..."
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
//        let alertButton = UIAlertAction(title: "Ok", style: .default, handler: handleAlert)
        
        let alertButton = UIAlertAction(title: "Ok", style: .default) {
            (_ x: UIAlertAction) in
            print("")
        }
        
        alert.addAction(alertButton)
        
        present(alert, animated: true, completion: {
            print("completed")
        })
    }
}

