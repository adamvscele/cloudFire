//
//  HomePageHeadView.h
//  CloudFire
//
//  Created by macos on 2018/1/18.
//  Copyright © 2018年 jbu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuartzCanvasView.h"
@interface HomePageHeadView : UIView

@property (nonatomic, weak) QuartzCanvasView *drawView;;
@property (nonatomic,strong) UIImageView *userPortrait;
@property (nonatomic,strong) UIImageView *genderImageView;
@property (nonatomic, strong)  UILabel *nameLabel;
@property (nonatomic, strong)  UILabel *creditLabel;

@end
