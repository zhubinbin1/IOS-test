//
//  SXTResponse.h
//  IOS_bin
//
//  Created by binbin on 2018/12/23.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SXTCards.h"

@interface SXTResponse : NSObject
@property(nonatomic,assign)NSUInteger dm_error;
@property(nonatomic,copy)NSString* error_msg;
@property(nonatomic,strong)NSArray<SXTCards*>* cards;
//+(NSMutableArray *)keyValuesArrayWithObjectArray:(NSArray *)objectArray ignoredKeys:(NSArray *)ignoredKeys;

@end
