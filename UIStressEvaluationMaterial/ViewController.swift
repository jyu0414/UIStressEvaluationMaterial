//
//  ViewController.swift
//  UIStressEvaluationMaterial
//
//  Created by Yuji Sasaki on 2020/03/16.
//  Copyright © 2020 Yuji Sasaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var indicator: UIActivityIndicatorView!
    @IBOutlet weak private var label: UILabel!
    @IBOutlet weak private var indicatorSwitch: UISwitch!
    var waiting: Bool = false

    @IBAction private func buttonTapped(sender: UIButton) {
        if waiting { return }
        waiting = true
        if indicatorSwitch.isOn {
            indicator.isHidden = false
            indicator.startAnimating()
            label.text = ""
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.label.text = "\(Int.random(in: 0...9))"
            self.indicator.isHidden = true
            self.indicator.startAnimating()
            self.waiting = false
        }
    }

}

