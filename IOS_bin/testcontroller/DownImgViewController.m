//
//  DownImgViewController.m
//  IOS_bin
//
//  Created by binbin on 2018/12/9.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "DownImgViewController.h"
//#import <Masonry.h>

/**
 下载图片测试
 */
@interface DownImgViewController ()
@property(nonatomic,strong)UIImageView* imgV;
@end

@implementation DownImgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self imgV];
    [self downLoad3];
    [self initViewBarItem:@"下载图片测试" leftTitle:@"back" rightTitle:@""];
    // Do any additional setup after loading the view.
}
- (UIImageView *)imgV{
    if (!_imgV) {
        _imgV = [[UIImageView alloc ] initWithImage:[UIImage imageNamed:@"image/180.jpg"]];
        _imgV.backgroundColor =[UIColor redColor];
//        _imgV.contentMode=UIViewContentModeScaleAspectFill;
        _imgV.contentMode = UIViewContentModeScaleToFill;
        _imgV.clipsToBounds = YES;
        [self.view addSubview:_imgV];
        [_imgV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.width.equalTo(self.view.mas_width).multipliedBy(0.8);
//            make.height.equalTo(self.view.mas_height).multipliedBy(0.3);
        }];
    }
    return _imgV;
}
-(void)downLoad1{
    NSString* imgUrl = @"https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png";//@"https://www.baidu.com/img/bd_logo1.png";
    NSURL* url =  [NSURL URLWithString:imgUrl];
//    [self.imgV sd_setImageWithURL:[NSURL URLWithString:imgUrl]];
    [self.imgV sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"image/180.jpg"] options:(SDWebImageCacheMemoryOnly)];
}
-(void)downLoad2{
    NSString* imgUrl = @"https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png";
    NSURL* url =  [NSURL URLWithString:imgUrl];
    [self.imgV sd_setImageWithURL:(url) completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        switch (cacheType) {
            case SDImageCacheTypeNone:
                NSLog(@"直接下载");
                break;
            case SDImageCacheTypeDisk:
                NSLog(@"磁盘缓存");
                break;
            case SDImageCacheTypeMemory:
                NSLog(@"内存缓存");
                break;
            default:
                break;
        }
        // 存放目录
        NSLog(@"%@",[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]);
        NSLog(@"cacheType:%zd,%@",cacheType,imageURL);
    }];
}
//没有做任何缓存处理
-(void)downLoad3{
    NSString* imgUrl = @"https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png";
    NSURL* url =  [NSURL URLWithString:imgUrl];
    [[SDWebImageDownloader sharedDownloader]downloadImageWithURL:url options:(SDWebImageDownloaderProgressiveDownload) progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        NSLog(@"%f",1.0 * receivedSize / expectedSize);
    } completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
        // 得到图片
        self.imgV.image = image;
    }];
}

// 2.只需要简单获得一张图片,可不设置显示，内存缓存&磁盘缓存
-(void)downLoad4
{
//    [SDWebImageManager sharedManager]
//    [[SDWebImageManager sharedManager]
}

// 4.播放Gif图片
-(void)gif
{
    NSString* imgUrl = @"https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png";
    UIImage *image = [UIImage sd_animatedGIFWithData:[imgUrl dataUsingEncoding:NSUTF8StringEncoding] ];
    self.imgV.image = image;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
