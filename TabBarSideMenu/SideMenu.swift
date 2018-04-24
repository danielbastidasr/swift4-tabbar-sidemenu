//
//  SideMenu.swift
//  TabBarSideMenu
//
//  Created by Daniel Bastidas Ramirez on 23/04/2018.
//  Copyright © 2018 Daniel Bastidas. All rights reserved.
//

import UIKit

class SideMenu: UIView{
    
    @IBOutlet weak var viewConstraint: NSLayoutConstraint!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        viewConstraint.constant = -165
    }
    
    @IBAction func home(_ sender: Any) {
        print("Home Clicked")
        click()
    }
    
    @IBAction func aboutUs(_ sender: Any) {
        print("About us Clicked")
        click()
    }
    
    /**
     This *function* will respond to the swipe right/left gesture
     - Parameter gesture: Gesture Recogniser
     */
    func slide(gesture: UIPanGestureRecognizer) {
        if gesture.state == .began || gesture.state == .changed {
            
            let translation = gesture.translation(in: self).x
            
            if translation > 0 { // swipe right
                
                if viewConstraint.constant < 20 {
                    UIView.animate(withDuration: 0.2, animations: {
                        
                        self.viewConstraint.constant += translation / 10
                        self.layoutIfNeeded()
                        
                    })
                }
                
            }else {             // swipe left
                if viewConstraint.constant > -165 {
                    UIView.animate(withDuration: 0.2, animations: {
                        
                        self.viewConstraint.constant += translation / 10
                        self.layoutIfNeeded()
                        
                    })
                }
            }
            
        } else if gesture.state == .ended {
            
            if viewConstraint.constant < -100 {
                UIView.animate(withDuration: 0.2, animations: {
                    
                    self.viewConstraint.constant = -165
                    self.layoutIfNeeded()
                    
                })
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    
                    self.viewConstraint.constant = 0
                    self.layoutIfNeeded()
                    
                })
            }
            
        }
    }
    
    /**
     This *function* will respond to the hide or show click event
     */
    func click()  {
        UIView.animate(withDuration: 0.2, animations: {
            
            if(self.viewConstraint.constant < -100){
                self.viewConstraint.constant = -10
            }
            else{
                 self.viewConstraint.constant = -165
            }
        })
    }
}
