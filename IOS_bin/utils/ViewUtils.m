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
// [_oneImg setImage:[ViewUtils getLocalImgByBundle:@"image/180" type:@"jpg"] ];
+(UIImage *)getLocalImgByBundle:(NSString *)name type:(NSString *)type{
    
    NSString* filePath =[[NSBundle mainBundle] pathForResource:name ofType:type];
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    UIImage* image = [UIImage imageWithData:data];
    return image;
    
}
@end
