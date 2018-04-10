//
//  ViewController.swift
//  Timer
//
//  Created by D7702_10 on 2018. 4. 10..
//  Copyright © 2018년 ksh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var swt: UISwitch!
    var myTimer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        //myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        swt.setOn(false, animated: true)
    }
    @objc func updateTime() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss EE"
        lbl.text = formatter.string(from: date)
    }

    @IBAction func sw(_ sender: Any) {
        if swt.isOn == true {
            //myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
            
            // closure 사용
            myTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: {(myTimer) in
                self.updateTime()
            })
        } else {
            myTimer.invalidate()
        }
    }
}

