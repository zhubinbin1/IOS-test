//
//  YKBannerTableViewCell.m
//  IOS_bin
//
//  Created by binbin on 2019/1/1.
//  Copyright © 2019年 binbin. All rights reserved.
//

#import "YKBannerTableViewCell.h"
#import "SXTCards.h"
@interface YKBannerTableViewCell()
@property (nonatomic,strong)UIImageView* bannerImgV;
@end
@implementation YKBannerTableViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}
-(void)setData:(SXTCards *)card{
//    card.data.live_info.
//    NSArray<YKTicker*>* array = card.data.ticker;
//    [self.bannerImgV downloadImage:card.data.ticker[0].image placeholder:nil];
//    NSLog(@"zhubin==YKBannerTableViewCell==%@",array);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(UIImageView *)bannerImgV{
    if (!_bannerImgV) {
        _bannerImgV =[[UIImageView alloc] init];
        _bannerImgV.layer.masksToBounds = YES;
        _bannerImgV.layer.maskedCorners = 3;
        _bannerImgV.backgroundColor =[UIColor blackColor];
        [self addSubview:_bannerImgV];
    }
    return _bannerImgV;
}

@end
