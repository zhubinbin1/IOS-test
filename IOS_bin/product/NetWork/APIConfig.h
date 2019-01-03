//
//  APIConfig.h
//

#import <Foundation/Foundation.h>
#import "BINScrollViewController.h"
//映客。 左边导航条的数据访问(北京)
//https://service.inke.cn/api/live/card_recommend?latitude=40.028372
//user_feed 流地址:
//https://service.inke.cn/api/user_feed/recommend?offset=2
//图片地址:
//http://img2.inke.cn
//首页地址:
//https://service.inke.cn/api/live/card_recommend?offset=1
@interface APIConfig : NSObject

#define SERVER_HOST @"https://service.inke.cn/"

#define IMAGE_HOST @"http://img2.inke.cn/"

//首页数据
#define API_HomePage @"api/live/card_recommend"//?uid=85149891&latitude=40.090562&longitude=116.413353

//user_feed列表
#define API_UserFeed @"api/user_feed/recommend"
//附近的直播
#define API_NearBy @"api/live/card_recommend"//channel_id=2&latitude=40.090562&longitude=116.413353//附近
//https://service.inke.cn/api/live/card_recommend?latitude=40.028372&longitude=116.42&offset=0




@end
