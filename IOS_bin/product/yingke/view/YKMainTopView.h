//
//  SXTMainTopView.h
//

#import <UIKit/UIKit.h>

typedef void(^MainTopBlock)(NSInteger tag);

@interface YKMainTopView : UIView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles tapView:(MainTopBlock)block;

- (void)scrolling:(NSInteger)tag;

@end
