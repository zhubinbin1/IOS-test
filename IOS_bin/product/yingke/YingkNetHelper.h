//
//  getNetHelper.h
//  IOS_bin
//
//  Created by binbin on 2018/12/23.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YKResponse;
typedef void((^SUCCESS)(YKResponse* respon));
typedef void((^FAILED)(NSError* error));
@interface YingkNetHelper : NSObject
-(void) getYingKeHomeDataWithPage:(NSInteger) page success:(SUCCESS)success fail:(FAILED)failed;
-(void) getYingKeNearData:(SUCCESS)success fail:(FAILED)failed;
-(void) getYingKeUserFeedData:(SUCCESS)success fail:(FAILED)failed;
@end
