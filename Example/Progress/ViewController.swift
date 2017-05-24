//
//  ViewController.swift
//  Progress
//
//  Created by popodidi on 05/19/2017.
//  Copyright (c) 2017 popodidi. All rights reserved.
//

import UIKit
import Progress

class ViewController: UIViewController {

    @IBOutlet weak var imageView_1: UIImageView!
    @IBOutlet weak var imageView_2: UIImageView!
    
    @IBOutlet weak var vcSwitch: UISwitch!
    @IBOutlet weak var imageSwitch: UISwitch!
    
    var progressParent: ProgressParent {
        return vcSwitch.isOn ? (self as ProgressParent) : (imageView as ProgressParent)
    }
    
    var imageView: UIImageView {
        return imageSwitch.isOn ? imageView_2 : imageView_1
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Prog.register(progressorView: CustomProgressorView.self, withIdentifier: "custom_example")
    }


    @IBAction func activityIndicatorProgress() {
        Prog.start(in: progressParent, .blur(.dark), .activityIndicator)
    }
    @IBAction func ringProgress() {
        Prog.start(in: progressParent, .blur(.extraLight), .ring(nil))
    }
    @IBAction func customProgress() {
        Prog.start(in: progressParent, .color(UIColor.cyan.withAlphaComponent(0.5)), .custom(identifier: "custom_example", parameter: nil))
    }
    @IBAction func ringAndCustomProgress() {
        let ringParam: RingProgressorParameter = (.endless, UIColor.brown.withAlphaComponent(0.5), 20, 5)
        Prog.start(in: progressParent, .color(nil), .ring(ringParam), .custom(identifier: "custom_example", parameter: nil))
    }
    @IBAction func barProgress() {
        let barParam: BarProgressorParameter = (.endless, .bottom, UIColor.red.withAlphaComponent(0.5), 4)
        Prog.start(in: progressParent, .blur(nil), .bar(barParam))
    }
    @IBAction func ringAndLabelProgress() {
        let ringParam_1: RingProgressorParameter = (.endless, UIColor.black.withAlphaComponent(0.4), 32, 2)
        let ringParam_2: RingProgressorParameter = (.proportional, UIColor.black.withAlphaComponent(0.4), 30, 2)
        let labelParam: LabelProgressorParameter = (UIFont.boldSystemFont(ofSize: 14), UIColor.black.withAlphaComponent(0.6))
        Prog.start(in: progressParent, .blur(nil), .ring(ringParam_2), .label(labelParam))
    }
    @IBAction func end() {
        Prog.end(in: progressParent)
    }
    
    @IBAction func updateProgress(_ sender: UISlider) {
        Prog.update(sender.value, in: progressParent)
    }
}

