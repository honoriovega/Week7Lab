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
    
    //Create two view controller properties to store the tray's position when it's "up" and "down" as well as the offset amount that the tray will move down.
    var trayDownOffset: CGFloat!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        trayDownOffset = 220
        trayUp = trayView.center // The initial position of the tray
        
        // The position of the tray transposed down
        trayDown = CGPoint(x: trayView.center.x ,y: trayView.center.y + trayDownOffset)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPanTray(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)

//        let location = sender.location(in: view)
            let velocity = sender.velocity(in: view)
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
            if(velocity.y > 0) {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.trayView.center = self.trayDown
                }, completion: nil)
                
            } else {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] ,
                               animations: { () -> Void in
                                self.trayView.center = self.trayUp
                }, completion: nil)
            }
        }
    }
    
}
