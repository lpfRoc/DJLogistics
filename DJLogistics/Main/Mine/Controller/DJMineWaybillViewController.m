//
//  DJMineWaybillViewController.m
//  DJLogistics
//
//  Created by Roc on 2017/10/10.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJMineWaybillViewController.h"
#import "DJMineWaybillTableView.h"
#import "DJWaybillModel.h"
#import "DJWaybillDataSource.h"
@interface DJMineWaybillViewController ()
/** tableView */
@property (nonatomic,strong) DJMineWaybillTableView *mineWaybillTableView;
/** data */
@property (nonatomic,strong) NSMutableArray *dataArr;
@end

@implementation DJMineWaybillViewController
- (NSMutableArray *)dataArr
{
    if (_dataArr == nil) {
        
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
- (DJMineWaybillTableView *)mineWaybillTableView
{
    if (_mineWaybillTableView == nil) {
        
        _mineWaybillTableView = [[DJMineWaybillTableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _mineWaybillTableView.rootVc = self;
    }
    return _mineWaybillTableView;
}
#pragma mark - autoLayout
- (void)autoLayout
{
    [_mineWaybillTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.right.equalTo(self.view);
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的运单";
    [self.view addSubview:self.mineWaybillTableView];
    [self autoLayout];
    [self requestData];
}
//
-(void)requestData
{
    [ZDBaseRequestManager POSTJKID:@"waybill_list" parameters:@{@"id":DJUser_Info.ID} success:^(id responseObject) {
        DJLog(@"%@",responseObject);
        if ([responseObject[@"code"] integerValue] == 1) {//退出成功
            DJWaybillDataSource *dataSource = [DJWaybillDataSource yy_modelWithJSON:responseObject];
            NSLog(@"%@",dataSource.result);
            

            
            _mineWaybillTableView.dataArr =[self handelDataArr:dataSource.result];
            [_mineWaybillTableView reloadData];
            [_mineWaybillTableView configBlankPage:EaseBlankPageTypeOrderCenter
                                           hasData:dataSource.result > 0
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
//整合相同日期数据
-(NSMutableArray *)handelDataArr:(NSArray *)dataArr
{
    NSMutableArray *array = [NSMutableArray arrayWithArray:dataArr];
    
    NSMutableArray *dateMutablearray = [@[] mutableCopy];
    for (int i = 0; i < array.count; i ++) {
        DJWaybillModel *modelI = array[i];
        NSMutableArray *tempArray = [@[] mutableCopy];
        [tempArray addObject:modelI];
        for (int j = i+1; j < array.count; j ++) {
           DJWaybillModel *modelJ = array[j];
            if([modelI.date isEqualToString:modelJ.date]){
                [tempArray addObject:modelJ];
                [array removeObjectAtIndex:j];
                j -= 1;
            }
        }
        [dateMutablearray addObject:tempArray];
    }
    return dateMutablearray;
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
