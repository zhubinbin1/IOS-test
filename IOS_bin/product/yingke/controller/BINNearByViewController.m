//
//  BINNearByViewController.m
//  IOS_bin
//
//  Created by binbin on 2018/12/23.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "BINNearByViewController.h"
#import "YingkNetHelper.h"
#import "SXTResponse.h"
#import "YKNearByTableViewCell.h"
#import "YKBannerTableViewCell.h"
#import "BINPlayViewController.h"
#import "SXTCards.h"
static  NSString* const LIVE_TYPE = @"live";
static  NSString* const WEB_TYPE = @"web";
static  NSString* const PUBLIC_TYPE = @"public_live";
//typedef enum RedirectType{
//    SU,
//    DU
//}RedirectType;

@interface BINNearByViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) YingkNetHelper* netHelper;
@property(nonatomic,strong)NSArray<SXTCards*>* cards;
@end

@implementation BINNearByViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerClass];
    self.view.backgroundColor = [UIColor redColor];
    [self.netHelper getYingKeNearData:^(SXTResponse *respon) {
        self.cards =  [respon cards];
        [self.tableView reloadData];
        //                NSLog(@"==success==%@",self.cards[0].data.live_info.creator.nick);
    } fail:^(NSError *error) {
        NSLog(@"==error==");
    }];
}
-(void)registerClass{
    [self.tableView registerClass:[YKNearByTableViewCell class] forCellReuseIdentifier:NSStringFromClass([YKNearByTableViewCell class])];
    [self.tableView registerClass:[YKBannerTableViewCell class] forCellReuseIdentifier:NSStringFromClass([YKBannerTableViewCell class])];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cards.count;
}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    static NSString *cellIdentifier = @"Cell";
    YKLiveBaseTableViewCell* baseCell;
    Class baseCls =[self getTableCellByClass:indexPath];
    //    baseCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    baseCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(baseCls) forIndexPath:indexPath];
//    if (baseCell==nil) {
//        baseCell=[[baseCls alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(baseCls)];
//    }
    [baseCell setData:self.cards[indexPath.row]];
    return baseCell;
}
-(Class)getTableCellByClass:(NSIndexPath *)indexPath{
    Class baseCls;
    SXTCards* card = self.cards[indexPath.row];
    if ([card.data.redirect_type isEqualToString:LIVE_TYPE]) {
        baseCls = [YKNearByTableViewCell class] ;
    }else if([card.data.redirect_type isEqualToString:WEB_TYPE]){
        baseCls = [YKBannerTableViewCell class];
    }else if([card.data.redirect_type isEqualToString:PUBLIC_TYPE]){
        baseCls = [YKNearByTableViewCell class] ;
    }else{
        baseCls = [YKNearByTableViewCell class] ;
    }
    return baseCls;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return screenW-10;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:false];
    BINPlayViewController* playVc = [[BINPlayViewController alloc] init];
    [self.navigationController pushViewController:playVc animated:true];
}

-(YingkNetHelper *)netHelper{
    if (!_netHelper) {
        _netHelper = [[YingkNetHelper alloc]init];
    }
    return _netHelper;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
