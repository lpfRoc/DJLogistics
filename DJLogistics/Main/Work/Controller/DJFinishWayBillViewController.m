//
//  DJFinishWayBillViewController.m
//  DJLogistics
//
//  Created by Roc on 2017/10/19.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJFinishWayBillViewController.h"
#import "DJFinishWayBillTableView.h"
#import "DJWaybillDataSource.h"
@interface DJFinishWayBillViewController ()
/** tableView */
@property (nonatomic,strong) DJFinishWayBillTableView *finishWayBillTableView;
/** data */
@property (nonatomic,strong) NSMutableArray *dataArr;
@end

@implementation DJFinishWayBillViewController
- (NSMutableArray *)dataArr
{
    if (_dataArr == nil) {
        
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
- (DJFinishWayBillTableView *)finishWayBillTableView
{
    if (_finishWayBillTableView == nil) {
        
        _finishWayBillTableView = [[DJFinishWayBillTableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _finishWayBillTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(requestData)];
        _finishWayBillTableView.rootVc = self;
    }
    return _finishWayBillTableView;
}
#pragma mark - autoLayout
- (void)autoLayout
{
    [_finishWayBillTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.right.equalTo(self.view);
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.finishWayBillTableView];
    [self autoLayout];
    [self requestData];
}
//
-(void)requestData
{
    [Toast makeToastActivity];
    [ZDBaseRequestManager POSTJKID:@"waybill_finish" parameters:@{@"id":DJUser_Info.ID} success:^(id responseObject) {
        DJLog(@"%@",responseObject);
        [_finishWayBillTableView.mj_header endRefreshing];
        if ([responseObject[@"code"] integerValue] == 1) {
            [Toast hideToastActivity];
            DJWaybillDataSource *dataSource = [DJWaybillDataSource yy_modelWithJSON:responseObject];
            NSLog(@"%@",dataSource.result);
            [_finishWayBillTableView.dataArr removeAllObjects];
            
            _finishWayBillTableView.dataArr =[dataSource.result mutableCopy];
            [_finishWayBillTableView reloadData];
            
            [_finishWayBillTableView configBlankPage:EaseBlankPageTypeWaybillCenter
                                           hasData:dataSource.result.count > 0
                                          hasError:NO
                                 reloadButtonBlock:^(id sender) {
                                 }clickButtonBlock:^(EaseBlankPageType type) {
                                 }];
        }else
        {
            [Toast makeToast:responseObject[@"msg"]];
        }
    } failure:^(ZDURLResponseStatusCode errorCode) {
        
    }];
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