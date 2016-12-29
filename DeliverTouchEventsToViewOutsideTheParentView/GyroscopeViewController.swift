//
//  GyroscopeViewController.swift
//  DeliverTouchEventsToViewOutsideTheParentView
//
//  Created by lining on 2016/12/28.
//  Copyright © 2016年 lilingjie. All rights reserved.
//

import UIKit
import CoreMotion

class GyroscopeViewController: UIViewController {

    @IBOutlet var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    /**
     CMGyroData 里面rotationRate属性 对应CMRotationMatrix结构
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        startUpdate()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        stopUpdate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   fileprivate func startUpdate() {
        let interval = 0.1
        
        let manager = CMMotionManager.sharedManager
        
        if manager.isGyroAvailable {
            manager.gyroUpdateInterval = interval
            manager.startGyroUpdates(to: OperationQueue.main, withHandler: { (data: CMGyroData?, error) in
                if data != nil {
                    let rotationRate = data!.rotationRate
//                    self.dataLabel.text = "x:\(rotationRate.x) y:\(rotationRate.y) z:\(rotationRate.z)"
                    
                    let x = (atan(rotationRate.z / rotationRate.y) * 180) / M_PI
                    if x < 10 && x > -10 {
                        self.dataLabel.text = "Vertical"
                    }
                    else {
                        self.dataLabel.text = "No Vertical"
                    }
                }
            })
        }
    }
    
    fileprivate func stopUpdate() {
        if CMMotionManager.sharedManager.isGyroActive {
            CMMotionManager.sharedManager.stopGyroUpdates()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
