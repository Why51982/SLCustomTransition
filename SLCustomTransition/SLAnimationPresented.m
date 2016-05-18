//
//  SLAnimationPresented.m
//  自定义转场动画
//
//  Created by CHEUNGYuk Hang Raymond on 16/5/3.
//  Copyright © 2016年 CHEUNGYuk Hang Raymond. All rights reserved.
//

#import "SLAnimationPresented.h"

@implementation SLAnimationPresented

#pragma mark -- 重写下面两种方法，达到控制present动画的样式
//返回值为present出来动画的时间
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    
    return 0.5;
}

//写modal方式下的present时候的动画
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    //获得当前的view
    UIView *contentView = [transitionContext containerView];
    //获得即将present出来的view
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    //把即将present出来的view添加到当前的View上，以便显示出来
    [contentView addSubview:toView];
    
    toView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}

@end
