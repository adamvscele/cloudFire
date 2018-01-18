//
//  UIView+Util.m
//  CloudFire
//
//  Created by macos on 2018/1/18.
//  Copyright © 2018年 jbu. All rights reserved.
//

#import "UIView+Util.h"

@implementation UIView (Util)


#define kScreenScale GraScreenScale()

-(void)setCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds =YES;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = kScreenScale;
}

- (void)setBorderWidth:(CGFloat)width andColor:(UIColor *)color
{
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}



CGFloat GraScreenScale(){
    static CGFloat scale;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        scale = [UIScreen mainScreen].scale;
    });
    return scale;
}
@end
