//
//  BaseViewController.h
//  IOS_bin
//
//  Created by binbin on 2018/12/9.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
-(UIColor*)randomColor;
-(void)initViewBarItem:(NSString*)title leftTitle:(NSString*)leftTitle rightTitle:(NSString*)rightTitle;
-(void)leftBarClick:(UIButton *)btn;
-(void)rightBarClick:(UIButton *)btn;
@end
