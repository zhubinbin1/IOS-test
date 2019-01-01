//
//  SXTResponse.m
//  IOS_bin
//
//  Created by binbin on 2018/12/23.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "SXTResponse.h"

@implementation SXTResponse
//self MJReplacedKeyFromPropertyName121
+(NSDictionary *)objectClassInArray{
    return @{@"cards":[SXTCards class]};
}

@end
