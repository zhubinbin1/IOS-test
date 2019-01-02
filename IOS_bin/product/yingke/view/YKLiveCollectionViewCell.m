//
//  YKLiveCollectionViewCell.m
//  IOS_bin
//
//  Created by binbin on 2019/1/2.
//  Copyright © 2019年 binbin. All rights reserved.
//

#import "YKLiveCollectionViewCell.h"
@interface YKLiveCollectionViewCell()
@property(nonatomic,strong)SXTCards* mCard;
@property(nonatomic,strong)UILabel* cityLabel;
@property(nonatomic,strong)UILabel* nickNameLabel;
@property(nonatomic,strong)UILabel* numberTabLabel;
@property(nonatomic,strong)UILabel* renQiLabel;
@property(nonatomic,strong)UIImageView* coverImg;
@end
@implementation YKLiveCollectionViewCell
-(void)setData:(SXTCards*)card{
    self.mCard = card;
    [self.coverImg downloadImage:card.data.live_info.creator.portrait placeholder:@"gift_icon_vote"];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self reLayout];
    }
    return self;
}

-(void)reLayout{
    [self.coverImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(5, 10, 5, 10));
    }];
    [self.numberTabLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverImg).offset(5);
        make.left.equalTo(self.coverImg).offset(5);
        //        make.width.equalTo(self.coverImg);
        //        make.size.mas_equalTo(CGSizeMake(80, 20));
    }];
    [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.coverImg).offset(5);
        make.bottom.equalTo(self.coverImg.mas_bottom).offset(-5);
    }];
    [self.renQiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.coverImg).offset(-5);
        make.bottom.equalTo(self.coverImg).offset(-5);
    }];
    [self.cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@[self.nickNameLabel]);
        make.bottom.equalTo(self.nickNameLabel.mas_top).offset(-5);
    }];
}
-(UIImageView *)coverImg{
    if (!_coverImg) {
        _coverImg = [[UIImageView alloc]init];
        _coverImg.layer.cornerRadius = 10;
        _coverImg.layer.masksToBounds = YES;
//        _coverImg.backgroundColor = [UIColor yellowColor];
        [self addSubview:_coverImg];
    }
    return _coverImg;
}
-(UILabel *)cityLabel{
    if (!_cityLabel) {
        _cityLabel = [[UILabel alloc] init];
        _cityLabel.backgroundColor = [UIColor clearColor];
        _cityLabel.font = [UIFont systemFontOfSize:14];
        [_cityLabel sizeToFit];
        _cityLabel.textColor= [UIColor whiteColor];
        [self addSubview:_cityLabel];
    }
    return _cityLabel;
}
-(UILabel *)nickNameLabel{
    if (!_nickNameLabel) {
        _nickNameLabel = [[UILabel alloc] init];
        _nickNameLabel.backgroundColor = [UIColor clearColor];
        _nickNameLabel.font = [UIFont systemFontOfSize:14];
        _nickNameLabel.textColor= [UIColor whiteColor];
        [self addSubview:_nickNameLabel];
    }
    return _nickNameLabel;
}
-(UILabel *)numberTabLabel{
    if (!_numberTabLabel) {
        _numberTabLabel = [[UILabel alloc] init];
        _numberTabLabel.backgroundColor = [UIColor lightGrayColor];
        _numberTabLabel.font = [UIFont systemFontOfSize:12];
        _numberTabLabel.textColor= [UIColor whiteColor];
        [_numberTabLabel sizeToFit];
        _numberTabLabel.textAlignment =NSTextAlignmentCenter;
        [self addSubview:_numberTabLabel];
    }
    return _numberTabLabel;
}
-(UILabel *)renQiLabel{
    if (!_renQiLabel) {
        _renQiLabel = [[UILabel alloc] init];
        _renQiLabel.backgroundColor = [UIColor clearColor];
        _renQiLabel.font = [UIFont systemFontOfSize:16];
        _renQiLabel.textColor= [UIColor whiteColor];
        [self addSubview:_renQiLabel];
    }
    return _renQiLabel;
}

@end
