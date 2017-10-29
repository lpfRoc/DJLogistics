//
//  DJGetOrderCell.m
//  DJLogistics
//
//  Created by 段世宜 on 2017/10/19.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJGetOrderCell.h"
#import "NSDate+Extension.h"
#import "ZDBaseRequestManager.h"
#import "Toast.h"
#import "UIViewController+FYCategory.h"
@interface DJGetOrderCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (weak, nonatomic) IBOutlet UILabel *addrLb;
@property (weak, nonatomic) IBOutlet UIImageView *btnImage;
@property (weak, nonatomic) IBOutlet UILabel *orderTimeLb;
@property (weak, nonatomic) IBOutlet UIImageView *statusIm;
@property (weak, nonatomic) IBOutlet UILabel *timeLb;
@property (weak, nonatomic) IBOutlet UILabel *statusLb;
@property (weak, nonatomic) IBOutlet UIButton *orderBtn;
- (IBAction)getOrder:(UIButton *)sender;

@end

@implementation DJGetOrderCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(DJOrderModel *)model{
    if (_model !=model) {
        _model = model;
    }
    
    self.nameLb.text =  [NSString stringWithFormat:@"%@ (%@)",model.store,model.daySeq ];
    self.addrLb.text = model.tp_detail;
    self.orderTimeLb.text = [NSString stringWithFormat:@"下单时间: %@", [model.createtime substringFromIndex:6]];
    self.btnImage.image = [UIImage imageNamed:@"btn_waybill_arrived"];
    NSDate *createDate =  [NSDate getDateWithyyyyMMddHHmmssStr:model.createtime];
   
    self.timeLb.text = [createDate ff_dateDescription];
    self.statusLb.text = @"立即抢单";
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)getOrder:(UIButton *)sender {
    [Toast makeToastActivity];
    [ZDBaseRequestManager POSTJKID:@"grab" parameters:@{@"unique" : self.model.unique} success:^(id responseObject) {
        [Toast hideToastActivity];
        if (self.refreshTableBlock) {
            self.refreshTableBlock(responseObject);
        }
        
        
        
    } failure:^(ZDURLResponseStatusCode errorCode) {
        [Toast hideToastActivity];
        if (self.failureTableBlock) {
            self.failureTableBlock(nil);
        }
    }];
    
}
@end
