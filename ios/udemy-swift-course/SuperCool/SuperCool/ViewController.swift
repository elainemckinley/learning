//
//  ViewController.swift
//  SuperCool
//
//  Created by Austin McKinley on 4/6/16.
//  Copyright © 2016 Austin McKinley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var coolLogo: UIImageView!
    @IBOutlet weak var coolBg: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func doTheThing(sender: AnyObject) {
        coolLogo.hidden = false
        coolBg.hidden = false
        button.hidden = true
    }
}

