//
//  DJWorkViewController.m
//  DJLogistics
//
//  Created by Roc on 2017/9/29.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJWorkViewController.h"
#import "DJMessageCenterViewController.h"
#import "ZDBaseRequestManager.h"
#import "DJMessageDataSource.h"
#import "DJMessageModel.h"
#import "DJMessageDetailViewController.h"
#import "DJWayBillCenterViewController.h"
#import "DJSyOrderListVC.h"
#import "FYLocationManager.h"
@interface DJWorkViewController ()

@property (nonatomic , strong) UILabel *headLb;
@property (nonatomic , strong) UIButton *leftBtn;
@property (nonatomic , strong) UIButton *rioghtBtn;
@property (nonatomic , copy) NSString *servicePhone;

@property (nonatomic , strong) CLLocation *currentLocation;

@property (nonatomic , strong) DJMessageDataSource *messageArr;

//实时上传位置的定时器
@property (nonatomic , strong) NSTimer *timer;

@end

@implementation DJWorkViewController
{
    UIButton *workBtn;
}


-(void)setUpItemBtn
{
    UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"icon_notify"]forState:UIControlStateNormal];
    [leftButton sizeToFit];
    leftButton.exclusiveTouch = YES;
    [leftButton addTarget:self action:@selector(leftBarButtonClick:)
         forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    leftItem.tintColor =[UINavigationBar appearance].barTintColor;
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"icon_contact_kefu"] forState:UIControlStateNormal];
    [button sizeToFit];
    button.exclusiveTouch = YES;
    [button addTarget:self action:@selector(rigntBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    rightItem.tintColor = [UINavigationBar appearance].barTintColor;
    self.navigationItem.rightBarButtonItem = rightItem;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"工作台";
    self.view.backgroundColor = COLOR_BG;
    
//    FYLocationManager *manager = [FYLocationManager shareInstance];
    [self constuctView];
    // Do any additional setup after loading the view.
    [self setUpItemBtn];
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self createData];
}

-(void)startTimer{
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(sendLocationInfoToSever) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}

-(void) stopTImer{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}


-(void)createData{
    [ZDBaseRequestManager POSTJKID:@"getuserinfo" parameters:@{@"phone":DJUser_Info.phone} success:^(id responseObject) {
        
        if ([responseObject[@"code"] integerValue] == 1) {//登陆成功
            
            NSDictionary *result = responseObject[@"result"];
            DJUserModel *userModel = [DJUserModel yy_modelWithDictionary:result];
            //存储用户登录数据
            DJUser_Info = userModel;
            if ([DJUser_Info.status integerValue]==1) {
                [workBtn setTitle:@"送完收工" forState:UIControlStateNormal];
                _leftBtn.hidden=NO;
                _rioghtBtn.hidden =NO;
                [[FYLocationManager shareInstance] start];
                [self startTimer];
            }else{
                [[FYLocationManager shareInstance] stopLocation];
                _leftBtn.hidden=YES;
                _rioghtBtn.hidden =YES;
                [workBtn setTitle:@"上班" forState:UIControlStateNormal];
                [self stopTImer];
            }
            
            [ZDBaseRequestManager POSTJKID:@"notify" parameters:@{@"id":DJUser_Info.ID} success:^(id responseObject) {
                DJLog(@"%@",responseObject);
                if ([responseObject[@"code"] integerValue] == 1) {//退出成功
                    DJMessageDataSource *dataSource = [DJMessageDataSource yy_modelWithJSON:responseObject];
                    NSLog(@"%@",dataSource.result);
                    self.messageArr  = dataSource;
                    self.headLb.text = ((DJMessageModel *)self.messageArr.result[0]).content;
                    
                    [ZDBaseRequestManager POSTJKID:@"getconfig" parameters:nil success:^(id responseObject) {
                        if ([responseObject[@"code"] integerValue] == 1) {//退出成功
                            self.servicePhone = responseObject[@"result"][@"service"];
                        }else
                        {
                            [Toast makeToast:responseObject[@"msg"]];
                        }
                    } failure:^(ZDURLResponseStatusCode errorCode) {
                        
                    }];
                }else
                {
                    [Toast makeToast:responseObject[@"msg"]];
                }
            } failure:^(ZDURLResponseStatusCode errorCode) {
                
            }];
            
        }else
        {
//            _loginView.passWordDescribeLb.text = responseObject[@"msg"];
        }
    } failure:^(ZDURLResponseStatusCode errorCode) {
        
    }];
}




-(void) constuctView{
    
    UIView *v = [[UIView alloc] init];
    v.clipsToBounds  = YES;
    v.layer.borderColor = COLOR_Line_FIrst.CGColor;
    v.backgroundColor = DJRGBAColor(0xbe, 0xd7, 0xd7, 0.1);
    v.layer.cornerRadius = 5;
    v.layer.borderWidth=1;
    [self.view addSubview:v];
    
    [v mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(@15);
        make.right.equalTo(@-15);
        make.height.equalTo(@60);
    }];
    
    self.headLb = [UILabel new];
    self.headLb.textColor = COLOR_BlueDark;
    self.headLb.textAlignment = NSTextAlignmentCenter;
    self.headLb.numberOfLines =2;
    self.headLb.font = [UIFont systemFontOfSize:15];
    
    self.headLb.userInteractionEnabled = YES;
    [v addSubview:self.headLb];
    [self.headLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@15);
        make.top.equalTo(@0);
        make.right.equalTo(@-15);
        make.height.equalTo(@60);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [self.headLb addGestureRecognizer:tap];
    
    UIImageView *im = [UIImageView new];
    im.image = [UIImage imageNamed:@"ic_logo"];
    [self.view addSubview:im];
    [im mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.headLb.mas_bottom).offset(10);
        make.width.equalTo(@75);
        make.height.equalTo(@75);
    }];
    
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.leftBtn setImage:[UIImage imageNamed:@"icon_get_order"] forState:UIControlStateNormal];
    [self.leftBtn addTarget:self action:@selector(getOrder) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.leftBtn];
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@150);
        make.height.equalTo(@150);
        make.top.equalTo(im.mas_bottom).offset(10);
        make.centerX.equalTo(@(-5-75));
    }];
    
    self.rioghtBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rioghtBtn setImage:[UIImage imageNamed:@"icon_today_order"] forState:UIControlStateNormal];
    [self.rioghtBtn addTarget:self action:@selector(todayOrder) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.rioghtBtn];
    [self.rioghtBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@150);
        make.height.equalTo(@150);
        make.top.equalTo(im.mas_bottom).offset(10);
        make.centerX.equalTo(@((5+75)));
    }];
    
    
    
    
    
    workBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    if ([DJUser_Info.status integerValue]==1) {
        [workBtn setTitle:@"送完收工" forState:UIControlStateNormal];
        _leftBtn.hidden=NO;
        _rioghtBtn.hidden =NO;
    }else{
        _leftBtn.hidden=YES;
        _rioghtBtn.hidden =YES;
        [workBtn setTitle:@"上班" forState:UIControlStateNormal];
    }
//    [workBtn setTitle:@"" forState:UIControlStateNormal];
    workBtn.backgroundColor = COLOR_Blue;
    workBtn.layer.cornerRadius = 25 ;
    [workBtn addTarget:self action:@selector(work) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:workBtn];
    
    [workBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@16);
        make.right.equalTo(@-16);
        make.height.equalTo(@50);
        make.bottom.equalTo(@-20);
    }];
}

-(void)getOrder{
    DJSyOrderListVC *vc = [[DJSyOrderListVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)todayOrder{
    DJWayBillCenterViewController *controller = [[DJWayBillCenterViewController alloc] init];
    controller.phone = self.servicePhone;
    [self.navigationController pushViewController:controller animated:YES];
}






-(void)sendLocationInfoToSever{
    CLLocation *locaiton;
    if ([FYLocationManager shareInstance].locationArr.count >0) {
        locaiton = [[FYLocationManager shareInstance].locationArr lastObject];
    }else {
        return;
    }
    if (locaiton == _currentLocation) {
        return;
    }else{
        _currentLocation =locaiton;
    }
    
    
    [ZDBaseRequestManager POSTJKID:@"points" parameters:@{
                                                          @"mid":DJUser_Info.sid,
                                                          @"lng":[NSNumber numberWithDouble:_currentLocation.coordinate.longitude],
                                                          @"lat":[NSNumber numberWithDouble:_currentLocation.coordinate.latitude]
                                                          } success:^(id responseObject) {
                                                              
                                                              
                                                              
                                                              
                                                          } failure:^(ZDURLResponseStatusCode errorCode) {
                                                              
                                                          }];
    
    
    
}






-(void)work{
    if ([DJUser_Info.status integerValue]==1) {
        workBtn.enabled=NO;
        [ZDBaseRequestManager POSTJKID:@"commute" parameters:@{@"id":DJUser_Info.ID,@"status":@"2"} success:^(id responseObject) {
            workBtn.enabled = YES;
            if ([responseObject[@"code"] integerValue] == 1) {
                DJUser_Info.status=@"2";
                DJUserModel *model = DJUser_Info;
                model.status = @"2";
                 [DJContextModel sharedInstance].currentUserInfo = model;
                _leftBtn.hidden=YES;
                _rioghtBtn.hidden =YES;
                [workBtn setTitle:@"上班" forState:UIControlStateNormal];
                [[FYLocationManager shareInstance] stopLocation];
                [self stopTImer];
            }else
            {
                [Toast makeToast:responseObject[@"msg"]];
            }
        } failure:^(ZDURLResponseStatusCode errorCode) {
            workBtn.enabled = YES;
        }];
        
        
    }else{
        workBtn.enabled=NO;
        [ZDBaseRequestManager POSTJKID:@"commute" parameters:@{@"id":DJUser_Info.ID,@"status":@"1"} success:^(id responseObject) {
            workBtn.enabled = YES;
            if ([responseObject[@"code"] integerValue] == 1) {//退出成功
                DJUserModel *model = DJUser_Info;
                model.status = @"1";
                [DJContextModel sharedInstance].currentUserInfo = model;
                
                [workBtn setTitle:@"送完收工" forState:UIControlStateNormal];
                _leftBtn.hidden=NO;
                _rioghtBtn.hidden =NO;
                [[FYLocationManager shareInstance] start];
                [self startTimer];
                
                
            }else
            {
                [Toast makeToast:responseObject[@"msg"]];
            }
           
        } failure:^(ZDURLResponseStatusCode errorCode) {
            workBtn.enabled = YES;
        }];
       
        
    }
}

-(void) tap {
    DJMessageDetailViewController *detailVC = [[DJMessageDetailViewController alloc] init];
    DJMessageModel *model = self.messageArr.result[0];
    detailVC.messageModel = model;
    [self.navigationController pushViewController:detailVC animated:YES];
}






-(void)leftBarButtonClick:(UIButton *)btn
{
    DJMessageCenterViewController *conteroller = [[DJMessageCenterViewController alloc] init];
    [self.navigationController pushViewController:conteroller animated:YES];
}
-(void)rigntBarButtonClick:(UIButton *)btn
{
    if (self.servicePhone) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",self.servicePhone]]];
    }
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
