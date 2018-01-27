//
//  ViewController.swift
//  retro-calculator
//
//  Created by Austin McKinley on 4/6/16.
//  Copyright © 2016 Austin McKinley. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLbl: UILabel!
    var btnSound: AVAudioPlayer!
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var result =  ""
    var currentOperation = Operation.Empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundurl = NSURL(fileURLWithPath: path!)

        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundurl)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func numberPressed(btn: UIButton!) {
        playSound()
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
    }
    
    
    @IBAction func onDividePress(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject) {
        processOperation(Operation.Multiply)
    }
    
    @IBAction func onSubtractPress(sender: AnyObject) {
        processOperation(Operation.Subtract)
    }
    
    @IBAction func onAddPress(sender: AnyObject) {
        processOperation(Operation.Add)
    }
    
    @IBAction func onEqualPress(sender: AnyObject) {
        processOperation(currentOperation)
    }
    
    @IBAction func onClearPress(sender: AnyObject) {
        playSound()
        
        result = ""
        leftValStr = ""
        rightValStr = ""
        currentOperation = Operation.Empty
        runningNumber = ""
        outputLbl.text = "0"
    }
    
    func processOperation(op: Operation) {
        playSound()
        
        if runningNumber != "" {
            if currentOperation == Operation.Empty {
                leftValStr = runningNumber
                runningNumber = ""
            } else {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation ==  Operation.Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation ==  Operation.Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation ==  Operation.Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                outputLbl.text = result
            }
        }
        currentOperation = op
    }
    
    func playSound() {
        if btnSound.playing {
            btnSound.stop()
        }
        btnSound.play()
    }
}

