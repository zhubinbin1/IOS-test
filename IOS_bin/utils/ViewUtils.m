//
//  ViewUtils.m
//  IOS_bin
//
//  Created by binbin on 2018/12/5.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "ViewUtils.h"

@implementation ViewUtils
+(int)getScreenW{
  int scW = [UIScreen mainScreen].bounds.size.width;
    return scW;
}
@end
