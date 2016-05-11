//
//  EasingKeyFrameAnimationViewController.m
//  CoreAnimationDemo
//
//  Created by yiwanjun on 16/5/11.
//  Copyright © 2016年 yidahis. All rights reserved.
//

#import "EasingKeyFrameAnimationViewController.h"

@interface EasingKeyFrameAnimationViewController ()
@property (nonatomic, strong) UIView *layerView;
@property (nonatomic, strong) CALayer *colorLayer;
@end

@implementation EasingKeyFrameAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    //create layerView
    CGFloat width = 150.0f;
    self.layerView = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2 - width/2, 100, width, width)];
    [self.layerView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.layerView];
    
    //create button
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame)/2 - width/2, CGRectGetMaxY(self.layerView.frame), width, 30)];
    [button setTitle:@"change" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(changeColor) forControlEvents:UIControlEventTouchUpInside];
    
    
    //create sublayer
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(25.0f, 25.0f, 100.0f, 100.0f);
    self.colorLayer.backgroundColor = [UIColor blueColor].CGColor;
    //add it our view
    [self.layerView.layer addSublayer:self.colorLayer];
}

- (void)changeColor{
    //create a keyframe animation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"backgroundColor";
    animation.duration = 2.0;
    animation.values = @[(__bridge id)[UIColor blueColor].CGColor,
                         (__bridge id)[UIColor redColor].CGColor,
                         (__bridge id)[UIColor greenColor].CGColor,
                         (__bridge id)[UIColor blueColor].CGColor];
    //add timing function
    CAMediaTimingFunction *fn = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.timingFunctions = @[fn,fn,fn];
    //apply animation to layer
    [self.colorLayer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
