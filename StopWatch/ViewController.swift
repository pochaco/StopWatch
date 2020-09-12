//
//  ViewController.swift
//  StopWatch
//
//  Created by Yamamoto Miu on 2020/09/12.
//  Copyright © 2020 Yamamoto Miu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var countLabel : UILabel!
    @IBOutlet var resultLabel : UILabel!
    
    
    var count : Float = 0.0
    var timer : Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        }
    
    @objc func up(){
        count = count + 0.01
        countLabel.text = String(format:"%.2f" ,count)
    }
    
    func hantei(){
        if count >= 9.80 && count <= 10.20 {
            resultLabel.textColor = UIColor.red
            resultLabel.text = "PERFECT!!"
        }
        else if count >= 9.70 && count <= 10.30 {
            resultLabel.textColor = UIColor.yellow
            resultLabel.text = "GREAT!"
        }
        else if count >= 9.50 && count <= 10.50 {
            resultLabel.textColor = UIColor.green
            resultLabel.text = "GOOD"
        }
        else {
            resultLabel.textColor = UIColor.blue
            resultLabel.text = "BAD"
        }
    }
    
    @IBAction func start(){
        //もしタイマーが作動していなかったら
        if !timer.isValid {
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                 target:self,
                                 selector: #selector(self.up),
                                 userInfo: nil,
                                 repeats: true)
        }
        resultLabel.text = ""
    }
    @IBAction func stop(){
        if timer.isValid {
            timer.invalidate()
        }
        self.hantei()
    }
    @IBAction func reset(){
        if timer.isValid{
            timer.invalidate()
        }
        count = 0.0
        countLabel.text = String(count)
    }

}

