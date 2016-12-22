//
//  ViewController.m
//  DeliverTouchEventsToViewOutsideTheParentView
//
//  Created by llj on 2016/12/20.
//  Copyright © 2016年 lilingjie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleClickMe:(UIButton *)sender {
    
    NSLog(@"click button");
}

- (void)test {
    if (YES) {NSLog(@"bad style code!");};
    
    [UIView animateWithDuration:1.0f animations:^{
        NSLog(@" ppppp ");
    } completion:nil];
    [self performSelector:@selector(test1) withObject:nil afterDelay:3];
}

- (void)test1 {
    NSLog(@"excute test1");
}

@end
