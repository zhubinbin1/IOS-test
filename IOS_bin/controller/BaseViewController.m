//
//  BaseViewController.m
//  IOS_bin
//
//  Created by binbin on 2018/12/9.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "BaseViewController.h"


@interface BaseViewController ()

@end

@implementation BaseViewController
-(void)initViewBarItem:(NSString*)title leftTitle:(NSString*)leftTitle rightTitle:(NSString*)rightTitle{
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithTitle:leftTitle style:UIBarButtonItemStyleDone target:self action:@selector(leftBarClick:)];
    
    self.navigationItem.leftBarButtonItem = leftItem;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:rightTitle style:UIBarButtonItemStylePlain target:self action:@selector(rightBarClick:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    self.navigationItem.title = title;
    [self.navigationController setNavigationBarHidden:NO];
//        self.navigationBarHidden = true;
}
-(void)leftBarClick:(UIButton *)btn{
    //  [self popViewControllerAnimated:true];
    [self.navigationController popViewControllerAnimated:true];
    NSLog(@"leftItem click");
}
-(void)rightBarClick:(UIButton *)btn{
    NSLog(@"rightItem click");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIView* rootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH)];
    self.view = rootView;
    //    self.view.backgroundColor =[UIColor greenColor]; //[self randomColor];
//    NSLog(@"randomColor===:%@",[self randomColor]);
    self.view.backgroundColor = [self randomColor];
}
-(UIColor*)randomColor:(int)r andGreen:(int)g andBlue:(int)b andAlpha:(int)a{
    return  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a/255.0];
}
-(UIColor*)randomColor{
    int r = arc4random() % 255;
    int g = arc4random() % 255;
    int b = arc4random() % 255;
    CGFloat rr = r / 255.0;
    CGFloat rg = g / 255.0;
    CGFloat rb = b / 255.0;
    return  [[UIColor alloc]initWithRed:rr green:rg blue:rb alpha:1];
    //    CGFloat r1 = arc4random_uniform(255);
    //    CGFloat g1 = arc4random_uniform(255);
    //    CGFloat b1 = arc4random_uniform(255);
    //    CGFloat a1 = arc4random_uniform(255);
    //    NSLog(@"=======color:%d,%d,%d,%d",r1,g1,b1,a1);
    //    return [self randomColor:(CGFloat)arc4random_uniform(255) andGreen:(CGFloat)arc4random_uniform(255) andBlue:(CGFloat)arc4random_uniform(255) andAlpha:(CGFloat)arc4random_uniform(256)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad1 {
    [super viewDidLoad];
    
    [[self view]setFrame:CGRectMake(0, 0, screenW, screenH)];
    self.view.backgroundColor =[UIColor grayColor];
    
    
    
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
