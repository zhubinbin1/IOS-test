//
//  YKUICollectionViewFlowLayout.m
//  IOS_bin
//
//  Created by binbin on 2019/1/3.
//  Copyright © 2019年 binbin. All rights reserved.
//

#import "YKUICollectionViewFlowLayout.h"

@implementation YKUICollectionViewFlowLayout
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray * answer = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    
    /* 处理左右间距 */
    
    for(int i = 1; i < [answer count]; ++i) {
        UICollectionViewLayoutAttributes *currentLayoutAttributes = answer[i];
        UICollectionViewLayoutAttributes *prevLayoutAttributes = answer[i - 1];
        //注意：currentLayoutAttributes.indexPath.section 这里是单独处理某个section的空隙，如果不需要可把if判断删除即可
//        if (currentLayoutAttributes.indexPath.section == 0) {
            NSInteger maximumSpacing = 0;
            NSInteger origin = CGRectGetMaxX(prevLayoutAttributes.frame);
            if(origin + maximumSpacing + currentLayoutAttributes.frame.size.width < self.collectionViewContentSize.width) {
                CGRect frame = currentLayoutAttributes.frame;
                frame.origin.x = origin + maximumSpacing;
                currentLayoutAttributes.frame = frame;
            }
//        }
    }
    
    return answer;
    
}

@end
