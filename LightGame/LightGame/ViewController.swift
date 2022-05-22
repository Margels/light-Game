//
//  ViewController.swift
//  LightGame
//
//  Created by Martina on 21/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var label: UILabel!
    
    // dark view to add light effect
    lazy var shadowView: UIView = {
        let v = UIView()
        v.frame = view.bounds
        v.alpha = 0.90
        v.backgroundColor = UIColor(named: "darkness")
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add light effect view
        view.addSubview(shadowView)
        view.bringSubviewToFront(shadowView)
        
        // set initial shadow: shadowOffset
        label.alpha = 0
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowRadius = 5
        label.layer.shadowOpacity = 1
        label.layer.shadowOffset = CGSize(width: 10, height: 0)
        
        // start animation: shadowOffset
        self.rightShadow()
        
    }
    
    
    
// MARK: - Calculate trigonometry
    
    // calculate x and y points of the shadow to make it move in circular motion
    func calcTrig(segment: segment, size: CGFloat, angle: CGFloat) -> [segment : CGFloat] {
        
        switch segment {
            
            case .x:
                
                let x = size
                let y = tan(angle * .pi/180) * x
                let h = x / cos(angle * .pi/180)
                return [ .x : x, .y : y, .h : h]
            
            case .y:
                
                let y = size
                let x = y / tan(angle * .pi/180)
                let h = y / sin(angle * .pi/180)
                return [ .x : x, .y : y, .h : h]
            
            case .h:
            
                let h = size
                let x = cos(angle * .pi/180) * h
                let y = sin(angle * .pi/180) * h
                return [ .x : x, .y : y, .h : h]
            
        }
        
    }
    
    
// MARK: - Shadow using shadowOffset

    // shadow on the right, label starts appearing, light effect view makes view darker
    func rightShadow() {
        
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) {
            
            self.label.alpha = 0.75
            self.shadowView.alpha = 0.6
            
        } completion: { success in
            
            // move it lower
            self.rightHalfBottomShadow()
            
        }
        
    }
    
    // move shadow a bit lower, label fully appeared, light effect view gets lighter
    func rightHalfBottomShadow() {
        
        UIView.animate(withDuration: 0.75, delay: 0, options: .curveLinear) {
            
            self.label.alpha = 1
            let trig = self.calcTrig(segment: .h, size: 10, angle: 22.5)
            let x = trig[.x]
            let y = trig[.y]
            self.label.layer.shadowOffset = CGSize(width: x!, height: y!)
            self.shadowView.alpha = 0.5
            
        } completion: { success in
            
            self.rightBottomShadow()
            
        }
        
    }
    
    // move shadow to bottom right, light effect view creates light effect
    func rightBottomShadow() {
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveLinear) {
            
            let trig = self.calcTrig(segment: .h, size: 10, angle: 45)
            let x = trig[.x]
            let y = trig[.y]
            self.label.layer.shadowOffset = CGSize(width: x!, height: y!)
            self.shadowView.alpha = 0.4
            
        } completion: { success in
            
            self.halfRightBottomShadow()
            
        }
        
    }
    
    // move shadow more to the bottom, light eeffect view gets lighter
    func halfRightBottomShadow() {
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear) {
            
            let trig = self.calcTrig(segment: .h, size: 10, angle: 67.5)
            let x = trig[.x]
            let y = trig[.y]
            self.label.layer.shadowOffset = CGSize(width: x!, height: y!)
            self.shadowView.alpha = 0.2
            
        } completion: { success in
            
            self.bottomShadow()
            
        }
        
    }
    
    // shadow is at the bottom, light effect view gets slightly darker
    func bottomShadow() {
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear) {
            
            let trig = self.calcTrig(segment: .h, size: 10, angle: 90)
            let x = trig[.x]
            let y = trig[.y]
            self.label.layer.shadowOffset = CGSize(width: x!, height: y!)
            self.shadowView.alpha = 0.3
            
        } completion: { success in
            
            self.halfLeftBottomShadow()
            
        }
        
    }
    
    // shadow moves to the left and light effect view makes view darker
    func halfLeftBottomShadow() {
        
        UIView.animate(withDuration: 0.8, delay: 0, options: .curveLinear) {
            
            let trig = self.calcTrig(segment: .h, size: 10, angle: 112.5)
            let x = trig[.x]
            let y = trig[.y]
            self.label.layer.shadowOffset = CGSize(width: x!, height: y!)
            self.shadowView.alpha = 0.5
            
        } completion: { success in
            
            self.leftBottomShadow()
            
        }
        
    }
    
    // shadow moves to the bottom left and light effect view gets dark
    func leftBottomShadow() {
        
        UIView.animate(withDuration: 2, delay: 0, options: .curveEaseOut) {
            
            let trig = self.calcTrig(segment: .h, size: 10, angle: 135)
            let x = trig[.x]
            let y = trig[.y]
            self.label.layer.shadowOffset = CGSize(width: x!, height: y!)
            self.shadowView.alpha = 0.7
            
        }
        
    }
    
}


enum segment {
    
    case x
    case y
    case h

}
