//
//  SXTUserHelper.h
//

#import <Foundation/Foundation.h>

@interface SXTUserHelper : NSObject

+ (instancetype)sharedUser;

@property (nonatomic, copy) NSString * username;

@property (nonatomic, copy) NSString * iconUrl;

+ (BOOL)isAutoLogin;

+ (void)saveUser;



@end
