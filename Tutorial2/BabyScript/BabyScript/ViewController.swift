//
//  ViewController.swift
//  BabyScript
//
//  Created by PerryChen on 12/2/15.
//  Copyright © 2015 PerryChen. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var text: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text.toggleRuler(nil)
        // Do any additional setup after loading the view.
    }

    @IBAction func showWordCountWindow(sender: AnyObject) {
        // 1
        // Instantiate the word count window controller, using the storyboard ID you specified before.
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let wordCountWindowController = storyboard.instantiateControllerWithIdentifier("Word Count Window Controller") as! NSWindowController
        if let wordCountWindow = wordCountWindowController.window, textStorage = text.textStorage {
            // 2
            // Set the values retrieved from the text view in the word count window count outlets
            let wordCountViewController = wordCountWindow.contentViewController as! WordCountViewController
            wordCountViewController.workCount.stringValue = "\(textStorage.words.count)"
            wordCountViewController.paragraphCount.stringValue = "\(textStorage.paragraphs.count)"
            
            // 3
            // Show the word count window modally
            let application = NSApplication.sharedApplication()
            application.runModalForWindow(wordCountWindow)
        }
    }
    
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

