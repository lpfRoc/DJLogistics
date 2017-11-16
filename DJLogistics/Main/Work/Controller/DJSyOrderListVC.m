//
//  DJSyOrderListVC.m
//  DJLogistics
//
//  Created by 段世宜 on 2017/10/15.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJSyOrderListVC.h"
#import "DJGetOrderCell.h"
#import "DJSpaceCell.h"
#import "ZDBaseRequestManager.h"
#import "DJOrderModel.h"
#import "DJWorkViewController.h"
#import <MJRefresh/MJRefresh.h>



@interface DJSyOrderListVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) NSMutableArray *dataArr;

@property (nonatomic , strong) NSTimer *refreshTimer;

@end

@implementation DJSyOrderListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.navigationItem.title = @"我的订单";
    UIView *view = [UIView new];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view.mas_centerY).offset(-50);
        make.width.equalTo(@110);
        make.height.equalTo(@170);
    }];
    
    UIImageView *im = [UIImageView new];
    im.image = [UIImage imageNamed:@"ic_order_empty"];
    [view addSubview:im];
    [im mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view);
        make.width.equalTo(@100);
        make.height.equalTo(@107);
        make.top.equalTo(@0);
    }];
    
    UILabel *lb =[UILabel new];
    lb.textColor = color_808080;
    lb.font = [UIFont systemFontOfSize:16];
    lb.textAlignment = NSTextAlignmentCenter;
    lb.text = @"没有新的订单";
    [view addSubview:lb];
    [lb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(view);
        make.left.equalTo(view);
        make.top.equalTo(im.mas_bottom).offset(15);
        make.height.equalTo(@15);
    }];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    btn.backgroundColor = COLOR_BlueDark;
    btn.layer.cornerRadius =5;
    [btn setTitle:@"点击刷新" forState:UIControlStateNormal];
    [btn setTitleColor:COLOR_W forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@25);
        make.width.equalTo(@100);
        make.centerX.equalTo(view);
        make.bottom.equalTo(view);
    }];
    self.dataArr = [NSMutableArray new];
    [self.tableView registerNib:[UINib nibWithNibName:@"DJSpaceCell" bundle:nil] forCellReuseIdentifier:@"DJSpaceCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"DJGetOrderCell" bundle:nil] forCellReuseIdentifier:@"DJGetOrderCell"];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.top.equalTo(self.view);
    }];
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self constructData];
    }];
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UI_SCREEN_WIDTH, 10)];
    headView.backgroundColor = COLOR_BG;
    self.tableView.tableHeaderView = headView;
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 9.5, UI_SCREEN_WIDTH, 0.5)];
    line.backgroundColor = COLOR_Line;
    [headView addSubview:line];
    _refreshTimer = [NSTimer scheduledTimerWithTimeInterval:60 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self constructData];
    }];
    [[NSRunLoop currentRunLoop] addTimer:_refreshTimer forMode:NSRunLoopCommonModes];
    
}
-(void)dealloc {
    [_refreshTimer invalidate];
    _refreshTimer = nil;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self constructData];
}

-(void)refreshData{
     [Toast makeToastActivity];
    [self constructData];
}

-(void)constructData{
    [ZDBaseRequestManager POSTJKID:@"order" parameters:@{@"sid":DJUser_Info.sid} success:^(id responseObject) {
        [self.tableView.mj_header endRefreshing];
        if ([responseObject[@"code"] integerValue] == 1) {//登陆成功
            [self.dataArr removeAllObjects];
            [Toast hideToastActivity];
            id result = responseObject[@"result"];
            if (![result isKindOfClass:[NSArray class]] || [result count]==0) {
                self.tableView.hidden=YES;
            }else{
                self.tableView.hidden= NO;
                for (NSDictionary *dic in result) {
                    DJOrderModel *model = [[DJOrderModel alloc]init];
                    [model setValuesForKeysWithDictionary:dic];
                    [_dataArr addObject:model];
                }
                [_tableView reloadData];
            }
        }else{
            self.tableView.hidden=YES;
            [Toast makeToast:responseObject[@"msg"]];
        }
     } failure:^(ZDURLResponseStatusCode errorCode) {
         [self.tableView.mj_header endRefreshing];
         [Toast hideToastActivity];
         self.tableView.hidden=YES;
    }];
}


-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _tableView .backgroundColor = COLOR_BG;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row%2==0) {
        return 120;
    }
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row%2!=0) {
        DJSpaceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DJSpaceCell" forIndexPath:indexPath];
        return cell;
    }else{
        DJGetOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DJGetOrderCell" forIndexPath:indexPath];
        DJOrderModel *model = self.dataArr[indexPath.row/2];
        cell.model = model;
        __weak DJSyOrderListVC *weakSelf = self;
        cell.failureTableBlock = ^(id requestObject) {
            [weakSelf constructData];
        };
        cell.refreshTableBlock = ^(id requestObject) {
            if ([requestObject[@"code"] integerValue]==1) {
               
                [weakSelf.navigationController popViewControllerAnimated:YES];
                [(DJWorkViewController *)weakSelf.navigationController.viewControllers[0] todayOrder];
            }else{
                 [weakSelf constructData];
            }
            
        };
        return cell;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_dataArr.count==0) {
        return 0;
    }
    return self.dataArr.count*2;
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
