//
//  ViewController.m
//  CoreAnimationDemo
//
//  Created by yiwanjun on 16/5/10.
//  Copyright © 2016年 yidahis. All rights reserved.
//

#import "ViewController.h"
#import "ManualAnimationViewController.h"
#import "EasingKeyFrameAnimationViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) NSArray *items;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.items = @[@"9.4",@"10.3"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.items.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.items[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            ManualAnimationViewController *man = [ManualAnimationViewController new];
            [self.navigationController pushViewController:man animated:YES];
            
        }
            break;
        case 1:{
            EasingKeyFrameAnimationViewController *eas = [EasingKeyFrameAnimationViewController new];
            [self.navigationController pushViewController:eas animated:YES];
        }
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
