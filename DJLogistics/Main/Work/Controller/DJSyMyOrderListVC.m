//
//  DJSyMyOrderListVC.m
//  DJLogistics
//
//  Created by 段世宜 on 2017/10/21.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJSyMyOrderListVC.h"
#import "DJSpaceCell.h"
#import "DJWayBillIngCell.h"
#import "UIViewController+FYCategory.h"
#import "DJWorkViewController.h"
#import "DJSyOrderDetailVC.h"
@interface DJSyMyOrderListVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong) UITableView *tableView ;

@property (nonatomic , strong) NSMutableArray *dataArr;
@end

@implementation DJSyMyOrderListVC
{
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [UIView new];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view.mas_centerY).offset(-50);
        make.width.equalTo(@110);
        make.height.equalTo(@200);
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
    lb.text = @"运单空空如也~";
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
    btn.layer.cornerRadius = 5;
    [btn setTitle:@"去运单添加" forState:UIControlStateNormal];
    [btn setTitleColor:COLOR_W forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(refreshData) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view);
        make.right.equalTo(view);
        make.height.equalTo(@30);
        make.bottom.equalTo(view);
    }];
    self.dataArr = [NSMutableArray new];
    [self.tableView registerNib:[UINib nibWithNibName:@"DJSpaceCell" bundle:nil] forCellReuseIdentifier:@"DJSpaceCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"DJWayBillIngCell" bundle:nil] forCellReuseIdentifier:@"DJWayBillIngCell"];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
        make.top.equalTo(self.view);
    }];
    self.tableView.tableFooterView = [UIView new];
    
    self.tableView .mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self constructData];
    }];
    
    
    
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self constructData];
}
-(void)refreshData{
    [[UIViewController currentViewController].navigationController popViewControllerAnimated:NO];
    [((DJWorkViewController *)[UIViewController currentViewController]) getOrder];
}

-(void)constructData{
    [Toast makeToastActivity];
    [ZDBaseRequestManager POSTJKID:@"waybill_ing" parameters:@{@"id":DJUser_Info.aid} success:^(id responseObject) {
        [self.tableView .mj_header endRefreshing];
        if ([responseObject[@"code"] integerValue] == 1) {//登陆成功
            [self.dataArr removeAllObjects];
            [Toast hideToastActivity];
            id result = responseObject[@"result"];
            if (![result isKindOfClass:[NSArray class]] || [result count]==0) {
                self.tableView.hidden=YES;
            }else{
                self.tableView.hidden= NO;
                for (NSDictionary *dic in result) {
                    DJMineWayBillModel *model = [DJMineWayBillModel yy_modelWithJSON:dic];
//                    [model yy_modelSetWithJSON:dic];
                    [_dataArr addObject:model];
                }
                [_tableView reloadData];
            }
        }else{
            self.tableView.hidden=YES;
            [Toast makeToast:responseObject[@"msg"]];
        }
        
    } failure:^(ZDURLResponseStatusCode errorCode) {
        [self.tableView .mj_header endRefreshing];
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
        return 125;
    }
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row%2!=0) {
        DJSpaceCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DJSpaceCell" forIndexPath:indexPath];
        return cell;
    }else{
        DJWayBillIngCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DJWayBillIngCell" forIndexPath:indexPath];
        DJMineWayBillModel *model = self.dataArr[indexPath.row/2];
        cell.model = model;
       
        return cell;
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_dataArr.count==0) {
        return 0;
    }
    return self.dataArr.count*2;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DJMineWayBillModel *model = self.dataArr[indexPath.row/2];
    DJSyOrderDetailVC *vc = [[DJSyOrderDetailVC alloc]init];
    vc.model = model;
    [[UIViewController currentViewController].navigationController pushViewController:vc animated:YES];
    
    
    
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
