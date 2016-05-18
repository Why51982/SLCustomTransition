//
//  ViewController.m
//  SLCustomTransitionDemo
//
//  Created by CHEUNGYuk Hang Raymond on 16/5/18.
//  Copyright © 2016年 CHEUNGYuk Hang Raymond. All rights reserved.
//

#import "ViewController.h"
#import "SLAnimationPresented.h"
#import "SLAnimationDismissed.h"
#import "SLPlayerControllerViewController.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//设置一个按钮，达到modal的目的
- (IBAction)buttonClick:(id)sender {
    
    SLPlayerControllerViewController *playController = [[SLPlayerControllerViewController alloc] init];
    
    //系统提供选择的转场动画，有四种方式
    //    playController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    //自定义动画
    playController.modalPresentationStyle = UIModalPresentationCustom;
    
    //设置代理
    playController.transitioningDelegate = self;
    
    //modal
    [self presentViewController:playController animated:YES completion:nil];
}

#pragma mark -- <UIViewControllerTransitioningDelegate>

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    //重写modal方式下present时候的样式(注意:SLAnimationPresented为NSObject对象)
    SLAnimationPresented *animationPresented = [[SLAnimationPresented alloc] init];
    return animationPresented;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    //重写modal方式下dismiss时候的样式(注意:SLAnimationDismissed为NSObject对象)
    SLAnimationDismissed *animationDismissed = [[SLAnimationDismissed alloc] init];
    return animationDismissed;
}

@end
