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
#import "YKLiveCollectionViewCell.h"
#import "BINPlayViewController.h"

@interface BINLiveViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong) YingkNetHelper* netHelper;
@property(nonatomic,strong)NSArray<SXTCards*>* cards;
@property(nonatomic,strong)UICollectionView* mCollectionView;
@end

@implementation BINLiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self relayoutView];
    [self.mCollectionView registerClass:[YKLiveCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([YKLiveCollectionViewCell class])];
//    self.view.backgroundColor = [UIColor greenColor];
    [self.netHelper getYingKeHomeDataWithPage:0 success:^(SXTResponse *respon) {
        self.cards =  [respon cards];
        if (self.mCollectionView) {
            [self.mCollectionView reloadData];
        }
        NSLog(@"==success==%@",self.cards);
    } fail:^(NSError *error) {
        NSLog(@"==error==");
    }];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionView *)mCollectionView{
    if (!_mCollectionView) {
        
        UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _mCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH) collectionViewLayout:flowLayout];
        _mCollectionView.delegate = self;
        _mCollectionView.dataSource = self;
        _mCollectionView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_mCollectionView];
    }
    return _mCollectionView;
}
-(void)relayoutView{
    
//    [self.mCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
//    }];
}
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:false];
    BINPlayViewController* playCtr = [[BINPlayViewController alloc] init];
    [self.navigationController pushViewController:playCtr animated:YES];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString* identifier = NSStringFromClass([YKLiveCollectionViewCell class]);
    YKLiveCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];

    if (!cell) {
        cell = [[YKLiveCollectionViewCell alloc] init];
    }
    
        [cell setData:self.cards[indexPath.row]];
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(screenW/2-10, screenW/2-10);
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.cards.count;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(3, 1.5, 3, 1.5);
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
