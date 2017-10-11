//
//  DJMineFooterCollectionViewCell.m
//  DJLogistics
//
//  Created by Roc on 2017/10/9.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJMineFooterCollectionViewCell.h"

@implementation DJMineFooterCollectionViewCell
#pragma mark - lazy

- (UILabel *)titleLb
{
    if (_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = AUTO_FONT_SIZE(16);
        _titleLb.textAlignment = NSTextAlignmentCenter;
        _titleLb.textColor = COLOR_FontTitle;
        
    }
    return _titleLb;
}
- (UILabel *)contentLb
{
    if (_contentLb == nil) {
        _contentLb = [[UILabel alloc] init];
        _contentLb.font = AUTO_FONT_SIZE(18);
        _contentLb.textAlignment = NSTextAlignmentCenter;
        _contentLb.textColor = COLOR_Blue;
        
    }
    return _contentLb;
}
- (void)autoLayout
{
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).with.offset(AUTO_SIZE(15));
    }];
    
    [_contentLb mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.equalTo(self.mas_bottom).with.offset(AUTO_SIZE(-15));
    }];
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.backgroundColor = COLOR_W;
    if (self) {
        [self initSubView];
    }
    return self;
}

- (void)initSubView
{
    NSArray *viewArray = @[
                           self.titleLb,
                           self.contentLb
                           ];
    for (UIView *view in viewArray) {
        [self addSubview:view];
    }
    [self autoLayout];
}
-(void)setModeDic:(NSDictionary *)modeDic
{
    _modeDic = modeDic;
    
    _titleLb.text = modeDic[@"title"];
    _titleLb.textColor = modeDic[@"titleColor"];

    _contentLb.text = modeDic[@"content"];
    _contentLb.textColor = modeDic[@"contentColor"];

}
@end
