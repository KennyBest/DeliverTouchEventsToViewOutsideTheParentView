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

@end
