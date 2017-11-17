//
//  DJMessageCenterViewController.m
//  DJLogistics
//
//  Created by Roc on 2017/10/12.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJMessageCenterViewController.h"
#import "DJMessageCenterTableView.h"
#import "DJMessageDataSource.h"
@interface DJMessageCenterViewController ()
/** tableview */
@property (nonatomic,strong) DJMessageCenterTableView *messageCenterTableView;
@end

@implementation DJMessageCenterViewController
- (DJMessageCenterTableView *)messageCenterTableView
{
    if (_messageCenterTableView == nil) {
        
        _messageCenterTableView = [[DJMessageCenterTableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _messageCenterTableView.rootVC = self;
    }
    return _messageCenterTableView;
}
#pragma mark - autoLayout
- (void)autoLayout
{
    [_messageCenterTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.right.equalTo(self.view);
    }];
}
- (void)setUpNavItem
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 30, 30);
    [button setTitle:@"忽略未读" forState:(UIControlStateNormal)];
    button.titleLabel.font = FONT_SIZE(14);
    [button sizeToFit];
    [button setTitleColor:COLOR_W forState:(UIControlStateNormal)];
    [button addTarget:self action:@selector(ignoreMessage) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = rightItem;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"消息中心";
    [self setUpNavItem];
    [self.view addSubview:self.messageCenterTableView];
    [self autoLayout];
    [self requestData];
}
-(void)requestData
{
    [ZDBaseRequestManager POSTJKID:@"notify" parameters:@{@"id":DJUser_Info.ID} success:^(id responseObject) {
        DJLog(@"%@",responseObject);
        if ([responseObject[@"code"] integerValue] == 1) {//退出成功
            DJMessageDataSource *dataSource = [DJMessageDataSource yy_modelWithJSON:responseObject];
            DJLog(@"%@",dataSource.result);
            _messageCenterTableView.messageModelArr = dataSource.result;
            [_messageCenterTableView reloadData];
        }else
        {
            [Toast makeToast:responseObject[@"msg"]];
        }
    } failure:^(ZDURLResponseStatusCode errorCode) {
        
    }];
}
-(void)ignoreMessage
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
