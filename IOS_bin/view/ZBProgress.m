//
//  ZBProgress.m
//  IOS_bin
//
//  Created by binbin on 2018/12/7.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "ZBProgress.h"

@implementation ZBProgress
{

}
+(void)showProgress:(UIView*)pView{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:pView animated:YES];
//    [[MBProgressHUD alloc]initWithView:pView];
    hud.mode = MBProgressHUDModeText;
    hud.bezelView.color = [UIColor greenColor];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.detailsLabel.text = @"text";
    hud.detailsLabel.textColor = [UIColor whiteColor];
    hud.detailsLabel.font =[UIFont fontWithName:@"courer-Bold" size:[UIFont labelFontSize]];
    hud.margin = 10.f;
    hud.removeFromSuperViewOnHide = YES;
    hud.userInteractionEnabled = true;
    //    [hud hideAnimated:YES
    //           afterDelay:1000];
    //[weakSelf.mProgress showAnimated:true];
}
@end
