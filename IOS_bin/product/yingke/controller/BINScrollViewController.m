//
//  BINScrollViewController.m
//  IOS_bin
//
//  Created by binbin on 2018/12/23.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "BINScrollViewController.h"
#import "YKMainTopView.h"
@interface BINScrollViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView* scrollView;
@property(nonatomic,strong)NSArray* titleNames;
@property(nonatomic,strong)YKMainTopView* topView;
@end

@implementation BINScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navigationItem.titleView = self.topView;
         [self initViewBarItem:@"" leftTitle:@"返回" rightTitle:@""];
    [[self navigationController] setNavigationBarHidden:NO];
//    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:NULL];
//    self.navigationItem.leftBarButtonItem=leftItem;
    [self.view setBackgroundColor:[UIColor whiteColor] ];
    [self.view addSubview:self.scrollView];
    [self addSubController];
}
-(YKMainTopView *)topView{
    if (!_topView) {
        
        _topView = [[YKMainTopView alloc] initWithFrame:CGRectMake(0, 0, 200, 40) titles:self.titleNames tapView:^(NSInteger tag) {
            
            CGPoint point = CGPointMake(tag * screenW ,self.scrollView.contentOffset.y);
            
            [self.scrollView setContentOffset:point animated:YES];
            
        }];
    }
    return _topView;
}
-(void)addSubController{
    NSArray* subControllers = @[@"BINNearByViewController",@"BINLiveViewController",@"BINUserFeedViewController"];
    for (int i=0; i<self.titleNames.count; i++) {
        UIViewController* controller =[[NSClassFromString(subControllers[i]) alloc]init];
        controller.title = self.titleNames[i];
        [self addChildViewController:controller];
    }
    [self scrollViewDidEndScrollingAnimation:self.scrollView];
    //      [self scrollViewDidEndDecelerating:self.scrollView];
}
-(NSArray *)titleNames{
    if (!_titleNames) {
        _titleNames = @[@"全球",@"直播",@"用户"];
    }
    return _titleNames;
}
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView =[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH)];
        _scrollView.contentSize = CGSizeMake(screenW*3, screenH);
        _scrollView.backgroundColor = [UIColor grayColor];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = YES;
//        _scrollView.contentOffset = CGPointMake(0, 0);
        [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
        //        [_scrollView setContentOffset: CGPointMake(0, 0) animated:YES];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidEndScrollingAnimation====");
    CGFloat width = screenW;
    CGFloat height= screenH;
    CGFloat offsetX = scrollView.contentOffset.x;
    
    NSInteger index = offsetX / width;
    //标题线
    [self.topView scrolling:index];
    UIViewController* ctroller = self.childViewControllers[index];
    if ([ctroller isViewLoaded]) {
        return;
    }
    ctroller.view.frame = CGRectMake(offsetX, 0, width, height);
    [self.scrollView addSubview:ctroller.view];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    NSLog(@"scrollViewDidEndDecelerating====");
     [self scrollViewDidEndScrollingAnimation:scrollView];
}
@end
