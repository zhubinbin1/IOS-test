//
//  MasonryTestViewController.m
//  IOS_bin
//
//  Created by binbin on 2018/12/9.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "MasonryTestViewController.h"
#import "NetTestViewController.h"

@interface MasonryTestViewController ()
@end

@implementation MasonryTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"MasonryTestViewController===viewDidLoad");
    self.view.backgroundColor = [UIColor whiteColor];
    [self initViewBarItem:@"自动布局测试" leftTitle:@"返回" rightTitle:@"跳转网络界面"];
    [self navigationController].navigationBarHidden = false;
    
}

-(void)leftBarClick:(UIButton *)btn{
    [super leftBarClick:btn];
}
-(void)rightBarClick:(UIButton *)btn{
//    [super rightBarClick:btn];
    NSLog(@"MasonryTestViewController rightBarClick");
    NetTestViewController* netTestVc = [[NetTestViewController alloc ]init];
    [self.navigationController pushViewController:netTestVc animated:true];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
