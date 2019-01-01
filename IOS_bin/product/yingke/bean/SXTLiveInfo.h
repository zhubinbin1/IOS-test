//
//  SXTLiveInfo.h
//  IOS_bin
//
//  Created by binbin on 2018/12/23.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SXTCreator.h"

@interface SXTLiveInfo : NSObject
@property(nonatomic,strong)NSString* city;
@property(nonatomic,strong)SXTCreator* creator;
@property (nonatomic, assign) NSInteger *end_time;
@property (nonatomic, copy) NSNumber *group;
@property (nonatomic, copy) NSNumber *ID;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSNumber *landscape;
@property (nonatomic, copy) NSNumber *link;
@property (nonatomic, copy) NSString *live_type;
@property (nonatomic, copy) NSNumber *multi;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSNumber *online_users;
@property (nonatomic, copy) NSNumber *optimal;
@property (nonatomic, copy) NSString *other_addr;
@property (nonatomic, copy) NSNumber *pub_stat;
@property (nonatomic, copy) NSNumber *room_id;
@property (nonatomic, copy) NSNumber *rotate;
@property (nonatomic, copy) NSString *share_addr;
@property (nonatomic, copy) NSNumber *slot;
@property (nonatomic, copy) NSNumber *start_time;
@property (nonatomic, copy) NSNumber *status;
@property (nonatomic, strong) NSString *stream_addr;
@property (nonatomic, copy) NSString *sub_live_type;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSNumber *version;

@end
