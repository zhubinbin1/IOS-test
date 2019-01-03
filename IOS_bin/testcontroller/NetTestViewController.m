//
//  NetTestViewController.m
//  IOS_bin
//
//  Created by binbin on 2018/12/9.
//  Copyright © 2018年 binbin. All rights reserved.
//

#import "NetTestViewController.h"
#import "DownImgViewController.h"
#import "HttpTool.h"
#import "APIConfig.h"
#import "YKResponse.h"
#import "MJExtension.h"
/**
 网络测试
 AFN使用技巧
 1.在开发的时候可以创建一个工具类，继承自我们的AFN中的请求管理者，再控制器中真正发请求的代码使用自己封装的工具类。
 2.这样做的优点是以后如果修改了底层依赖的框架，那么我们修改这个工具类就可以了，而不用再一个一个的去修改。
 3.该工具类一般提供一个单例方法，在该方法中会设置一个基本的请求路径。
 4.该方法通常还会提供对GET或POST请求的封装。
 5.在外面的时候通过该工具类来发送请求
 6.单例方法：+ (instancetype)shareNetworkTools{
 static XMGNetworkTools *instance;
 static dispatch_once_t onceToken;
 dispatch_once(&onceToken, ^{
 // 注意: BaseURL中一定要以/结尾
 instance=[[self alloc]initWithBaseURL:[NSURL URLWithString:@"请求的URL"]];    });    return instance;
 }
 链接：https://www.jianshu.com/p/ab246881efa9
 */
@interface NetTestViewController ()<NSURLSessionDownloadDelegate,NSXMLParserDelegate>//NSURLSessionDelegate   NSURLSessionDataDelegate
@property(nonatomic,strong)UIButton* getNet;
@property(nonatomic,strong) AFHTTPSessionManager* manager;
@property (strong, nonatomic) NSURLSession *session;
@end

@implementation NetTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _manager = [AFHTTPSessionManager manager];
    [self initViewBarItem:@"网络测试" leftTitle:@"返回" rightTitle:@"下载图片测试"];
    [self getYingKeNet];
//    [self getNet];
//    [self networkStatusChangeAFN];
//    [self testRequestNet];
    //    NSLog(@"NetTestViewController - viewDidLoad");
}
-(void) getYingKeNet{
    NSDictionary* par = @{@"offset":@1};
    [HttpTool getWithPath:API_HomePage params:par success:^(id json) {
       YKResponse* res =  [YKResponse objectWithKeyValues:json];
        NSLog(@"success===:%@",res.error_msg);
//        SXTResponse MJReplacedKeyFromPropertyName121
    } failure:^(NSError *error) {
        NSLog(@"error===:%@",error);
    }];
}
//将session设置为全局的属性,方便发送网络请求
//在懒加载里面设置配置的信息,达到统一设置
//https://www.jianshu.com/p/762ed701de9b
#pragma  makr - 懒加载
-(NSURLSession *)session
{
    if (_session == nil) {
        
        //设置配置信息
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        //统一设置请求超时
        config.timeoutIntervalForRequest = 15.0;
        //设置是否允许蜂窝网络访问
        config.allowsCellularAccess = YES;
        
        _session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    NSLog(@"%@",[NSThread currentThread]);
}
//-(void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didBecomeDownloadTask:(NSURLSessionDownloadTask *)downloadTask{
//     NSLog(@"%@",[NSThread currentThread]);
//}
-(void)testRequestNet{
    //     NSDictionary *dict = @{@"type":@"XML"};
    NSDictionary* dic =@{@"type":@"JSON"};
    //设置不做处理
    AFHTTPResponseSerializer* serializer =  [AFHTTPResponseSerializer serializer];
    serializer.acceptableContentTypes= [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
    _manager.responseSerializer =serializer;
    [_manager GET:(@"https://www.baidu.com") parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"===progress:%f",1.0*(downloadProgress.completedUnitCount/downloadProgress.totalUnitCount));
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"===success:%@",responseObject);
        //        //1.创建解析器 ----xml
        //        NSXMLParser *parser = (NSXMLParser *)responseObject;
        //        //2.设置代理
        //        parser.delegate = self;
        //        //3.开始解析
        //        [parser parse];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"===failure:%@",error);
    }];
    //    NSDictionary* dic = @{
    //                          @"username":@"zhubin",
    //                          @"pwd":@"1314",
    //                          @"type":@"JSON"
    //                          };
    //    [_manager POST:@"https://www.baidu.com" parameters:dic progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //          NSLog(@"===success:%@",responseObject);
    //    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //         NSLog(@"===failure:%@",error);
    //    }];
    
}

-(void)networkStatusChangeAFN
{
    //1.获得一个网络状态监听管理者
    AFNetworkReachabilityManager *manager =  [AFNetworkReachabilityManager sharedManager];
    
    //2.监听状态的改变(当网络状态改变的时候就会调用该block)
   
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        /*
         AFNetworkReachabilityStatusUnknown          = -1,  未知
         AFNetworkReachabilityStatusNotReachable     = 0,   没有网络
         AFNetworkReachabilityStatusReachableViaWWAN = 1,    3G|4G
         AFNetworkReachabilityStatusReachableViaWiFi = 2,   WIFI
         */
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                NSLog(@"wifi");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"3G|4G");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                NSLog(@"没有网络");
                break;
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知");
                break;
                
            default:
                break;
        }
    }];
    
    //3.手动开启 开始监听
    [manager startMonitoring];
}
-(void)downLoad:(NSString*)url{
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [ _manager downloadTaskWithRequest:request progress:^(NSProgress *downloadProgress){
        NSLog(@"downloadTaskWithRequest  progress:%f",1.0f*(downloadProgress.completedUnitCount/downloadProgress.totalUnitCount));
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        NSLog(@"===progress:%@",targetPath);
        //拼接文件的全路径
        NSString *fullpath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:response.suggestedFilename];
        
        NSLog(@"fullpath == %@",fullpath);
        return [NSURL fileURLWithPath:fullpath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSLog(@"%@",filePath);
    }];
    //    NSURLRequest* request2 =[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    //    [[self.session downloadTaskWithRequest:request2]resume];
    
}
-(void)upLoad:(NSString*)url{
    /*
     第一个参数:请求路径(NSString)
     第二个参数:非文件参数
     第三个参数:constructingBodyWithBlock 拼接数据(告诉AFN要上传的数据是哪些)
     第四个参数:progress 进度回调
     第五个参数:success 成功回调
     responseObject:响应体
     第六个参数:failure 失败的回调
     */
    
    [_manager POST:@"" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *data = [NSData dataWithContentsOfFile:@"/Users/apple/Desktop/Snip20160409_148.png"];
        //拼接数据
        /*
         第一个参数:文件参数 (二进制数据)
         第二个参数:参数名~file
         第三个参数:该文件上传到服务器以什么名称来保存
         第四个参数:
         */
        [formData appendPartWithFileData:data name:@"file" fileName:@"123.png" mimeType:@"image/png"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%f",1.0 * uploadProgress.completedUnitCount / uploadProgress.totalUnitCount);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"success--%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failure -- %@",error);
    }];
}
- (UIButton *)getNet{
    if (!_getNet) {
        _getNet = [[UIButton alloc] init];
        [_getNet setTitle:@"访问网络" forState:UIControlStateNormal];
        _getNet.backgroundColor = [UIColor grayColor];
        [_getNet addTarget:self action:@selector(getNetClick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_getNet];
        [_getNet mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.view).offset(60);
            make.size.mas_equalTo(CGSizeMake(100, 50));
        }];
    }
    return _getNet;
}
#pragma mark NSXMLParserDelegate
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    NSLog(@"%@--%@",elementName,attributeDict);
}
-(void)getNetClick{
    NSLog(@"请求网络");
    [self testRequestNet];
}
-(void)rightBarClick:(UIButton *)btn{
    DownImgViewController* downImgVC = [[DownImgViewController alloc] init];
    [self.navigationController pushViewController:downImgVC animated:true];
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
