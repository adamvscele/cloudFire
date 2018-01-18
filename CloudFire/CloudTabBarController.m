	//
//  CloudTabBarController.m
//  CloudFire
//
//  Created by macos on 2018/1/17.
//  Copyright © 2018年 jbu. All rights reserved.
//

#import "CloudTabBarController.h"

@interface CloudTabBarController ()

@end

@implementation CloudTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIStoryboard *dis = [UIStoryboard storyboardWithName:@"Discover" bundle:nil];
    UINavigationController *disNav =[dis instantiateViewControllerWithIdentifier:@"Nav"];
    
    UIStoryboard *homepageSB = [UIStoryboard storyboardWithName:@"Homepage" bundle:nil];
    UINavigationController *homepageNav = [homepageSB instantiateViewControllerWithIdentifier:@"Nav"];
    
    
    self.tabBar.translucent = NO;
    self.viewControllers = @[disNav,homepageNav];
    
    NSArray *titles = @[@"发现",@"我的"];
    NSArray *images =@[@"tabbar-discover",@"tabbar-me"];
    [self.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem *item, NSUInteger idx, BOOL *stop) {
        [item setTitle:titles[idx]];
        item.image = [[UIImage imageNamed:images[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = [[UIImage imageNamed:[images[idx] stringByAppendingString:@"-selected"]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }];
    
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
