//
//  ViewController.swift
//  LightGame
//
//  Created by Martina on 21/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
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
    
  
    
}


enum segment {
    
    case x
    case y
    case h

}
