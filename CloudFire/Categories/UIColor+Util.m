//
//  UIColor+Util.m
//  CloudFire
//
//  Created by macos on 2018/1/18.
//  Copyright © 2018年 jbu. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)


+(UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000)>>16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0
                           alpha:alpha];
}

+(UIColor *)colorWithHex:(int)hexValue{
    return [UIColor colorWithHex:hexValue alpha:1.0];
}
+(UIColor*) separatorColor{
    return [UIColor colorWithHex:0xC8C7CC];
}

/* 导航栏背景色 */
+ (UIColor *)navigationbarColor
{
    return [UIColor colorWithHex:0x24cf5f];//colorWithHex:0x15A230
}

+ (UIColor *)refreshControlColor
{
    return [UIColor colorWithHex:0x21B04B];
}
@end
