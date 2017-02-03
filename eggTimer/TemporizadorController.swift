//
//  ViewController.swift
//  eggTimer
//
//  Created by Carlos on 2/2/17.
//  Copyright © 2017 Chichiri Games. All rights reserved.
//

import UIKit

class TemporizadorController: UIViewController {

    var timer = Timer()
    var time = 210
    @IBOutlet weak var lblTime: UILabel!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }
    
    func decreaseTimer() {
        if time > 0 {
            time -= 1
            lblTime.text = String(time/60)
        } else {
            timer.invalidate()
        }
    }
    
    @IBAction func PlayPressed(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TemporizadorController.decreaseTimer), userInfo: nil, repeats: true)
    }
    @IBAction func PausedPressed(_ sender: Any) {
        timer.invalidate()
    }
    @IBAction func Less10(_ sender: Any) {
        time -= 10
        
        if(time < 0 ){
            time = 0
        }
        
        lblTime.text = String(time)
    }
    @IBAction func Plus10(_ sender: Any) {
        time += 10        
        lblTime.text = String(time)
    }
    @IBAction func PressedReset(_ sender: Any) {
        time = 210
        lblTime.text = String(time)
    }

}

