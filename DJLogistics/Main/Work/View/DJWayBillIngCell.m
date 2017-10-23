//
//  DJWayBillIngCell.m
//  DJLogistics
//
//  Created by 段世宜 on 2017/10/21.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJWayBillIngCell.h"

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


@end


@implementation DJWayBillIngCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)telPhone:(id)sender {
}

- (IBAction)senmessage:(id)sender {
}

- (IBAction)gpsLocation:(id)sender {
}

- (IBAction)statusChange:(id)sender {
}
@end
