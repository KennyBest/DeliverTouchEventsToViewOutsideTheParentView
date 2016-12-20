//
//  SFParentView.swift
//  DeliverTouchEventsToViewOutsideTheParentView
//
//  Created by llj on 2016/12/20.
//  Copyright © 2016年 lilingjie. All rights reserved.
//

import UIKit

class SFParentView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    @IBOutlet var targetView: UIView!
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        
        let pointForTargetView = self.targetView.convert(point, from: self)
        
        if self.targetView.bounds.contains(pointForTargetView) {
            return self.targetView.hitTest(pointForTargetView, with: event)
        }
        
        return super.hitTest(point, with: event)
    }

}
