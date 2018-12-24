//
//  RootViewController.m
//  IOS_bin
//
//  Created by binbin on 2018/12/9.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "RootViewController.h"
#import "MasonryTestViewController.h"
#import "TableViewTestViewController.h"

@interface RootViewController ()
@property(nonatomic,copy)UILabel* labTips;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViewBarItem:@"root Vc" leftTitle:@"" rightTitle:@"测试列表"];
    [self tips];
    //self.view.backgroundColor =[UIColor grayColor];
}

- (UILabel *)tips{
    if (!_labTips) {
        _labTips = [[UILabel alloc] init];
        _labTips.text = @"根目录";
        _labTips.textColor =[UIColor whiteColor];
        _labTips.font = [UIFont systemFontOfSize:30];
        [self.view addSubview:_labTips];
        [_labTips mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
        }];
    }
    return _labTips;
}
-(void)rightBarClick:(UIButton *)btn{
//    MasonryTestViewController* masonryVc = [[MasonryTestViewController alloc]init];
//    [self.navigationController pushViewController:masonryVc animated:true];
    TableViewTestViewController* tableVc = [[TableViewTestViewController alloc]init];
    [self.navigationController pushViewController:tableVc animated:true];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
