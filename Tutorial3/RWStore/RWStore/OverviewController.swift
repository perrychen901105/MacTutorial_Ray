//
//  OverviewController.swift
//  RWStore
//
//  Created by PerryChen on 12/3/15.
//  Copyright © 2015 PerryChen. All rights reserved.
//

import Cocoa

class OverviewController: NSViewController {

    
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var descriptionLabel: NSTextField!
    @IBOutlet weak var priceLabel: NSTextField!
    @IBOutlet weak var productImageView: NSImageView!
    
    // 1 : to show the value of price
    let numberformatter = NSNumberFormatter()
    // 2
    var selectedProduct: Product? {
        didSet {
            updateUI()
        }
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberformatter.numberStyle = .CurrencyStyle
    }
    
    private func updateUI() {
        // 1
        if viewLoaded {
            // 2
            if let product = selectedProduct {
                productImageView.image = product.image
                titleLabel.stringValue = product.title
                descriptionLabel.stringValue = product.descriptionText
                priceLabel.stringValue = numberformatter.stringFromNumber(product.price)!
            }
        }
    }
    

    
}
