//
//  ViewController.swift
//  ContainerViewDemo
//
//  Created by IosDeveloper on 19/01/18.
//  Copyright © 2018 iOSDeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstContainer: UIView!
    @IBOutlet weak var secondContainer: UIView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ///Add Subviews
        self.add(asChildViewController: FirstObject)
        self.add2(asChildViewController: SecondObject)
    }
    
    //MARK:- Create Weak Refrence for VC1
    private lazy var FirstObject: firstVC =
    {
        // Instantiate View Controller
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "firstVC") as! firstVC
        
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        return viewController
    }()
    
    //MARK:- Create Weak Refrence for VC2
    private lazy var SecondObject: secondVC =
    {
        // Instantiate View Controller
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") as! secondVC
        
        // Add View Controller as Child View Controller
        self.addChildViewController(viewController)
        return viewController
    }()
    
    //MARK:- Create Function to add VC1 As Subview
    private func add(asChildViewController viewController: UIViewController)
    {
        // Configure Child View
        viewController.view.frame = CGRect(x: 0, y: 0, width: self.firstContainer.frame.size.width, height: self.firstContainer.frame.size.height)
        
        // Add Child View Controller
        addChildViewController(viewController)
        viewController.view.translatesAutoresizingMaskIntoConstraints = true
        
        // Add Child View as Subview
        firstContainer.addSubview(viewController.view)
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    //MARK:- Create Function to add VC2 As Subview
    private func add2(asChildViewController viewController: UIViewController)
    {
        // Configure Child View
        viewController.view.frame = CGRect(x: 0, y: 0, width: self.secondContainer.frame.size.width, height: self.secondContainer.frame.size.height)
        
        // Add Child View Controller
        addChildViewController(viewController)
        viewController.view.translatesAutoresizingMaskIntoConstraints = true
        
        // Add Child View as Subview
        secondContainer.addSubview(viewController.view)
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    //MARK:- Create Function to Remove VC1 As Subview
    private func remove(asChildViewController viewController: UIViewController)
    {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        secondContainer.willRemoveSubview(viewController.view)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }

}

