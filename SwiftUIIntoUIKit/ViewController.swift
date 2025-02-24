//
//  ViewController.swift
//  SwiftUIIntoUIKit
//
//  Created by Manish on 23/01/25.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostingController = UIHostingController(rootView: SwiftUIView())
        addChild(hostingController)
        
        view.addSubview(hostingController.view)
        
        hostingController.view.frame = view.bounds

        hostingController.didMove(toParent: self)
        
        
    }
}

