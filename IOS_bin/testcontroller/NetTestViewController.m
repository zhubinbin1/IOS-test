//
//  NetTestViewController.m
//  IOS_bin
//
//  Created by binbin on 2018/12/9.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "NetTestViewController.h"

@interface NetTestViewController ()

@end

@implementation NetTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViewBarItem:@"网络测试" leftTitle:@"返回" rightTitle:@""];
    NSLog(@"NetTestViewController - viewDidLoad");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
