//
//  MasonryTestViewController.m
//  IOS_bin
//
//  Created by binbin on 2018/12/9.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "MasonryTestViewController.h"
#import "NetTestViewController.h"
#import "ViewUtils.h"

@interface MasonryTestViewController ()
@property(nonatomic,strong)UIImageView* oneImg;
@property(nonatomic,strong)UIImageView* twoImg;
@property(nonatomic,strong)UIImageView* threeImg;
@property(nonatomic,strong)UIView* subView;
@end
/**
 自动布局测试
 */
@implementation MasonryTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"MasonryTestViewController===viewDidLoad");
    //    self.view.backgroundColor = [UIColor whiteColor];
    //self.view.backgroundColor = [UIColor yellowColor];
    [self initViewBarItem:@"自动布局测试" leftTitle:@"返回" rightTitle:@"跳转网络界面"];
    [self oneImg];
    [self twoImg];
    [self threeImg];
    [self subView];
    [self navigationController].navigationBarHidden = false;
    
}

-(UIImageView *)oneImg{
    if (!_oneImg) {
        //        _oneImg = [[UIImageView alloc]initWithFrame:CGRectMake(80, 120, 40, 40)];
        _oneImg = [[UIImageView alloc] initWithImage:[self getImgWithName:@"gift_number_0"]];
        //        [_oneImg setImage:[ViewUtils getLocalImgByBundle:@"image/180" type:@"jpg"] ];
        //        [_oneImg setImage:[self getImgWithName:@"gift_number_0"]];
        _oneImg.backgroundColor = [UIColor redColor];
        _oneImg.contentMode = UIViewContentModeCenter;
        _oneImg.transform =CGAffineTransformMakeScale(0.9, 0.9);
        [self.view addSubview:_oneImg];
        [_oneImg mas_updateConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(100, 100));
            make.top.equalTo(self.view).offset(100);
            //            make.left.equalTo(self.view).offset(100);
            make.right.equalTo(self.view).offset(-10);
            //            make.center.equalTo(self.view);
            //            make.width.equalTo(self.view.mas_width).priorityLow();
            //            make.height.equalTo(self.view.mas_height).priorityHigh();
        }];
        
    }
    return _oneImg;
}

-(UIImageView *)twoImg{
    if (!_twoImg) {
        _twoImg = [[UIImageView alloc] initWithImage:[self getImgWithName:@"gift_number_1"]];
        _twoImg.backgroundColor = [UIColor greenColor];
        [self.view addSubview:_twoImg];
        _twoImg.userInteractionEnabled = YES;
        [_twoImg mas_makeConstraints:^(MASConstraintMaker *make) {
            __weak typeof (self) weakSelf = self;
            make.size.mas_equalTo(CGSizeMake(100, 100));
            //        make.size.equalTo(CGSizeMake(200, 200));
            make.top.equalTo([weakSelf oneImg]).offset(10);
            make.right.equalTo([[weakSelf oneImg] mas_left]).offset(-20);
            //        make.right.lessThanOrEqualTo([[weakSelf oneImg] mas_left]).offset(-20).priorityLow();
        }];
    }
    
    
    return _twoImg;
}

-(UIImageView *)threeImg{
    if(!_threeImg){
        _threeImg = [[UIImageView alloc] initWithImage:[self getImgWithName:@"gift_number_2"]];
        _threeImg.backgroundColor = [UIColor darkGrayColor];
        [self.view addSubview:_threeImg];
        [_threeImg mas_makeConstraints:^(MASConstraintMaker *make) {
//            __weak typeof (self) weakSelf = self;
            //        make.size.equalTo(weakSelf.view);
//             make.height.equalTo(@160);
            //MARK 没法用
//                        make.topMargin.equalTo(weakSelf.view.mas_top).with.offset(50);
//                        make.leftMargin.equalTo(weakSelf.view.mas_left).with.offset(50);
//                        make.bottomMargin.equalTo(weakSelf.view.mas_bottom).with.offset(-50);
//                        make.rightMargin.equalTo(weakSelf.view.mas_right).with.offset(-50);
            
            //        make.left.equalTo([self view]).offset(10);
            //         make.top.equalTo([self view]).offset(100);
            //         make.right.equalTo([self view]).offset(-10);
            //         make.bottom.equalTo([self view]).offset(-10);
            make.edges.equalTo([self oneImg]).insets(UIEdgeInsetsMake(10,10,0,0));//距离内边距
            
//            make.center.equalTo(self.view);//中心
//                    make.size.equalTo(self.view).sizeOffset(CGSizeMake(-300, -300));
            
            //        make.center.equalTo([self oneImg]);
            //                make.centerX.equalTo(weakSelf.view.mas_centerX);
            //        make.center.equalTo(self.view);
            //        make.top.equalTo([weakSelf view]).offset(100);
//                    make.left.top.equalTo(self.view).offset(120);
            //        make.right.equalTo([[self oneImg] mas_left]).offset(-200);
        }];
        
       
        
    };
    return _threeImg;
}
- (UIView *)subView{
    if (!_subView) {
        _subView = [[UIView alloc] init];
        _subView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_subView];
        
        [_subView mas_makeConstraints:^(MASConstraintMaker *make) {
//            __weak typeof(self)weakSelf = self;
//            make.topMargin.equalTo(weakSelf.view.mas_top).with.offset(50);
//            make.leftMargin.equalTo(weakSelf.view.mas_left).with.offset(50);
//            make.bottomMargin.equalTo(weakSelf.view.mas_bottom).with.offset(-50);
//            make.rightMargin.equalTo(weakSelf.view.mas_right).with.offset(-50);
        }];
    }
    
    return _subView;
}
-(UIImage*)getImgWithName:(NSString*)imgName{
    UIImage* img = [UIImage imageNamed:imgName];
    return img;
}
-(void)rightBarClick:(UIButton *)btn{
    //    [super rightBarClick:btn];
    NSLog(@"MasonryTestViewController rightBarClick");
    NetTestViewController* netTestVc = [[NetTestViewController alloc ]init];
    [self.navigationController pushViewController:netTestVc animated:true];
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
