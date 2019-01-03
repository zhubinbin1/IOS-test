//
//  YKLiveCollectionViewCell.h
//  IOS_bin
//
//  Created by binbin on 2019/1/2.
//  Copyright © 2019年 binbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YKCards.h"
  
@interface YKLiveCollectionViewCell : UICollectionViewCell
-(void)setData:(YKCards*)card;
@end
