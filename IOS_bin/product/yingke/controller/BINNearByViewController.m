//
//  BINNearByViewController.m
//  IOS_bin
//
//  Created by binbin on 2018/12/23.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "BINNearByViewController.h"
#import "YingkNetHelper.h"
#import "YKResponse.h"
#import "YKNearByTableViewCell.h"
#import "YKBannerTableViewCell.h"
#import "BINPlayViewController.h"
#import "YKCards.h"
static  NSString* const LIVE_TYPE = @"live";
static  NSString* const WEB_TYPE = @"web";
static  NSString* const PUBLIC_TYPE = @"public_live";
//typedef enum RedirectType{
//    SU,
//    DU
//}RedirectType;

@interface BINNearByViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) YingkNetHelper* netHelper;
@property(nonatomic,strong)NSArray<YKCards*>* cards;
@end

@implementation BINNearByViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerClass];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.netHelper getYingKeNearData:^(YKResponse *respon) {
        self.cards =  [respon cards];
        [self.tableView reloadData];
        //NSLog(@"==success==%@",self.cards[0].data.live_info.creator.nick);
    } fail:^(NSError *error) {
        NSLog(@"==error==");
    }];
}

-(void)registerClass{
    //    NSLog(@"zhubin==[YKBannerTableViewCell class]  %@",[YKBannerTableViewCell class]);
    [self.tableView registerClass:[YKNearByTableViewCell class] forCellReuseIdentifier:NSStringFromClass([YKNearByTableViewCell class])];
    [self.tableView registerClass:[YKBannerTableViewCell class] forCellReuseIdentifier:NSStringFromClass([YKBannerTableViewCell class])];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cards.count;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 0;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 0;
//}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YKLiveBaseTableViewCell* baseCell;
    Class baseCls =[self getTableCellByClass:indexPath];
    baseCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(baseCls) forIndexPath:indexPath];
    
    [baseCell setData:self.cards[indexPath.row]];
    return baseCell;
}
-(Class)getTableCellByClass:(NSIndexPath *)indexPath{
    Class baseCls;
    YKCards* card = self.cards[indexPath.row];
    if ([card.data.redirect_type isEqualToString:LIVE_TYPE]) {
        baseCls = [YKNearByTableViewCell class] ;
    }else if([card.data.redirect_type isEqualToString:WEB_TYPE]){
        baseCls = [YKBannerTableViewCell class];//YKBannerTableViewCell
    }else if([card.data.redirect_type isEqualToString:PUBLIC_TYPE]){
        baseCls = [YKNearByTableViewCell class] ;
    }else{
        baseCls = [YKNearByTableViewCell class] ;
    }
    return baseCls;
}
-(NSString*) getCardType:(NSIndexPath*)indexPath{
    YKCards* card = self.cards[indexPath.row];
    return card.data.redirect_type;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([[self getCardType:indexPath] isEqualToString:WEB_TYPE]) {
        return screenW/2;
    }
    return screenW-10;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:false];
     YKCards* card = self.cards[indexPath.row];
//    BINPlayViewController* playVc = [[BINPlayViewController alloc] init];
    BINPlayViewController* playVc = [[BINPlayViewController alloc] initWithLiveInfo:card.data.live_info];
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
