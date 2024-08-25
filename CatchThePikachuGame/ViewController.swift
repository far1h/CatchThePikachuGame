//
//  ViewController.swift
//  CatchThePikachuGame
//
//  Created by Farih Muhammad on 25/08/2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var pika1: UIImageView!
    @IBOutlet weak var pika2: UIImageView!
    @IBOutlet weak var pika3: UIImageView!
    @IBOutlet weak var pika4: UIImageView!
    @IBOutlet weak var pika5: UIImageView!
    @IBOutlet weak var pika6: UIImageView!
    @IBOutlet weak var pika7: UIImageView!
    @IBOutlet weak var pika8: UIImageView!
    @IBOutlet weak var pika9: UIImageView!
    
    var score = 0
    var count = 0
    var timer = Timer()
    var pikachuArray = [UIImageView]()
    var hideTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score: \(score)"
        
        pika1.isUserInteractionEnabled = true
        pika2.isUserInteractionEnabled = true
        pika3.isUserInteractionEnabled = true
        pika4.isUserInteractionEnabled = true
        pika5.isUserInteractionEnabled = true
        pika6.isUserInteractionEnabled = true
        pika7.isUserInteractionEnabled = true
        pika8.isUserInteractionEnabled = true
        pika9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        pika1.addGestureRecognizer(recognizer1)
        pika2.addGestureRecognizer(recognizer2)
        pika3.addGestureRecognizer(recognizer3)
        pika4.addGestureRecognizer(recognizer4)
        pika5.addGestureRecognizer(recognizer5)
        pika6.addGestureRecognizer(recognizer6)
        pika7.addGestureRecognizer(recognizer7)
        pika8.addGestureRecognizer(recognizer8)
        pika9.addGestureRecognizer(recognizer9)
        
        pikachuArray = [
            pika1,
            pika2,
            pika3,
            pika4,
            pika5,
            pika6,
            pika7,
            pika8,
            pika9
        ]
        
        count = 10
        timeLabel.text = String(count)
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hidePikachu), userInfo: nil, repeats: true)
        
        hidePikachu()
        
    }
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }

    @objc func countDown(){
        count -= 1
        timeLabel.text = String(count)
        
        if count == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            for pika in pikachuArray{
                pika.isHidden = true
            }
            
            let alert = UIAlertController(title: "Time is Up", message: "Do you want to play again?", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel)
            
            let replayButton = UIAlertAction(title: "Replay", style: .default) { UIAlertAction in
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.count = 10
                self.timeLabel.text = String(self.count)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hidePikachu), userInfo: nil, repeats: true)
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func hidePikachu(){
        for pika in pikachuArray{
            pika.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(pikachuArray.count - 1)))
        pikachuArray[random].isHidden = false
    }
    
    
}

