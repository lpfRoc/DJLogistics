//
//  DJWayBillIngCell.m
//  DJLogistics
//
//  Created by 段世宜 on 2017/10/21.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJWayBillIngCell.h"
#import <AMapNaviKit/AMapNaviKit.h>
#import "NSDate+Extension.h"
#import "FYLocationManager.h"
@interface DJWayBillIngCell ()
@property (weak, nonatomic) IBOutlet UILabel *nameLb;
@property (weak, nonatomic) IBOutlet UILabel *addrLb;
@property (weak, nonatomic) IBOutlet UILabel *sourceLb;
@property (weak, nonatomic) IBOutlet UILabel *retimeLb;
@property (weak, nonatomic) IBOutlet UIImageView *im;
@property (weak, nonatomic) IBOutlet UILabel *timeLb;
@property (weak, nonatomic) IBOutlet UILabel *statusLb;
@property (weak, nonatomic) IBOutlet UIButton *phoneBtn;
@property (weak, nonatomic) IBOutlet UIButton *message;
@property (weak, nonatomic) IBOutlet UIButton *gpsBtn;
- (IBAction)telPhone:(id)sender;
- (IBAction)senmessage:(id)sender;
- (IBAction)gpsLocation:(id)sender;
- (IBAction)statusChange:(id)sender;

@property (nonatomic , strong) AMapNaviCompositeManager *compositeManager;


@end


@implementation DJWayBillIngCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(DJMineWayBillModel *)model{
    if (_model != model) {
        _model = model;
    }
    self.nameLb.text = model.store;
    self.addrLb.text = model.tp_detail;
    self.sourceLb.text = model.platform;
    self.retimeLb.text = [NSString stringWithFormat:@"下单时间: %@",model.createtime];
    NSDate *delivery = [NSDate  getDateWithyyyyMMddHHmmssStr:model.deliveryTime];
    NSTimeInterval time = [delivery timeIntervalSinceDate:[NSDate date]];
    if ([model.status integerValue] ==1) {
        self.im.image = [UIImage imageNamed:@"btn_waybill_arrived"];
        self.statusLb.text = @"确认到店";
        if (time<0) {
            self.timeLb.text = [NSString stringWithFormat:@"已超时%d分钟",(int)(-time)/60];
        }else{
            self.timeLb.text = [NSString stringWithFormat:@"%d分钟后超时",(int)(time)/60];
        }
        
    }else if ([model.status integerValue] ==2) {
        self.im.image = [UIImage imageNamed:@"btn_waybill_get"];
        self.statusLb.text = @"完成取餐";
        if (time<0) {
            self.timeLb.text = [NSString stringWithFormat:@"已超时%d分钟",(int)(-time)/60];
        }else{
            self.timeLb.text = [NSString stringWithFormat:@"%d分钟后超时",(int)(time)/60];
        }
    }else if ([model.status integerValue] ==3) {
        self.im.image = [UIImage imageNamed:@"btn_waybill_finish"];
        self.statusLb.text = @"确认送达";
        if (time<0) {
            self.timeLb.text = [NSString stringWithFormat:@"已超时%d分钟",(int)(-time)/60];
        }else{
            self.timeLb.text = [NSString stringWithFormat:@"%d分钟后超时",(int)(time)/60];
        }
    }else{
        self.im.image = [UIImage imageNamed:@"btn_waybill_finish"];
        self.statusLb.text = @"已送达";
        if (time<0) {
            self.timeLb.text = [NSString stringWithFormat:@"已超时%d分钟",(int)(-time)/60];
        }else{
            self.timeLb.text = [NSString stringWithFormat:@"%d分钟后超时",(int)(time)/60];
        }
    }
    
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (IBAction)telPhone:(id)sender {
     [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel://%@",_model.tp_phone] ]];
}

- (IBAction)senmessage:(id)sender {
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:[NSString stringWithFormat:@"sms://%@",_model.tp_phone] ]];
}

- (IBAction)gpsLocation:(id)sender {
    // 初始化
    self.compositeManager = [[AMapNaviCompositeManager alloc] init];
    // 如果需要使用AMapNaviCompositeManagerDelegate的相关回调（如自定义语音、获取实时位置等），需要设置delegate
//    self.compositeManager.delegate = self;
    // 通过present的方式显示路线规划页面, 在不传入起终点启动导航组件的模式下，options需传入nil
    AMapNaviCompositeUserConfig *config = [[AMapNaviCompositeUserConfig alloc] init];
    //传入起点，并且带高德POIId
    [config setRoutePlanPOIType:AMapNaviRoutePlanPOITypeStart location:[AMapNaviPoint locationWithLatitude:[FYLocationManager shareInstance].latitude longitude:[FYLocationManager shareInstance].lontitue] name:@"我的位置" POIId:nil];
    //传入终点，并且带高德POIId
    [config setRoutePlanPOIType:AMapNaviRoutePlanPOITypeEnd location:[AMapNaviPoint locationWithLatitude:[self.model.lat doubleValue] longitude:[self.model.lng doubleValue]] name:self.model.tp_detail POIId:nil];
    //启动
    [self.compositeManager presentRoutePlanViewControllerWithOptions:nil];
    
    
}

- (IBAction)statusChange:(id)sender {
    if ([_model.status integerValue] ==1) {
        [ZDBaseRequestManager POSTJKID:@"arrived" parameters:@{
                                                              @"unique":_model.unique
                                                              } success:^(id responseObject) {
                                                                  self.im.image = [UIImage imageNamed:@"btn_waybill_get"];
                                                                  self.statusLb.text = @"完成取餐";
                                                                  self.model.status =@"2";
                                                              } failure:^(ZDURLResponseStatusCode errorCode) {
                                                                  
                                                              }];
    }else if ([_model.status integerValue] ==2) {
        [ZDBaseRequestManager POSTJKID:@"get" parameters:@{
                                                               @"unique":_model.unique
                                                               } success:^(id responseObject) {
                                                                   self.im.image = [UIImage imageNamed:@"btn_waybill_finish"];
                                                                   self.statusLb.text = @"确认送达";
                                                                   self.model.status =@"3";
                                                                   
                                                                   
                                                               } failure:^(ZDURLResponseStatusCode errorCode) {
                                                                   
                                                               }];
    }else if ([_model.status integerValue] ==3) {
        [ZDBaseRequestManager POSTJKID:@"finish" parameters:@{
                                                               @"unique":_model.unique
                                                               } success:^(id responseObject) {
                                                                   self.im.image = [UIImage imageNamed:@"btn_waybill_finish"];
                                                                   self.statusLb.text = @"订单完成";
                                                                   self.model.status =@"4";
                                                                   
                                                                   
                                                               } failure:^(ZDURLResponseStatusCode errorCode) {
                                                                   
                                                               }];
    }else{
        self.im.image = [UIImage imageNamed:@"btn_waybill_finish"];
        self.statusLb.text = @"订单完成";
    }
}
@end
