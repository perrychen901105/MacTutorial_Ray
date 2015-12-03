//
//  ViewController.swift
//  RWStore
//
//  Created by PerryChen on 12/3/15.
//  Copyright © 2015 PerryChen. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    private var products = [Product]()
    var selectedProduct: Product!
    
    @IBOutlet weak var productsButton: NSPopUpButton!
    
    private var overviewViewController: OverviewController!
    private var detailViewController: DetailViewController!
    
    @IBAction func valueChanged(sender: NSPopUpButton) {
        if let bookTitle = sender.selectedItem?.title, let index = products.indexOf({$0.title == bookTitle}) {
            selectedProduct = products[index]
            overviewViewController.selectedProduct = selectedProduct
            detailViewController.selectedProduct = selectedProduct
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let filePath = NSBundle.mainBundle().pathForResource("Products", ofType: "plist") {
            products = Product.productsList(filePath)
        }
        
        // 1 removes all items in the pop-up button, getting rid of the item1 and item2 entries
        productsButton.removeAllItems()
        // 2 adds an item for every product, showing its title
        for product in products {
            productsButton.addItemWithTitle(product.title)
        }
        // 3 selects first product
        selectedProduct = products[0]
        productsButton.selectItemAtIndex(0)
        
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
        // 1
        let tabViewController = segue.destinationController as! NSTabViewController
        // 2
        for controller in tabViewController.childViewControllers {
            // 3
            if controller.dynamicType == OverviewController.self {
                overviewViewController = controller as! OverviewController
                overviewViewController.selectedProduct = selectedProduct
            } else {
                detailViewController = controller as! DetailViewController
                detailViewController.selectedProduct = selectedProduct
            }
        }
    }

}

