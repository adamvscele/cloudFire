//
//  Utils.m
//  CloudFire
//
//  Created by macos on 2018/1/18.
//  Copyright © 2018年 jbu. All rights reserved.
//

#import "Utils.h"
#import <MBProgressHUD.h>

@implementation Utils



+ (NSInteger)networkStatus{
    return [AFNetworkReachabilityManager shareReachability].networkReachabilityStatus;
}

+ (BOOL)isNetworkExist
{
    return [self networkStatus] != 0;
}

+ (UIImage*)createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0,0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (MBProgressHUD *)createHUD
{
    UIWindow *window;
    NSArray *windows = [[UIApplication sharedApplication] windows];
    for(UIWindow *eachWindow in windows){
        if ([eachWindow isKeyWindow]) {
            window = eachWindow;
        }
    }
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:window];
    HUD.detailsLabel.font = [UIFont boldSystemFontOfSize:16];
    [window addSubview:HUD];
    [HUD showAnimated:YES];
    HUD.removeFromSuperViewOnHide = YES;
    
    return HUD;
}
@end
