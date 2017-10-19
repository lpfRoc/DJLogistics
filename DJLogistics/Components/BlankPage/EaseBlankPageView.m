//
//  EaseBlankPageView.m
//  XDSThirdParty
//
//  Created by Hmily on 2016/12/15.
//  Copyright © 2016年 Hmily. All rights reserved.
//

#import "EaseBlankPageView.h"
@implementation EaseBlankPageView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)configWithType:(EaseBlankPageType)blankPageType
               hasData:(BOOL)hasData
              hasError:(BOOL)hasError
               offsetY:(CGFloat)offsetY
     reloadButtonBlock:(void (^)(id))reloadButtonBlock
      clickButtonBlock:(void (^)(EaseBlankPageType))clickButtonBlock{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (_loadAndShowStatusBlock) {
            _loadAndShowStatusBlock();
        }
    });
    
    
    if (hasData) {
        [self removeFromSuperview];
        return;
    }
    self.alpha = 1.0;
    //    图片
    if (!_monkeyView) {
        _monkeyView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self addSubview:_monkeyView];
    }
    //    文字
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _tipLabel.backgroundColor = [UIColor clearColor];
        _tipLabel.numberOfLines = 0;
        _tipLabel.font = [UIFont systemFontOfSize:16];
        _tipLabel.textColor = COLOR_FontText;
        _tipLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_tipLabel];
    }
    
    //    布局
    [_monkeyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        if (ABS(offsetY) > 1.0) {
            make.top.equalTo(self).offset(offsetY);
        }else{
            make.bottom.equalTo(self.mas_centerY);
        }
    }];
    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerX.equalTo(self).with.offset(20);
        make.right.centerX.equalTo(self).with.offset(-20);
        make.top.equalTo(_monkeyView.mas_bottom).offset(20);
    }];
    
    _reloadButtonBlock = nil;
    if (hasError) {
        //        加载失败
        if (!_reloadButton) {
            _reloadButton = [[UIButton alloc] initWithFrame:CGRectZero];
            [_reloadButton setImage:[UIImage imageNamed:@"blankpage_button_reload"] forState:UIControlStateNormal];
            _reloadButton.adjustsImageWhenHighlighted = YES;
            [_reloadButton addTarget:self action:@selector(reloadButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_reloadButton];
            [_reloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self);
                make.top.equalTo(_tipLabel.mas_bottom);
                make.size.mas_equalTo(CGSizeMake(160, 60));
            }];
        }
        _reloadButton.hidden = NO;
        _reloadButtonBlock = reloadButtonBlock;
        [_monkeyView setImage:[UIImage imageNamed:@"blankpage_image_loadFail"]];
        _tipLabel.text = @"貌似出了点差错\n真忧伤呢";
    }else{
        //        空白数据
        if (_reloadButton) {
            _reloadButton.hidden = YES;
        }
        
        NSString *imageName, *tipStr;
        _curType=blankPageType;
        switch (blankPageType) {
            case EaseBlankPageTypeViewMessageList:{//消息列表
                imageName = @"icon_blank";
                tipStr = @" 暂无数据";
            }
                break;
                
            case EaseBlankPageTypeOrderCenter:{
                imageName = @"icon_blank";
                tipStr = @"没有新的订单";
            }
                break;
            case EaseBlankPageTypeWaybillCenter:{
                imageName = @"icon_blank";
                tipStr = @"运单空空如也～";
            }
                break;
            case EaseBlankPageTypeBank_SEARCH:{
                imageName = @"blankpage_image_Sleep";
                tipStr = @"什么都木有搜到，换个词再试试？";
            }
                break;
            default:{//其它页面（这里没有提到的页面，都属于其它）
                imageName = @"blankpage_image_Sleep";
                tipStr = @"这里还什么都没有\n赶快起来弄出一点动静吧";
            }
                break;
        }
        [_monkeyView setImage:[UIImage imageNamed:imageName]];
        _tipLabel.text = tipStr;
        
        if ((blankPageType>=EaseBlankPageTypeViewMessageList)&&(blankPageType<=EaseBlankPageTypeBank_SEARCH)) {
            [_monkeyView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self);
                make.bottom.equalTo(self.mas_centerY).offset(-50);
            }];
            
            //新增按钮
            UIButton *actionBtn=({
                UIButton *button=[UIButton new];
                button.backgroundColor=COLOR_BlueDark;
                button.titleLabel.font=[UIFont systemFontOfSize:14];
                button.layer.cornerRadius = 5;
                button.layer.masksToBounds = YES;
                [button addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
                [button setTitleColor:COLOR_W forState:(UIControlStateNormal)];
                button;
            });
            [self addSubview:actionBtn];
            
            [actionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(100 , 32));
                make.top.equalTo(_tipLabel.mas_bottom).offset(35);
                make.centerX.equalTo(self);
            }];
            
            NSString *titleStr;
            switch (blankPageType) {
                case EaseBlankPageTypeOrderCenter:{
                    titleStr=@"";
                    actionBtn.hidden = YES;

                }
                    break;
              
                case EaseBlankPageTypeWaybillCenter:{
                    titleStr=@"去运单添加";
                    actionBtn.hidden = NO;

                }
                    break;
                default:
                    break;
            }
            _clickButtonBlock = nil;
            _clickButtonBlock = clickButtonBlock;
            [actionBtn setTitle:titleStr forState:UIControlStateNormal];
            
        }
    }
}

- (void)reloadButtonClicked:(id)sender{
    self.hidden = YES;
    [self removeFromSuperview];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (_reloadButtonBlock) {
            _reloadButtonBlock(sender);
        }
    });
}

-(void)btnAction{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (_clickButtonBlock) {
            _clickButtonBlock(_curType);
        }
    });
}

@end
