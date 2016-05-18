//
//  SLAnimationDismissed.m
//  自定义转场动画
//
//  Created by CHEUNGYuk Hang Raymond on 16/5/3.
//  Copyright © 2016年 CHEUNGYuk Hang Raymond. All rights reserved.
//

#import "SLAnimationDismissed.h"

@implementation SLAnimationDismissed

#pragma mark -- 重写一下两种方法，达到改变modal方式下的dismiss时候的动画

//返回值为设施modal方式下dismiss的时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.5;
}

//重写moda方式下dismiss的动画
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIView *contentView = [transitionContext containerView];
    
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    [contentView addSubview:fromView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        if (fromView.transform.b > 0) {
            fromView.transform = CGAffineTransformMakeRotation(M_PI_2);
        } else {
            fromView.transform = CGAffineTransformMakeRotation(-M_PI_2);
        }
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
