//
//  YKLiveBaseTableViewCell.h
//  IOS_bin
//
//  Created by binbin on 2019/1/1.
//  Copyright © 2019年 binbin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SXTCards;
@interface YKLiveBaseTableViewCell : UITableViewCell
@property (nonatomic,strong)SXTCards* card;
-(void) setData:(SXTCards*) card;
@end
