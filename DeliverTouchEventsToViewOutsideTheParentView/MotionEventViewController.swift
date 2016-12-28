//
//  MotionEventViewController.swift
//  DeliverTouchEventsToViewOutsideTheParentView
//
//  Created by lining on 2016/12/26.
//  Copyright © 2016年 lilingjie. All rights reserved.
//

import UIKit

class MotionEventViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // 打开加速计硬件 开始接收加速计事件
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged(notification:)), name: Notification.Name.UIDeviceOrientationDidChange, object: nil)
        
        print("current device orientation is \(UIDevice.current.orientation.rawValue)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        // 不用的时候关闭通知
        UIDevice.current.endGeneratingDeviceOrientationNotifications()
        
        NotificationCenter.default.removeObserver(self, name: .UIDeviceOrientationDidChange, object: nil)
    }
    
    @objc fileprivate func orientationChanged(notification: Notification) {
        // 响应设备发生变化 
        
        print("device orientation changed \(UIDevice.current.orientation.rawValue)")
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
