//
//  BINPlayViewController.h
//  IOS_bin
//
//  Created by binbin on 2018/12/23.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <IJKMediaFramework/IJKMediaFramework.h>
#import "SXTLiveInfo.h"
@interface BINPlayViewController : UIViewController
@property(nonatomic,strong)SXTLiveInfo* live;
- (instancetype)initWithLiveInfo:(SXTLiveInfo*) liveInfo;
@end
