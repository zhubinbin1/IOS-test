//
//  ViewTestViewController.m
//  IOS_bin
//
//  Created by binbin on 2018/12/9.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "ViewTestViewController.h"
#import "PerSon.h"
#import <UILabel+FlickerNumber.h>
#import <RegExCategories.h>


@interface ViewTestViewController ()<MBProgressHUDDelegate>
@property(nonatomic,strong)FBKVOController * fbkv ;
@property(nonatomic,strong)PerSon* personOne;
@property(nonatomic,assign)int count;
@property(nonatomic,strong)MBProgressHUD* progress;
@property(nonatomic,strong)UILabel* lblFlicker;
@end

@implementation ViewTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //   self.navigationController.fd_prefersNavigationBarHidden = YES;
    //    self.navigationBarHidden = true;
    //    self.setNeedsUpdateOfHomeIndicatorAutoHidden
    //    [self initViewBarItem:@"View 测试" leftTitle:@"back" rightTitle:@""];
    [self addTestBtn];
    [self testRX];
    //    [self setTestFlckerNum];
    //    [self testMBProgressHUD];
    //    [self testKVO];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}



-(void)addTestBtn{
    UIButton * btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 350,80)];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"测试按钮" forState:UIControlStateNormal];
    [self.view addSubview:btn];
}
-(void)btnClick{
    NSLog(@"======btnClick");
    _count++;
    [self setTestFlckerNum];
    //    NSString* name = [@"name_" stringByAppendingString:[NSString stringWithFormat:@"%d",(_count++)]];
    //    _personOne.name =name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
////============test finished======================

//正则
-(void)testRX{
    //匹配电话号码(手机号以13， 15，18开头，八个 \d 数字字符)
    BOOL isMatch = [@"15910514636" isMatch:RX(@"^((13[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$")];
    NSLog(@"匹配电话号码:%d", isMatch);
    
    //匹配邮箱
    BOOL isMatch2 = [@"705786230@qq.com" isMatch:RX(@"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")];
    NSLog(@"匹配邮箱:%d", isMatch2);

    //匹配用户名(用户名长度为6-20位之间,大小写字母或者数字均可)
    BOOL isMatch3 = [@"705786230" isMatch:RX(@"^[A-Za-z0-9]{6,20}+$")];
    NSLog(@"匹配用户名:%d", isMatch3);

    //匹配身份证号
    BOOL isMatch4 = [@"42120919831025587X" isMatch:RX(@"^(\\d{14}|\\d{17})(\\d|[xX])$")];
    NSLog(@"匹配身份证号:%d", isMatch4);
    // 匹配身份证号:1
    
    //使用block来替换
    NSString* result = [RX(@"\\w+") replace:@"hi bud" withBlock:^(NSString* match){
        return [NSString stringWithFormat:@"%@",@(match.length)];
    }];
    NSLog(@"使用block来替换:%@", result);
    // result => @"2 3"
    
    //获取详细匹配信息的block方式
    NSString* result2 = [RX(@"\\w+") replace:@"hi bud" withDetailsBlock:^(RxMatch* match){
        return [NSString stringWithFormat:@"%@", @(match.value.length)];
    }];
    NSLog(@"获取详细匹配信息的block方式:%@", result2);
    // result2 => @"2 3"
}

//数字翻滚效果控件
-(void)setTestFlckerNum{
    if (!_lblFlicker) {
        _lblFlicker = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 100, 50)];
        _lblFlicker.textColor = [UIColor blueColor];
        _lblFlicker.font = [UIFont systemFontOfSize:20];
        _lblFlicker.text=@"setTestFlckerNum";
        [self.view addSubview:_lblFlicker];
    }
    if(self.count ==0){
        [self.lblFlicker fn_setNumber:@(7654321)];
    }else if(self.count ==1){
        [self.lblFlicker fn_setNumber:@(123.982)];
    }else if(self.count ==2){
        [self.lblFlicker fn_setNumber:@(75.212) format:@"￥%.2f"];
    }else if(self.count ==3){
        id attributes = [NSDictionary dictionaryWithAttribute:@{NSFontAttributeName:[UIFont systemFontOfSize:49.0f]}
                                                        range:NSMakeRange(0, 1)];
        [self.lblFlicker fn_setNumber:@(123.45) attributes:attributes];
    }else{
        id attributes = @[[NSDictionary dictionaryWithAttribute:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}
                                                          range:NSMakeRange(0, 1)],
                          [NSDictionary dictionaryWithAttribute:@{NSForegroundColorAttributeName:[UIColor redColor]}
                                                          range:NSMakeRange(1, 3)]];
        [self.lblFlicker fn_setNumber:@(123.45) duration:1.0f format:@"￥%.2f" attributes:attributes];
    }
}

//HUD 测试====start=========

-(void)testMBProgressHUD {
    _progress =  [MBProgressHUD showHUDAddedTo:self.view animated:true];
    //    _progress.frame = CGRectMake(100, 100, 190, 100);
    _progress.label.text = @"努力加载中...";
    _progress.delegate = self;
    //    _progress.backgroundColor = [UIColor greenColor];
    _progress.detailsLabel.text =@"测试MBProgressHUD 详情";
    //    _progress.mode = MBProgressHUDModeIndeterminate;//菊花
    //        _progress.mode = MBProgressHUDModeDeterminate;//圆饼图
    _progress.mode = MBProgressHUDModeDeterminateHorizontalBar;//进度条
    //    _progress.mode = MBProgressHUDModeAnnularDeterminate;//圆环
    //    _progress.mode = MBProgressHUDModeText;//文字
    //    _progress.mode = MBProgressHUDModeCustomView;//自定义
    if(_progress.mode==MBProgressHUDModeCustomView){
        [self custonView:_progress];
    }else{
        [self animationHud:_progress];
    }
}
- (void)hudWasHidden:(MBProgressHUD *)hud{
    //    [_progress removeFromSuperViewOnHide];
    [_progress removeFromSuperview];
    _progress =nil;
}

//自定义视图
- (void)custonView:(MBProgressHUD *)hud{
    NSMutableArray *contingentArray =[NSMutableArray array];
    for (int i=0; i<10; i++) {
        NSString *imgName =[NSString stringWithFormat:@"gift_number_%d",i];
        UIImage *image;
        image =[UIImage imageNamed:imgName];
        [contingentArray addObject:image];
    }
    
    UIImageView *hudImageView =[[UIImageView alloc] init];
    hudImageView.animationImages =contingentArray;  //UIImageView的动画组
    hudImageView.animationDuration= 1.0;        //每次动画的执行时间
    hudImageView.animationRepeatCount = 0;      //设置动画次数，0表示无限
    [hudImageView startAnimating];              //开始动画
    hud.customView = hudImageView;              //自定义的视图，将会展示为HUD效果
    [hud hideAnimated:YES afterDelay:10.0f];     //10s后隐藏HUD
    [_progress removeFromSuperViewOnHide];
    
}
//MBProgressHUD自带视图
- (void)animationHud:(MBProgressHUD *)hud {
    
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        float progress = 0.0f;
        while (progress < 1.0f) {
            progress += 0.01f;
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD HUDForView:self.view].progress = progress;
            });
            usleep(50000);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hideAnimated:YES];
        });
    });
}
//HUD 测试=========end==============
-(void)testKVO{
    if (!_personOne) {
        _personOne = [[PerSon alloc ]init];
        _personOne.name =@"name";
    }
    self.fbkv = [FBKVOController controllerWithObserver:self];
    [self.fbkv observe:_personOne keyPath:_personOne.name options:NSKeyValueObservingOptionNew block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
        NSString* str =   change[NSKeyValueChangeNewKey];
        NSLog(@"str=========%@",str);
    }];
    
}
-(void) showProgress{
    UILabel* view =[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 50, 30)];
    view.text = @"你好";
    [self.view addSubview:view];
    
    UILabel* labe = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    labe.backgroundColor = [UIColor blueColor];
    labe.text = @"asdfadsfasdfasd";
    [self.view addSubview:labe];
}
-(void)viewDidDisappear:(BOOL)animated{
    if (self.fbkv) {
        [self.fbkv unobserveAll];
        //        [self.fbkv unobserve:_personOne];
    }
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
