//
//  ShakeMotionViewController.swift
//  DeliverTouchEventsToViewOutsideTheParentView
//
//  Created by lining on 2016/12/27.
//  Copyright © 2016年 lilingjie. All rights reserved.
//

import UIKit

class ShakeMotionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - 事件状态
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            // TODO - 接收到摇晃后逻辑处理
            let alert = UIAlertController(title: "Tip", message: "you shake the device!", preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            
            self.navigationController?.present(alert, animated: true, completion: nil)
        }
    }
    
    // 摇晃时间过长的话就会被取消
    override func motionCancelled(_ motion: UIEventSubtype, with event: UIEvent?) {
        print("shake motion cancel")
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
