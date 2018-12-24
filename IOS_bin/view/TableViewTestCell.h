//
//  TableViewTestCell.h
//  IOS_bin
//
//  Created by binbin on 2018/12/10.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewTestCell : UITableViewCell
@property (nonatomic,weak)UIImageView* iconView;
@property (nonatomic, weak) UILabel *labName;
@property(nonatomic,weak)UILabel * labDescribe;
@end
