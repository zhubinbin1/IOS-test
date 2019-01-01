//
//  BINLiveViewController.m
//  IOS_bin
//
//  Created by binbin on 2018/12/23.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "BINLiveViewController.h"
#import "YingkNetHelper.h"
#import "SXTResponse.h"

@interface BINLiveViewController ()
@property(nonatomic,strong) YingkNetHelper* netHelper;

@end

@implementation BINLiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    [self.netHelper getYingKeHomeDataWithPage:0 success:^(SXTResponse *respon) {
        NSArray<SXTCards*>* cards =  [respon cards];
        NSLog(@"==success==%@",cards);
    } fail:^(NSError *error) {
        NSLog(@"==error==");
    }];
    
}
-(YingkNetHelper *)netHelper{
    if (!_netHelper) {
        _netHelper = [[YingkNetHelper alloc]init];
    }
    return _netHelper;
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
