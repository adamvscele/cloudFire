//
//  Utils.h
//  CloudFire
//
//  Created by macos on 2018/1/18.
//  Copyright © 2018年 jbu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIColor+Util.h"
#import "UIView+Util.h"
#import "AFHTTPRequestOperationManager+Util.h"
@class MBProgressHUD;
@interface Utils : NSObject

+ (UIImage*)createImageWithColor:(UIColor*) color;
+ (NSInteger)networkStatus;
+ (BOOL)isNetworkExist;
+ (MBProgressHUD *)createHUD;
@end
