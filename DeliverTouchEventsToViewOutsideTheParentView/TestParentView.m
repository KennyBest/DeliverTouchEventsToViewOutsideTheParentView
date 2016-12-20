//
//  TestParentView.m
//  DeliverTouchEventsToViewOutsideTheParentView
//
//  Created by llj on 2016/12/20.
//  Copyright © 2016年 lilingjie. All rights reserved.
//

#import "TestParentView.h"

@implementation TestParentView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


/**
 目的：超出自身bounds的子视图可以接受时间
 
 */

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {

    // 1. 在target视图坐标系统内换算坐标
    
    CGPoint pointForTargetView = [self.targetView convertPoint:point fromView:self];
    
    // 2. 接收事件的点在targetView内
    
    if (CGRectContainsPoint(self.targetView.bounds, pointForTargetView)) {
        
        // 3. 在TargetView内进行事件分发
        return [self.targetView hitTest:pointForTargetView withEvent:event];
    }
    
    return [super hitTest:point withEvent:event];
}

/**
 UIApplication的属性 用来关闭事件接收
 beginIgnoringInteractionEvents
 endIgnoringInteractionEvents
 
 */

@end
