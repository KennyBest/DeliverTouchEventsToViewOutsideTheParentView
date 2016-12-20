//
//  TestParentView.h
//  DeliverTouchEventsToViewOutsideTheParentView
//
//  Created by llj on 2016/12/20.
//  Copyright © 2016年 lilingjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestParentView : UIView

@property (weak, nonatomic) IBOutlet UIView *targetView;

@end
