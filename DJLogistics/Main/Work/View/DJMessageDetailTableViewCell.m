//
//  DJMessageDetailTableViewCell.m
//  DJLogistics
//
//  Created by Roc on 2017/10/13.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJMessageDetailTableViewCell.h"
#import "DJMessageModel.h"
@implementation DJMessageDetailTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = COLOR_W;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        NSArray *viewArray = @[self.messageTitleLb, self.timeLb, self.messageContentLb];
        for (UIView *view in viewArray) {
            [self.contentView addSubview:view];
        }
        [self autoLayout];
        
        
    }
    return self;
}
#pragma mark - lazy

- (UILabel *)messageTitleLb
{
    if (_messageTitleLb == nil) {
        _messageTitleLb = [[UILabel alloc] init];
        _messageTitleLb.font = FONT_SIZE(15);
        _messageTitleLb.textAlignment = NSTextAlignmentCenter;
        _messageTitleLb.textColor = COLOR_FontTitle;
    }
    return _messageTitleLb;
}

- (UILabel *)timeLb
{
    if (_timeLb == nil) {
        _timeLb = [[UILabel alloc] init];
        _timeLb.font = FONT_SIZE(10);
        _timeLb.textAlignment = NSTextAlignmentRight;
        _timeLb.textColor = COLOR_FontText;
    }
    return _timeLb;
}

- (UILabel *)messageContentLb
{
    if (_messageContentLb == nil) {
        _messageContentLb = [[UILabel alloc] init];
        _messageContentLb.font = FONT_SIZE(14);
        _messageContentLb.numberOfLines = 0;
        _messageContentLb.textAlignment = NSTextAlignmentLeft;
        _messageContentLb.textColor = COLOR_FontText;
        
    }
    return _messageContentLb;
}

#pragma mark - autoLayout
- (void)autoLayout
{
    [_messageTitleLb mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView.mas_top).with.offset(AUTO_SIZE(20));
        make.centerX.equalTo(self.contentView.mas_centerX);
    }];
    

    [_messageContentLb mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_messageTitleLb.mas_bottom).with.offset(AUTO_SIZE(15));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(20));
        make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-20));
        
    }];
    
    [_timeLb mas_makeConstraints:^(MASConstraintMaker *make){
        make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-20));
        make.top.equalTo(_messageContentLb.mas_bottom).with.offset(AUTO_SIZE(20));
    }];
    
}

-(void)setMessageModel:(DJMessageModel *)messageModel
{
    _messageModel = messageModel;
    self.messageTitleLb.text = messageModel.title;
    self.timeLb.text = messageModel.createtime;
    self.messageContentLb.text =messageModel.content;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
