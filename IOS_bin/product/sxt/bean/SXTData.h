//
//  SXTData.h
//  IOS_bin
//
//  Created by binbin on 2018/12/23.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SXTLiveInfo.h"

@interface SXTData : NSObject
@property(nonatomic,strong)SXTLiveInfo* live_info;
@property(nonatomic,assign)NSInteger pos;
@property(nonatomic,copy)NSString* redirect_type;
@end
