//
//  ViewController.m
//  IOS_bin
//
//  Created by binbin on 2018/12/4.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "ViewController.h"
#import "ZBProgress.h"
#import "MasonryTestViewController.h"
//#import "time.h"


@interface ViewController ()
@property(nonatomic,strong) MBProgressHUD* mProgress;
@property(nonatomic,strong) UIButton* mJumpBtn;
@end

@implementation ViewController
/**
 跳转到masonry测试界面
 */
-(UIButton*)mJumpBtn{
    if (!_mJumpBtn) {
        _mJumpBtn = [[UIButton alloc] initWithFrame:CGRectMake(40, 50, 300, 100)];
        _mJumpBtn.titleLabel.text = @"111";
        _mJumpBtn.backgroundColor = [UIColor blueColor];
        _mJumpBtn.titleLabel.textColor=[UIColor blackColor];
        [_mJumpBtn setTitle:@"跳转到Msonry" forState:UIControlStateNormal];
        [_mJumpBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_mJumpBtn addTarget:self action:@selector(jumpMasonry:) forControlEvents:UIControlEventTouchUpInside];
         [self.view addSubview:_mJumpBtn];
    }
    return _mJumpBtn;
 }
-(void)jumpMasonry:(UIButton*) btn{
    NSLog(@"jumpMasonry===");
    MasonryTestViewController* masonryTestController = [[MasonryTestViewController alloc] init];
    [[self navigationController] pushViewController:masonryTestController animated:true];

}

-(void)setMProgress:(MBProgressHUD *)mProgress{
    if (!_mProgress) {
        UILabel* label =[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 50, 30)];
        _mProgress = [[MBProgressHUD alloc] initWithView:label];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[self view]setFrame:CGRectMake(0, 0, screenW, screenH)];
    self.view.backgroundColor =[UIColor grayColor];
    [self mJumpBtn];
   
   
}
-(void)test1 {
    UILabel* labe = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    labe.backgroundColor = [UIColor blueColor];
    labe.text = @"asdfadsfasdfasd";
    UILabel* view =[[UILabel alloc]initWithFrame:CGRectMake(50, 50, 350,80)];
    view.text = @"你好";
    [self.view addSubview:view];
    [MBProgressHUD showHUDAddedTo:view animated:true];
    //    [self showProgress];
    dispatch_time_t time_t =dispatch_time(DISPATCH_TIME_NOW, 1*NSEC_PER_SEC);
    //    dispatch_after(time_t, dispatch_get_main_queue(), ^{
    //         __weak typeof(self)weakSelf = self;
    //展示progres
    
    //    });
    //  [self.view addSubview:labe];
}
-(void) showProgress{
    UILabel* view =[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 50, 30)];
    view.text = @"你好";
    [self.view addSubview:view];
    NSString* text = @"dsfsdfsd";
    [ZBProgress showProgress:view];
}
    - (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
    }


@end
