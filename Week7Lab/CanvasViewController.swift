//
//  CanvasViewController.swift
//  Week7Lab
//
//  Created by Honorio Vega on 3/12/18.
//  Copyright © 2018 Honorio Vega. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController {

    @IBOutlet weak var trayView: UIView!
    
    // Create a property in your view controller to store the coordinates of the tray's original position
    var trayOriginalCenter: CGPoint!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)

//        let location = sender.location(in: view)
//        let velocity = sender.velocity(in: view)
//        let translation = sender.translation(in: view)
//
        if sender.state == .began {
            print("Gesture began")
            trayOriginalCenter = trayView.center

        } else if sender.state == .changed {
            print("Gesture is changing")
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y + translation.y)
            
        } else if sender.state == .ended {
            print("Gesture ended")
        }
    }
    
}
