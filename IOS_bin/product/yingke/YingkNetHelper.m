//
//  getNetHelper.m
//  IOS_bin
//
//  Created by binbin on 2018/12/23.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "YingkNetHelper.h"
#import "HttpTool.h"
#import "SXTResponse.h"

@implementation YingkNetHelper
//MARK:test
-(void) getYingKeNet{
    NSDictionary* par = @{@"offset":@1};
    [HttpTool getWithPath:API_HomePage params:par success:^(id json) {
        SXTResponse* res =  [SXTResponse objectWithKeyValues:json];
        NSLog(@"success===:%@",res.error_msg);
        //        SXTResponse MJReplacedKeyFromPropertyName121
    } failure:^(NSError *error) {
        NSLog(@"error===:%@",error);
    }];
}
- (void)getYingKeHomeDataWithPage:(NSInteger)page success:(SUCCESS)success fail:(FAILED)failed{
    NSMutableDictionary* par = [[NSMutableDictionary alloc] init];
//    [par setValue:page forKey:@"offset"];
    [par setObject:@(page) forKey:@"offset"];
    [HttpTool getWithPath:API_HomePage params:par success:^(id json) {
        SXTResponse* res =  [SXTResponse objectWithKeyValues:json];
        NSLog(@"success===:%@",res.error_msg);
        success(res);
    } failure:^(NSError *error) {
    failed(error);
        NSLog(@"error===:%@",error);
    }];
}
- (void)getYingKeNearData:(SUCCESS)success fail:(FAILED)failed{
    //    uid=85149891&latitude=40.090562&longitude=116.413353
    NSDictionary* par = @{@"uid":@85149891,@"latitude":@40.090562,@"longitude":@116.413353};

    [HttpTool getWithPath:API_NearBy params:par success:^(id json) {
        SXTResponse* resObj =  [SXTResponse objectWithKeyValues:json];
        NSLog(@"success===:%@",resObj.error_msg);
        success(resObj);
    } failure:^(NSError *error) {
        
    }];
}
- (void)getYingKeUserFeedData:(SUCCESS)success fail:(FAILED)failed{
//    NSDictionary* par = @{@"offset":@1};
    [HttpTool getWithPath:API_UserFeed params:nil success:^(id json) {
        SXTResponse* res =  [SXTResponse objectWithKeyValues:json];
        NSLog(@"success===:%@",res.error_msg);
        success(res);
    } failure:^(NSError *error) {
        
    }];
}
@end
