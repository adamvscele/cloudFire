//
//  UIColor+Util.h
//  CloudFire
//
//  Created by macos on 2018/1/18.
//  Copyright © 2018年 jbu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Util)

+(UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha;

+(UIColor *)colorWithHex:(int)hexValue;
+ (UIColor *)separatorColor;

+ (UIColor *)refreshControlColor;

+ (UIColor *)navigationbarColor;

@end
