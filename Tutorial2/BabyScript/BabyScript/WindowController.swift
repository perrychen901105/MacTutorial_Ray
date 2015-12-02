//
//  WindowController.swift
//  BabyScript
//
//  Created by PerryChen on 12/2/15.
//  Copyright © 2015 PerryChen. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        if let window = window, screen = window.screen {
            print("the screen height is \(screen.visibleFrame.height)")
            let offsetFromLeftOfScreen: CGFloat = 20
            let offsetFromTopOfScreen: CGFloat = 20
            let screenRect = screen.visibleFrame
            let newOriginY = CGRectGetMaxY(screenRect) - window.frame.height - offsetFromTopOfScreen
            window.setFrameOrigin(NSPoint(x: offsetFromLeftOfScreen, y: newOriginY))
        }
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        shouldCascadeWindows = true
    }
}
