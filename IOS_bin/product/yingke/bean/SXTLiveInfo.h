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
@property (nonatomic, assign) NSNumber *end_time;
@property (nonatomic, assign) NSNumber *group;
@property (nonatomic, assign) NSNumber *ID;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, assign) NSNumber *landscape;
@property (nonatomic, assign) NSNumber *link;
@property (nonatomic, copy) NSString *live_type;
@property (nonatomic, assign) NSNumber *multi;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSNumber *online_users;
@property (nonatomic, assign) NSNumber *optimal;
@property (nonatomic, copy) NSString *other_addr;
@property (nonatomic, assign) NSNumber *pub_stat;
@property (nonatomic, assign) NSNumber *room_id;
@property (nonatomic, assign) NSNumber *rotate;
@property (nonatomic, copy) NSString *share_addr;
@property (nonatomic, assign) NSNumber *slot;
@property (nonatomic, assign) NSNumber *start_time;
@property (nonatomic, assign) NSNumber *status;
@property (nonatomic, strong) NSString *stream_addr;
@property (nonatomic, copy) NSString *sub_live_type;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, assign) NSNumber *version;


@end
