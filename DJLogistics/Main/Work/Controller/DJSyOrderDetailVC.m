//
//  DJSyOrderDetailVC.m
//  DJLogistics
//
//  Created by 段世宜 on 2017/10/29.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJSyOrderDetailVC.h"
#import "DJMerchantInfoCell.h"
#import "DJOrderInfoCell.h"
#import "DJCustomInfoCell.h"
@interface DJSyOrderDetailVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *tableView;

@end

@implementation DJSyOrderDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"运单详情";
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
    self.tableView.backgroundColor =COLOR_BG;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[DJMerchantInfoCell class] forCellReuseIdentifier:@"DJMerchantInfoCell"];
     [self.tableView registerClass:[DJOrderInfoCell class] forCellReuseIdentifier:@"DJOrderInfoCell"];
     [self.tableView registerClass:[DJCustomInfoCell class] forCellReuseIdentifier:@"DJCustomInfoCell"];
    [self.view addSubview:self.tableView];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(changeStatus:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = COLOR_Blue;
    [btn setTitle:@"确认到店" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(btn.mas_top).offset(0);
    }];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@45);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];if ([_model.status integerValue] ==0) {
        [btn setTitle:@"确认到店" forState:UIControlStateNormal];
    }else if ([_model.status integerValue] ==1) {
        [btn setTitle:@"完成取餐" forState:UIControlStateNormal];
    }else if ([_model.status integerValue] ==2) {
        [btn setTitle:@"确认送达" forState:UIControlStateNormal];
    }else if ([_model.status integerValue] ==3) {
           [btn setTitle:@"订单完成" forState:UIControlStateNormal];
    }else{
    }
    
}
-(void)changeStatus:(UIButton *)sender{
    if ([_model.status integerValue] ==0) {
        [ZDBaseRequestManager POSTJKID:@"arrived" parameters:@{
                                                               @"unique":_model.unique
                                                               } success:^(id responseObject) {
                                                                   [sender setTitle:@"完成取餐" forState:UIControlStateNormal];
//                                                                   self.im.image = [UIImage imageNamed:@"btn_waybill_get"];
//                                                                   self.statusLb.text = @"";
                                                                   self.model.status =@"1";
                                                                   
                                                                   
                                                               } failure:^(ZDURLResponseStatusCode errorCode) {
                                                                   
                                                               }];
    }else if ([_model.status integerValue] ==1) {
        [ZDBaseRequestManager POSTJKID:@"get" parameters:@{
                                                           @"unique":_model.unique
                                                           } success:^(id responseObject) {
                                                               [sender setTitle:@"确认送达" forState:UIControlStateNormal];
                                                               self.model.status =@"2";
                                                               
                                                               
                                                           } failure:^(ZDURLResponseStatusCode errorCode) {
                                                               
                                                           }];
    }else if ([_model.status integerValue] ==2) {
        [ZDBaseRequestManager POSTJKID:@"finish" parameters:@{
                                                              @"unique":_model.unique
                                                              } success:^(id responseObject) {
                                                                  [sender setTitle:@"订单完成" forState:UIControlStateNormal];
                                                                  self.model.status =@"3";
                                                                  
                                                                  
                                                              } failure:^(ZDURLResponseStatusCode errorCode) {
                                                                  
                                                              }];
    }else{
    }
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
        {
            DJMerchantInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DJMerchantInfoCell" forIndexPath:indexPath];
            [cell setModel:self.model];
            
            return cell;
        }
            break;
        case 1:
        {
            DJOrderInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DJOrderInfoCell" forIndexPath:indexPath];
            [cell setModel:self.model];
            
            return cell;
        }
            break;
        case 2:
        {
            DJCustomInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DJCustomInfoCell" forIndexPath:indexPath];
            [cell setCustomInfoCellTpe:DJCustomInfoCellTypeBtn];
            [cell setModel:self.model];
            
            return cell;
            
        }
            break;
    }
    return nil;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.section) {
        case 0:
            return AUTO_SIZE(112);
            break;
        case 1:
        {
            NSData *data = [_model.order_detail dataUsingEncoding:(NSUTF8StringEncoding)];
            NSArray *dicArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            return AUTO_SIZE(150+dicArr.count*20);
            
        }
            break;
        case 2:
        {
            if ( 1 ) {
                return AUTO_SIZE(205);
            }else
            {
                return AUTO_SIZE(162);
            }
        }
            break;
    }
    return AUTO_SIZE(100);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
