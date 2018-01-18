//
//  AFHTTPRequestOperationManager+Util.m
//  CloudFire
//
//  Created by macos on 2018/1/18.
//  Copyright © 2018年 jbu. All rights reserved.
//

#import "AFHTTPRequestOperationManager+Util.h"

@implementation AFHTTPRequestOperationManager (Util)


@end

@implementation AFNetworkReachabilityManager (Comment)

static AFNetworkReachabilityManager* _shareReachability;
+ (AFNetworkReachabilityManager* )shareReachability{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareReachability = [AFNetworkReachabilityManager managerForAddress:@"www.oschina.net"];
    });
    return _shareReachability;
}

@end
