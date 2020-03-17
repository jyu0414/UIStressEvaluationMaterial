//
//  ViewController.swift
//  UIStressEvaluationMaterial
//
//  Created by Yuji Sasaki on 2020/03/16.
//  Copyright © 2020 Yuji Sasaki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var indicator: UIActivityIndicatorView! {
        didSet {
            indicator.isHidden = true
        }
    }
    @IBOutlet weak private var label: UILabel!
    @IBOutlet weak private var indicatorSwitch: UISegmentedControl!
    @IBOutlet weak private var waitingLabel: UILabel!
    @IBOutlet weak private var progressBar: UIProgressView! {
        didSet {
            progressBar.transform = CGAffineTransform(scaleX: 1, y: 10)
        }
    }
    var waiting: Bool = false
    var lastNumber: Int = 0

    @IBAction private func buttonTapped(sender: UIButton) {
        if waiting { return }
        waiting = true
        switch indicatorSwitch.selectedSegmentIndex {
        case 0:
            break
        case 1:
            indicator.isHidden = false
            indicator.startAnimating()
            label.text = nil
        case 2:
            progressBar.isHidden = false
            progressBar.progress = 0
            label.text = nil
        case 3:
            waitingLabel.isHidden = false
            label.text = nil
        default:
            break
        }
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            if self.waiting == false { timer.invalidate() }
            self.progressBar.progress += 1/500
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.lastNumber = Range(0...9).filter{$0 != self.lastNumber}.randomElement()!
            self.label.text = "\(self.lastNumber)"
            self.indicator.isHidden = true
            self.progressBar.isHidden = true
            self.waitingLabel.isHidden = true
            self.indicator.stopAnimating()
            self.waiting = false
        }
    }

}

