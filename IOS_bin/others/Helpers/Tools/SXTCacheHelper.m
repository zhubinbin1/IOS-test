//
//  SXTCacheHelper.m
//

#import "SXTCacheHelper.h"

static NSString *const adImageName = @"adImageName";

@implementation SXTCacheHelper

+ (NSString *)getAdvertiseImage {
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:adImageName];
}

+ (void)setAdvertiseImage:(NSString *)imageName {
 
    [[NSUserDefaults standardUserDefaults] setObject:imageName forKey:adImageName];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
