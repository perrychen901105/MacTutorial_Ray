//
//  WordCountViewController.swift
//  BabyScript
//
//  Created by PerryChen on 12/2/15.
//  Copyright © 2015 PerryChen. All rights reserved.
//

import Cocoa

class WordCountViewController: NSViewController {

    @IBOutlet weak var workCount: NSTextField!
    @IBOutlet weak var paragraphCount: NSTextField!
    
    
    @IBAction func dismissWordCountWindow(sender: NSButton) {
        let application = NSApplication.sharedApplication()
        application.stopModal()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
