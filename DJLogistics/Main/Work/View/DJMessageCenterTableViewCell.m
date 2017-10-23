//
//  DJMessageCenterTableViewCell.m
//  DJLogistics
//
//  Created by Roc on 2017/10/12.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJMessageCenterTableViewCell.h"
#import "DJMessageModel.h"
#import "DJUtilities.h"
@implementation DJMessageCenterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = COLOR_W;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        NSArray *viewArray = @[self.noticeTitleLb, self.redDot, self.noticeContentLb,self.timeLb];
        for (UIView *view in viewArray) {
            [self.contentView addSubview:view];
        }
        [self autoLayout];
    }
    return self;
}
#pragma mark - lazy
- (UIImageView *)redDot
{
    if (_redDot == nil) {
        
        _redDot = [[UIImageView alloc] init];
        _redDot.backgroundColor = [UIColor redColor];
        _redDot.layer.cornerRadius = 3;
        _redDot.layer.masksToBounds = YES;
    }
    return _redDot;
}

- (UILabel *)noticeTitleLb
{
    if (_noticeTitleLb == nil) {
        _noticeTitleLb = [[UILabel alloc] init];
        _noticeTitleLb.font = FONT_SIZE(15);
        _noticeTitleLb.textAlignment = NSTextAlignmentLeft;
        _noticeTitleLb.textColor = COLOR_FontTitle;
    }
    return _noticeTitleLb;
}

- (UILabel *)noticeContentLb
{
    if (_noticeContentLb == nil) {
        _noticeContentLb = [[UILabel alloc] init];
        _noticeContentLb.font = FONT_SIZE(13);
        _noticeContentLb.numberOfLines = 2;
        _noticeContentLb.textAlignment = NSTextAlignmentLeft;
        _noticeContentLb.textColor = COLOR_FontText;
    }
    return _noticeContentLb;
}
- (UILabel *)timeLb
{
    if (_timeLb == nil) {
        
        _timeLb = [[UILabel alloc] init];
        _timeLb.font = FONT_SIZE(11);
        _timeLb.textAlignment = NSTextAlignmentRight;
        _timeLb.textColor = COLOR_FontText;
    }
    return _timeLb;
}
#pragma mark - autoLayout
- (void)autoLayout
{
    [_redDot mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView.mas_top).with.offset(AUTO_SIZE(20));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
        make.size.mas_equalTo(CGSizeMake(6, 6));
    }];
    
    [_noticeTitleLb mas_makeConstraints:^(MASConstraintMaker *make){
        make.centerY.equalTo(_redDot.mas_centerY);
        make.left.equalTo(_redDot.mas_right).with.offset(AUTO_SIZE(3));
    }];
        
    [_noticeContentLb mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_noticeTitleLb.mas_bottom).with.offset(AUTO_SIZE(10));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
        make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-15));
        
    }];
    
    [_timeLb mas_makeConstraints:^(MASConstraintMaker *make){
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(AUTO_SIZE(-15));
        make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-15));
        
    }];
}
+(CGFloat)getRemarkCellHeightByModel:(DJMessageModel *)model
{
    CGFloat titleLabelH = 15;
    CGFloat timeLbH = 10;
    CGFloat topSpace = AUTO_SIZE(15);
    CGFloat midSpace = AUTO_SIZE(15);
    CGFloat bottomSpace = AUTO_SIZE(10);
    CGFloat timeLbTopSpace = AUTO_SIZE(15);

    CGFloat contentLabelH = [DJUtilities getStrLenByFontStyle:model.content fontStyle:FONT_SIZE(13) textWidth:UI_SCREEN_WIDTH - AUTO_SIZE(30)].height;
    return contentLabelH + titleLabelH + topSpace + midSpace +bottomSpace+timeLbH+timeLbTopSpace;
}

-(void)setMessageModel:(DJMessageModel *)messageModel
{
    _messageModel = messageModel;
    _noticeTitleLb.text = [messageModel.title stringByAppendingString:@">>"];
    _timeLb.text = messageModel.createtime;
    _noticeContentLb.text = messageModel.content;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
