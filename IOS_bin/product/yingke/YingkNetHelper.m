//
//  getNetHelper.m
//  IOS_bin
//
//  Created by binbin on 2018/12/23.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "YingkNetHelper.h"
#import "HttpTool.h"
#import "YKResponse.h"

@implementation YingkNetHelper
//MARK:test
-(void) getYingKeNet{
    NSDictionary* par = @{@"offset":@1};
    [HttpTool getWithPath:API_HomePage params:par success:^(id json) {
        YKResponse* res =  [YKResponse objectWithKeyValues:json];
        NSLog(@"success===:%@",res.error_msg);
        //        SXTResponse MJReplacedKeyFromPropertyName121
    } failure:^(NSError *error) {
        NSLog(@"error===:%@",error);
    }];
}
- (void)getYingKeHomeDataWithPage:(NSInteger)page success:(SUCCESS)success fail:(FAILED)failed{
    NSMutableDictionary* par = [[NSMutableDictionary alloc] init];
//    [par setValue:page forKey:@"offset"];/channel_id=
    [par setObject:@(page) forKey:@"offset"];
    [HttpTool getWithPath:API_HomePage params:par success:^(id json) {
        YKResponse* res =  [YKResponse objectWithKeyValues:json];
        NSLog(@"success===:%@",res.error_msg);
        success(res);
    } failure:^(NSError *error) {
    failed(error);
        NSLog(@"error===:%@",error);
    }];
}
- (void)getYingKeNearData:(SUCCESS)success fail:(FAILED)failed{
    //    uid=85149891&latitude=40.090562&longitude=116.413353
    //tab_key=00220180702YH5JW
    NSDictionary* par = @{@"uid":@700783691,@"latitude":@40.090562,@"longitude":@116.413353,@"channel_id":@2,@"tab_key":@"00220180702YH5JW"};
    [HttpTool getWithPath:API_NearBy params:par success:^(id json) {
        YKResponse* resObj =  [YKResponse objectWithKeyValues:json];
        NSLog(@"success===:%@",resObj.error_msg);
        success(resObj);
    } failure:^(NSError *error) {
        
    }];
}
- (void)getYingKeUserFeedData:(SUCCESS)success fail:(FAILED)failed{
//    NSDictionary* par = @{@"offset":@1};
    [HttpTool getWithPath:API_UserFeed params:nil success:^(id json) {
        YKResponse* res =  [YKResponse objectWithKeyValues:json];
        NSLog(@"success===:%@",res.error_msg);
        success(res);
    } failure:^(NSError *error) {
        
    }];
}
//uid=700783691
//https://service.inke.cn/api/live/card_recommend?cc=TG36062&lc=359e81d9a6b19869&cpu=%5BAdreno_%28TM%29_510%5D%5BAArch64_638_Qualcomm_Technologies%2C_Inc_MSM8976%5D&devi=861468034245560&sid=20TWhLMLlH2XobVc99STClPSwJfhwXvDFyMK86YMVAIAFjwKGhTJ8i3&osversion=android_22&ndid=&imei=861468034245552&conn=wifi&ram=3752394752&icc=898600c00115f0005232&ast=1&imsi=460022010056520&mtid=6ad0f8172b75b8f4ce37249c1166610f&mtxid=ac74093f4420&cv=IK7.0.01_Android&proto=8&ua=vivovivoX7Plus&logid=273%2C281%2C282%2C213%2C236%2C246%2C10002%2C10203%2C30001&uid=700783691&vv=1.0.3-201610121413.android&aid=f767639ce568c242&smid=Due%2F%2BU6uEewS9d5OXPzXqnLdxdfnbjqLKTX2xhKYiYv8tpaE10nXeejXvxEvrujJxMdT16LhSjcViaVVKIwAJR5w&card_pos=0&req_type=1&longitude=116.4208575&offset=0&live_uid=0&refurbish_mode=0&crv=2.0&gender=1&is_cut=0&slide_pos=0&user_level=3&interest=0&location=CN%2C%E5%8C%97%E4%BA%AC%E5%B8%82%2C%E5%8C%97%E4%BA%AC%E5%B8%82&latitude=39.8996539&session_id=1546508962689&stay_time=0&r_c=568822472&s_sg=vv4e21a89358163e0136317ff557e54e41&s_sc=101&s_st=1546508439
//
//https://service.inke.cn/api/live/card_recommend?cc=TG36062&lc=359e81d9a6b19869&cpu=%5BAdreno_%28TM%29_510%5D%5BAArch64_638_Qualcomm_Technologies%2C_Inc_MSM8976%5D&devi=861468034245560&sid=20TWhLMLlH2XobVc99STClPSwJfhwXvDFyMK86YMVAIAFjwKGhTJ8i3&osversion=android_22&ndid=&imei=861468034245552&conn=wifi&ram=3752394752&icc=898600c00115f0005232&ast=1&imsi=460022010056520&mtid=6ad0f8172b75b8f4ce37249c1166610f&mtxid=ac74093f4420&cv=IK7.0.01_Android&proto=8&ua=vivovivoX7Plus&logid=273%2C281%2C282%2C213%2C236%2C246%2C10002%2C10203%2C30001&uid=700783691&vv=1.0.3-201610121413.android&aid=f767639ce568c242&smid=Due%2F%2BU6uEewS9d5OXPzXqnLdxdfnbjqLKTX2xhKYiYv8tpaE10nXeejXvxEvrujJxMdT16LhSjcViaVVKIwAJR5w&card_pos=0&req_type=0&longitude=116.4208583&offset=0&live_uid=0&refurbish_mode=0&filter_card=0&crv=2.0&gender=1&tab_name=%E5%8C%97%E4%BA%AC&slide_pos=0&user_level=3&tab_key=00220180702YH5JW&interest=0&location=CN%2C%E5%8C%97%E4%BA%AC%E5%B8%82%2C%E5%8C%97%E4%BA%AC%E5%B8%82&latitude=39.8996544&session_id=1546508883567&channel_id=2&stay_time=0&r_c=1159762317&s_sg=vv4d13130261df7c50780e46fe9f31cdc2&s_sc=101&s_st=1546508439


@end
