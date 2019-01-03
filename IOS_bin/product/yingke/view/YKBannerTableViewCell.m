//
//  YKBannerTableViewCell.m
//  IOS_bin
//
//  Created by binbin on 2019/1/1.
//  Copyright © 2019年 binbin. All rights reserved.
//

#import "YKBannerTableViewCell.h"
#import "YKCards.h"
@interface YKBannerTableViewCell()
@property (nonatomic,strong)UIImageView* bannerImgV;
@end
@implementation YKBannerTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self reLayout];
    }
    return self;
}
-(void)reLayout{
    [self.bannerImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
}
-(void)setData:(YKCards *)card{
    [self.bannerImgV downloadImage:card.data.ticker[0].image placeholder:@"sm_gift_bag_empty"];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(UIImageView *)bannerImgV{
    if (!_bannerImgV) {
        _bannerImgV =[[UIImageView alloc] init];
        _bannerImgV.layer.masksToBounds = YES;
        _bannerImgV.layer.cornerRadius = 5;
        _bannerImgV.backgroundColor =[UIColor whiteColor];
        [self addSubview:_bannerImgV];
    }
    return _bannerImgV;
}

@end
