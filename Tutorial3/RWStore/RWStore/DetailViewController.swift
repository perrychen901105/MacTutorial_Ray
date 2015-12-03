//
//  DetailViewController.swift
//  RWStore
//
//  Created by PerryChen on 12/3/15.
//  Copyright © 2015 PerryChen. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {

    @IBOutlet weak var productImageView: NSImageView!
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var descriptionLabel: NSTextField!
    @IBOutlet weak var audienceLabel: NSTextField!
    
    // 1
    var selectedProduct: Product? {
        didSet {
            updateUI()
        }
    }
    
    // 2
    override func viewWillAppear() {
        super.viewWillAppear()
        updateUI()
    }
    
    private func updateUI() {
        if viewLoaded {
            if let product = selectedProduct {
                productImageView.image = product.image
                titleLabel.stringValue = product.title
                descriptionLabel.stringValue = product.descriptionText
                audienceLabel.stringValue = product.audience
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
