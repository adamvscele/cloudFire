//
//  NewLoginViewController.m
//  CloudFire
//
//  Created by macos on 2018/1/18.
//  Copyright © 2018年 jbu. All rights reserved.
//

#import "NewLoginViewController.h"

@interface NewLoginViewController ()
@property (nonatomic,weak) IBOutlet UIImageView *backImageView;

@end

@implementation NewLoginViewController
-(IBAction)backAction:(id)sender{
    _backImageView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    //[[UINavigationBar appearance] setTintColor:[UIColor blueColor]];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
