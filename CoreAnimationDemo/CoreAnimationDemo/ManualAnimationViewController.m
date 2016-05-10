//
//  ManualAnimationViewController.m
//  CoreAnimationDemo
//
//  Created by yiwanjun on 16/5/10.
//  Copyright © 2016年 yidahis. All rights reserved.
//

#import "ManualAnimationViewController.h"

@interface ManualAnimationViewController ()
@property (nonatomic,strong) UIView *containerView;
@property (nonatomic,strong) CALayer *doorlayer;

@end

@implementation ManualAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.containerView = [[UIView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.containerView];
    
    //add the door
    self.doorlayer = [CALayer layer];
    self.doorlayer.frame = CGRectMake(0, 0, 128, 256);
    self.doorlayer.position = CGPointMake(150 - 64, 250);
    self.doorlayer.anchorPoint = CGPointMake(0, 0.5);
    self.doorlayer.contents = (__bridge id)[UIImage imageNamed:@"door.jpg"].CGImage;
    [self.containerView.layer addSublayer:self.doorlayer];
    
    //apply perspective transform
    
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = - 1.0/500.0;
    self.containerView.layer.sublayerTransform = perspective;
    
    //add pan gesture recongnizer to handle swipes
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]init];
    [pan addTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];
    
    //pause all layer animations
    self.doorlayer.speed = 0.0;
    
    //apply swinging animation (which won't play beause layer is paused)
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation.y";
    animation.toValue = @(-M_PI_2);
    animation.duration = 1.0;
    [self.doorlayer addAnimation:animation forKey:nil];
    
}

- (void)pan:(UIPanGestureRecognizer*)pan{
    //get hotizontal component of pan gesture
    CGFloat x = [pan translationInView:self.view].x;
    //convert from points to animation durtion
    //using a reasonable scale factor
    x /= 200.0f;
    
    //update timeOffset and clamp result
    CFTimeInterval timeOffset = self.doorlayer.timeOffset;
    timeOffset = MIN(0.999, MAX(0.0, timeOffset - x));
    self.doorlayer.timeOffset = timeOffset;
    
    //reset pan gesture
    [pan setTranslation:CGPointZero inView:self.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
