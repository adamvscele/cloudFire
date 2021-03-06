//
//  HomePageHeadView.m
//  CloudFire
//
//  Created by macos on 2018/1/18.
//  Copyright © 2018年 jbu. All rights reserved.
//

#import "HomePageHeadView.h"
#import "Utils.h"



#import <Masonry.h>

#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_half_width [UIScreen mainScreen].bounds.size.width * 0.5

#define genderImageView_width 20

#define userPortrait_width 80
#define view_userPortrait 0


@implementation HomePageHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setLayout];
    }
    return  self;
}

-(void)setLayout{
    CGFloat viewHeight = CGRectGetHeight(self.frame);
    QuartzCanvasView* drawView = [[QuartzCanvasView alloc]initWithFrame:CGRectMake(0, -64, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)+64)];
    _drawView = drawView;
    _drawView.minimumRoundRadius = userPortrait_width * 0.5 + 30;
    _drawView.openRandomness = NO;
    _drawView.duration = 25;
    //    _drawView.bgColor = [UIColor colorWithHex:0x24CF5F];
    _drawView.gradientColor = (GradientColor){(__bridge CGColorRef)([UIColor colorWithHex:0x24CF5F]), (__bridge CGColorRef)([UIColor colorWithHex:0x20B955])};
    _drawView.strokeColor = [UIColor colorWithHex:0x6FDB94];
    _drawView.offestCenter = (OffestCenter){0, view_userPortrait + 32 + userPortrait_width * 0.5 - viewHeight * 0.5};
    [self addSubview:_drawView];
    
    
    _userPortrait = [UIImageView new];
    _userPortrait.backgroundColor = [UIColor redColor];
    _userPortrait.contentMode = UIViewContentModeScaleAspectFit;
    [_userPortrait setCornerRadius:userPortrait_width * 0.5];
    _userPortrait.userInteractionEnabled= YES;
    [self addSubview:_userPortrait];
    
    _genderImageView = [UIImageView new];
    _genderImageView.contentMode = UIViewContentModeScaleAspectFit;
    _genderImageView.hidden = YES;
    [self addSubview:_genderImageView];
    
    _nameLabel = [UILabel new];
    _nameLabel.font = [UIFont systemFontOfSize:20];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.numberOfLines = 1;
    _nameLabel.textColor =[UIColor colorWithHex:0xFFFFFF];
    [self addSubview:_nameLabel];
    
    _creditLabel = [UILabel new];
    _creditLabel.font = [UIFont systemFontOfSize:13];
    _creditLabel.textAlignment = NSTextAlignmentCenter;
    _creditLabel.numberOfLines = 1;
    _creditLabel.textColor = [UIColor colorWithHex:0xFFFFFF];
    _creditLabel.text = @"积分 0";
    [self addSubview:_creditLabel];
    
    
    UILabel *topLine = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 1)];
    topLine.backgroundColor = [UIColor colorWithHex:0x6FDB94 alpha:0.9];
   // [_buttonView addSubview:topLine];
    
    [self sendSubviewToBack:_drawView];
    [self layoutUI];
    

    
}
- (void)layoutUI{
    [_userPortrait mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(screen_half_width-(userPortrait_width * 0.5));
        make.top.equalTo(self).with.offset(view_userPortrait);
        make.width.and.height.equalTo(@userPortrait_width);
    }];
    
    [_genderImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.bottom.equalTo(self.userPortrait).with.offset(0);
        make.width.and.height.equalTo(@genderImageView_width);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(32);
        make.right.equalTo(self).with.offset(-32);
        make.top.equalTo(self.userPortrait.mas_bottom).with.offset(8);
    }];
    
    [_creditLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(32);
        make.right.equalTo(self).with.offset(-32);
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(10);
    }];
}





@end
