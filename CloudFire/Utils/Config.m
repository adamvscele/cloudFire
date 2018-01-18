//
//  Config.m
//  CloudFire
//
//  Created by macos on 2018/1/18.
//  Copyright © 2018年 jbu. All rights reserved.
//

#import "Config.h"
NSString * const kUserID = @"userID";

@implementation Config


+(NSInteger) getOwnID{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults integerForKey:kUserID];
}

@end
