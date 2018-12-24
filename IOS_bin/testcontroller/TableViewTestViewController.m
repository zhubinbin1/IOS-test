//
//  TableViewTestViewController.m
//  IOS_bin
//
//  Created by binbin on 2018/12/9.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "TableViewTestViewController.h"
#import "TableViewData.h"
#import "TableViewTestCell.h"
#import "MasonryTestViewController.h"
#import "ViewTestViewController.h"
#import "NetTestViewController.h"
#import "DownImgViewController.h"
#import "AudioStreamerViewController.h"
#import "FMDBViewController.h"
#import "MJRefreshTestViewController.h"
//@class TableViewData;
@interface TableViewTestViewController ()
@property(nonatomic,strong)NSMutableArray* mTestData;
@end

@implementation TableViewTestViewController
- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        return  [self initWithStyle:UITableViewStylePlain];
    }
    return self;
}
//- (instancetype)initWithStyle:(UITableViewStyle)style{
//    return [self init];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navigationItem].title=@"TableView 列表";
    [self testData];
}
-(NSMutableArray*)testData{
    NSMutableArray* array = [[NSMutableArray alloc]init];
    
    TableViewData* autoLayout = [self getTableViewDataByName:@"自动布局" andId:1 andDescribe:@"自动布局Masonry控件的练习"];
    TableViewData* viewTest = [self getTableViewDataByName:@"view 测试" andId:2 andDescribe:@"控件的练习"];
    TableViewData* netTest= [self getTableViewDataByName:@"网络测试" andId:2 andDescribe:@"网络的练习"];
    TableViewData* downImg= [self getTableViewDataByName:@"下载图片" andId:2 andDescribe:@"下载图片的练习"];
    TableViewData* audioStream= [self getTableViewDataByName:@"音频播放" andId:2 andDescribe:@"AudioStreamer的练习"];
    TableViewData* fMDB= [self getTableViewDataByName:@"FMDB" andId:2 andDescribe:@"FMDB的练习"];
    TableViewData* mJRefresh= [self getTableViewDataByName:@"MJReFresh" andId:2 andDescribe:@"MJReFresh的练习"];
    TableViewData* scrollViewTest= [self getTableViewDataByName:@"scrollViewTest" andId:2 andDescribe:@"crollView的练习"];
    [array addObject:scrollViewTest];
    [array addObject:(autoLayout)];
    [array addObject:viewTest];
    [array addObject:netTest];
    [array addObject:downImg];
    [array addObject:audioStream];
    [array addObject:fMDB];
    [array addObject:mJRefresh];
  
    self.mTestData = array;
    //    TableViewData* d = array[0];
    return array;
}
-(TableViewData*)getTableViewDataByName:(NSString*)name andId:(NSInteger)uId andDescribe:(NSString*)describe{
    TableViewData* data = [[TableViewData alloc]init];
    data.name = name;
    data.uId = uId;
    if (describe) {
        data.describe = describe;
    }
    return data;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.testData.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    BaseViewController * baseVc;
    if (indexPath.row==0) {
         baseVc = [[BINScrollViewController alloc] init];
    }else if(indexPath.row==1){
        baseVc = [[MasonryTestViewController alloc] init];
    }else if(indexPath.row==2){
        baseVc = [[ViewTestViewController alloc] init];
    }else if(indexPath.row==3){
        baseVc = [[NetTestViewController alloc] init];
    }else if(indexPath.row==4){
        baseVc = [[DownImgViewController alloc] init];
    }else if(indexPath.row==5){
        baseVc = [[AudioStreamerViewController alloc] init];
    }else if(indexPath.row==6){
        baseVc = [[FMDBViewController alloc] init];
    }else if(indexPath.row==7){
        baseVc = [[MJRefreshTestViewController alloc] init];
    }
    [[self navigationController] pushViewController:baseVc animated:true];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* tellId = @"cell";
    TableViewTestCell* cell = [tableView dequeueReusableCellWithIdentifier:tellId];
    if (!cell) {
        cell = [[TableViewTestCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tellId];
        UIView* selectView = [[UIView alloc]init];
        selectView.backgroundColor = [UIColor lightGrayColor];//设置按下颜色
        [cell setSelectedBackgroundView:selectView];
    }
    TableViewData* data = self.mTestData[indexPath.row];
    cell.labName.text = data.name;
    cell.iconView.image = [UIImage imageNamed:@"gift_number_0"];
    cell.labDescribe.text = data.describe;
    return cell;
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
