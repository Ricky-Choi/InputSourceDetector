//
//  ViewController.swift
//  IS
//
//  Created by Jaeyoung Choi on 2020/05/29.
//  Copyright © 2020 Jaeyoung. All rights reserved.
//

import Cocoa
import Carbon
import InputSourceDetector

class ViewController: NSViewController {
    
    let isDetector = InputSourceDetector()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        isDetector.observeChangeInputSource { (source) in
            print("DETECTED", source)
        }
    }

    @IBAction func reload(_ sender: Any) {
        print(isDetector.currentInputSource)
    }
    
    
    
}

