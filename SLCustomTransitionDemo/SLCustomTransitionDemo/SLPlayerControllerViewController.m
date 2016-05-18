//
//  SLPlayerControllerViewController.m
//  自定义转场动画
//
//  Created by CHEUNGYuk Hang Raymond on 16/5/3.
//  Copyright © 2016年 CHEUNGYuk Hang Raymond. All rights reserved.
//

#import "SLPlayerControllerViewController.h"

@interface SLPlayerControllerViewController ()

@end

@implementation SLPlayerControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)loadView {
    
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = [UIColor grayColor];
    
    //改变锚点X值为屏幕的重点，Y值为2个屏幕的长度
    //注意:下面两句不能颠倒顺序，frame计算出来的时候要根据图层的
    self.view.layer.anchorPoint = CGPointMake(0.5, 2);
    self.view.frame = [UIScreen mainScreen].bounds;
    
    //添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(didRecognizerPanGesture:)];
    [self.view addGestureRecognizer:pan];
}

//手势方法
- (void)didRecognizerPanGesture:(UIPanGestureRecognizer *)panGesture {
    
    //拿到手势在屏幕上滑动的距离
    CGFloat offSetX = [panGesture translationInView:panGesture.view].x;
    //计算出滑动距离和屏幕宽度的比例系数
    CGFloat percent = offSetX / self.view.bounds.size.width;
    //用比例系数 * M_PI_4 来限制view旋转的最大角度为45°
    CGFloat radians = percent * M_PI_4;
    //执行旋转的动画
    self.view.transform = CGAffineTransformMakeRotation(radians);
    
    //当手势结束或者取消的时候，执行dismiss
    if (panGesture.state == UIGestureRecognizerStateEnded || panGesture.state == UIGestureRecognizerStateCancelled) {
        //设置滑动的角度，小于0.16的时候回到原来的样子，大于0.16的时候就dismiss
        if (ABS(self.view.transform.b) < 0.16) {
            self.view.transform = CGAffineTransformIdentity;
        } else {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

@end
