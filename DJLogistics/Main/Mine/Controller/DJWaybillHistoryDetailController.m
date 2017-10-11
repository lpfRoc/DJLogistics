//
//  DJWaybillHistoryDetailController.m
//  DJLogistics
//
//  Created by Roc on 2017/10/11.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJWaybillHistoryDetailController.h"
#import "DJWaybillHistoryDetailTableView.h"
@interface DJWaybillHistoryDetailController ()
/** tableView */
@property (nonatomic,strong) DJWaybillHistoryDetailTableView *waybillHistoryDetailTableView;
@end

@implementation DJWaybillHistoryDetailController
- (DJWaybillHistoryDetailTableView *)waybillHistoryDetailTableView
{
    if (_waybillHistoryDetailTableView == nil) {
        
        _waybillHistoryDetailTableView = [[DJWaybillHistoryDetailTableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _waybillHistoryDetailTableView.rootVc = self;
    }
    return _waybillHistoryDetailTableView;
}
#pragma mark - autoLayout
- (void)autoLayout
{
    [_waybillHistoryDetailTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.right.equalTo(self.view);
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.waybillHistoryDetailTableView];
    [self autoLayout];
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
