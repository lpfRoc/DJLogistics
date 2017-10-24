//
//  DJOrderInfoCell.m
//  DJLogistics
//
//  Created by Roc on 2017/10/11.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJOrderInfoCell.h"
#import "DJFoodBillModel.h"
@implementation DJOrderInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
#pragma mark - 界面初始化
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = COLOR_W;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initSubViews];
    }
    return self;
}
#pragma mark - lazy

- (UILabel *)orderTitle
{
    if (_orderTitle == nil) {
        _orderTitle = [[UILabel alloc] init];
        _orderTitle.font = AUTO_FONT_SIZE(14);
        _orderTitle.textAlignment = NSTextAlignmentLeft;
        _orderTitle.textColor = COLOR_FontTitle;
        _orderTitle.text =@"订单信息";
    }
    return _orderTitle;
}

- (UIImageView *)devideLine
{
    if (_devideLine == nil) {
        _devideLine = [[UIImageView alloc] init];
        _devideLine.backgroundColor = COLOR_Line;
    }
    return _devideLine;
}
- (UILabel *)menuLabel
{
    if (_menuLabel == nil) {
        _menuLabel = [[UILabel alloc] init];
        _menuLabel.font = AUTO_FONT_SIZE(14);
        _menuLabel.textAlignment = NSTextAlignmentLeft;
        _menuLabel.textColor = COLOR_FontText;
        _menuLabel.numberOfLines = 0;
        NSString *str = @"豆腐\n馒头\n肌肉\n腊肉 \n哇哈哈";
        NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:str];
        NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineSpacing:5];
        [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
        _menuLabel.attributedText = attributedString;
    }
    return _menuLabel;
}

- (UILabel *)moneyLabel
{
    if (_moneyLabel == nil) {
        _moneyLabel = [[UILabel alloc] init];
        _moneyLabel.font = AUTO_FONT_SIZE(14);
        _moneyLabel.textAlignment = NSTextAlignmentCenter;
        _moneyLabel.textColor = COLOR_FontText;
        _moneyLabel.numberOfLines = 0;
        _moneyLabel.text = @"合计：22220元";
    }
    return _moneyLabel;
}
- (UILabel *)remarkLabel
{
    if (_remarkLabel == nil) {
        _remarkLabel = [[UILabel alloc] init];
        _remarkLabel.font = AUTO_FONT_SIZE(14);
        _remarkLabel.textAlignment = NSTextAlignmentCenter;
        _remarkLabel.textColor = COLOR_FontText;
        _remarkLabel.numberOfLines = 0;
        _remarkLabel.text = @"备注：的点点滴滴";
    }
    return _remarkLabel;
}
- (UILabel *)platformLabel
{
    if (_platformLabel== nil) {
        _platformLabel = [[UILabel alloc] init];
        _platformLabel.font = AUTO_FONT_SIZE(14);
        _platformLabel.textAlignment = NSTextAlignmentCenter;
        _platformLabel.textColor = COLOR_FontText;
        _platformLabel.numberOfLines = 0;
        _platformLabel.text = @"平台：饿了么";
    }
    return _platformLabel;
}
- (void)initSubViews
{
    NSArray *viewArray = @[self.orderTitle,self.devideLine,self.menuLabel,self.moneyLabel,self.remarkLabel,self.platformLabel];
    for (UIView *view in viewArray) {
        [self.contentView addSubview:view];
    }
    [self autoLayout];
}
- (void)autoLayout
{
    [_orderTitle mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(self.contentView.mas_top).with.offset(AUTO_SIZE(15));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
    }];
    
    [_devideLine mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_orderTitle.mas_bottom).with.offset(AUTO_SIZE(15));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
        make.right.equalTo(self.contentView.mas_right).with.offset(AUTO_SIZE(-15));
        make.height.equalTo(@(ISRetina_Min_Line));
    }];
    
    [_menuLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_devideLine.mas_bottom).with.offset(AUTO_SIZE(10));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
    }];
    
    [_moneyLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_menuLabel.mas_bottom).with.offset(AUTO_SIZE(10));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
    }];
    [_remarkLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_moneyLabel.mas_bottom).with.offset(AUTO_SIZE(5));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
    }];
    [_platformLabel mas_makeConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(_remarkLabel.mas_bottom).with.offset(AUTO_SIZE(5));
        make.left.equalTo(self.contentView.mas_left).with.offset(AUTO_SIZE(15));
    }];
    
}
-(void)setModel:(DJMineWayBillModel *)model
{
    _model = model;
    NSData *data = [model.order_detail dataUsingEncoding:(NSUTF8StringEncoding)];
    NSArray *dicArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];

    NSMutableArray*modelArr = [NSMutableArray array];
    NSString *str = @"";

    if ([dicArr[0] isKindOfClass:[NSString class]]) {
        for (NSString *string in dicArr) {
        str =  [str stringByAppendingString:[NSString stringWithFormat:@"%@\n",string]];
        }
    }else
    {
        for (NSDictionary *dic in dicArr) {
            DJFoodBillModel *model = [[DJFoodBillModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [modelArr addObject:model];
        }
        for (DJFoodBillModel *model in modelArr) {
            str =  [str stringByAppendingString:[NSString stringWithFormat:@"%@  %@%@\n",model.food_name,model.quantity,model.unit]];
        }
    }


    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [str length])];
    _menuLabel.attributedText = attributedString;
    
    _moneyLabel.text = [NSString stringWithFormat:@"合计：%@元",model.order_total?model.order_total:@""];
    _remarkLabel.text = model.order_caution.length ? [NSString stringWithFormat:@"备注：%@",model.order_caution]:@"";
    _platformLabel.text = [NSString stringWithFormat:@"平台：%@",model.platform];

    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
