//
//  ViewController.swift
//  PageController
//
//  Created by Max Langer on 01.09.15.
//  Copyright © 2015 Max Langer. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSPageControllerDelegate {

    var pageController: NSPageController!
    
    let views = ["Split", "Split", "Split"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.pageController = NSPageController()
        
        self.pageController.delegate = self
        self.pageController.view = self.view
        
        self.pageController.arrangedObjects = views
        self.pageController.transitionStyle = NSPageControllerTransitionStyle.HorizontalStrip
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func pageController(pageController: NSPageController, identifierForObject object: AnyObject) -> String {
        return object as! String
    }
    
    func pageController(pageController: NSPageController, viewControllerForIdentifier identifier: String) -> NSViewController {
        let controller = self.storyboard?.instantiateControllerWithIdentifier(identifier) as! NSViewController
        controller.view.autoresizingMask = [.ViewHeightSizable, .ViewWidthSizable]
        
        return controller
    }

    func pageControllerDidEndLiveTransition(pageController: NSPageController) {
        pageController.completeTransition()
        pageController.selectedViewController!.view.autoresizingMask = [.ViewHeightSizable, .ViewWidthSizable]
    }
}

