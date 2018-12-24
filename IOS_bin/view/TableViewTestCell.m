//
//  TableViewTestCell.m
//  IOS_bin
//
//  Created by binbin on 2018/12/10.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "TableViewTestCell.h"
@interface TableViewTestCell()

@end
@implementation TableViewTestCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        UIImage* img = [UIImage imageNamed:@"gift_number_0"];
//        UIImageView* headView = [[UIImageView alloc] initWithImage:img];
//        [self iconView];
//        [self labName];
        UIImageView* headView = [[UIImageView alloc] init];
        [self.contentView addSubview:headView];
        self.iconView = headView;
        
        UILabel* nameLabel = [[UILabel alloc] init];
        nameLabel.font = [UIFont systemFontOfSize:14];
        nameLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:nameLabel];
        self.labName = nameLabel;
        [self.contentView setBackgroundColor:[UIColor clearColor]];
        
        UILabel* describeLabel = [[UILabel alloc] init];
        describeLabel.font = [UIFont systemFontOfSize:10];
        describeLabel.textColor = [UIColor grayColor];
        self.labDescribe = describeLabel;
        [self.contentView addSubview:describeLabel];
        [self settingFrame];
        
    }
    return self;
}
//- (UIImageView *)iconView{
//        UIImageView* headView = [[UIImageView alloc] init];
//        [self.contentView addSubview:headView];
//         self.iconView = headView;
//
//    return headView;
//}
//- (UILabel *)labName{
//        UILabel* nameLabel = [[UILabel alloc] init];
//        nameLabel.font = [UIFont systemFontOfSize:14];
//        nameLabel.textColor = [UIColor grayColor];
//        [self.contentView addSubview:nameLabel];
//        self.labName = nameLabel;
//        [self.contentView setBackgroundColor:[UIColor clearColor]];
//
//    return nameLabel;
//}
//设置相对位置
- (void)settingFrame
{
    
    self.frame = CGRectMake(0, 0, screenW, screenH);
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(20);
    }];
    [self.labName mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.iconView);
         make.top.equalTo(self.contentView).offset(20);
        make.left.equalTo([self.iconView mas_right]).offset(20);
//        make.center.equalTo(self.iconView);
    }];
    [self.labDescribe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(50);
        make.left.equalTo([self.iconView mas_right]).offset(20);
    }];
////     self.frame = CGRectMake(0, 0, 320, 120);
//    self.labName.frame=CGRectMake(100, 120, 200, 50);
//    self.iconView.frame=CGRectMake(10, (120-80)/2, 80, 80);
}

@end


