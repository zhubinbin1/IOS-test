//
//  BINLiveViewController.m
//  IOS_bin
//
//  Created by binbin on 2018/12/23.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "BINLiveViewController.h"
#import "YingkNetHelper.h"
#import "YKResponse.h"
#import "YKLiveCollectionViewCell.h"
#import "BINPlayViewController.h"
#import "YKUICollectionViewFlowLayout.h"

@interface BINLiveViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong) YingkNetHelper* netHelper;
@property(nonatomic,strong)NSArray<YKCards*>* cards;
@property(nonatomic,strong)UICollectionView* mCollectionView;
@end

@implementation BINLiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self relayoutView];
    [self.mCollectionView registerClass:[YKLiveCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([YKLiveCollectionViewCell class])];
    //    self.view.backgroundColor = [UIColor greenColor];
    [self.netHelper getYingKeHomeDataWithPage:0 success:^(YKResponse *respon) {
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

        YKUICollectionViewFlowLayout* flowLayout = [[YKUICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _mCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH- 49) collectionViewLayout:flowLayout];
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
     YKCards* card = self.cards[indexPath.row];
    BINPlayViewController* playCtr = [[BINPlayViewController alloc] initWithLiveInfo:card.data.live_info];
    [self.navigationController pushViewController:playCtr animated:YES];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString* identifier = NSStringFromClass([YKLiveCollectionViewCell class]);
    YKLiveCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell setData:self.cards[indexPath.row]];
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(screenW/2, screenW/2);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.cards.count;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
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


@end
