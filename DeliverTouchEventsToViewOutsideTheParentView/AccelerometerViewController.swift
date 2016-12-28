//
//  AccelerometerViewController.swift
//  DeliverTouchEventsToViewOutsideTheParentView
//
//  Created by lining on 2016/12/28.
//  Copyright © 2016年 lilingjie. All rights reserved.
//

import UIKit
import CoreMotion

class AccelerometerViewController: UIViewController {

    @IBOutlet var accelerometerLabel: UILabel!
    
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(AccelerometerViewController.refreshAcceleromate), userInfo: nil, repeats: true)
        timer!.fire()
        
    }

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
    
    deinit {
        timer!.invalidate()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - 开始更新
    fileprivate func startUpdate() {
        // 在OC里 可以将CMMotionManager以属性的方式创建在AppDelegate里面
        // 使用单例对象 提升效率
        let manager = CMMotionManager.sharedManager
        
        if manager.isAccelerometerAvailable {
            
            // setting update interval
            manager.accelerometerUpdateInterval = 0.01
            //  use Pull type trigger start update request
            manager.startAccelerometerUpdates()
        }
    }
    
    // MARK: - 结束更新
    fileprivate func stopUpdate() {
        let manager = CMMotionManager.sharedManager
        
        if manager.isAccelerometerActive {
            manager.stopAccelerometerUpdates()
        }
    }
    
    func refreshAcceleromate() {
        let manager = CMMotionManager.sharedManager
        
        let data = manager.accelerometerData
        if  data != nil {
            let acceleration = data!.acceleration
            accelerometerLabel.text = "x:\(acceleration.x) y:\(acceleration.y) z:\(acceleration.z)"
        }
    }

}

extension CMMotionManager {
    static let sharedManager = CMMotionManager()
}
