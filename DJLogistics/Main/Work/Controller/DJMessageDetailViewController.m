//
//  DJMessageDetailViewController.m
//  DJLogistics
//
//  Created by Roc on 2017/10/13.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJMessageDetailViewController.h"
#import "DJMessageDetailTableView.h"
@interface DJMessageDetailViewController ()
/** tableView */
@property (nonatomic,strong) DJMessageDetailTableView *tableView;

@end

@implementation DJMessageDetailViewController
- (DJMessageDetailTableView *)tableView
{
    if (_tableView == nil) {
        
        _tableView = [[DJMessageDetailTableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _tableView.messageModel = self.messageModel;
    }
    return _tableView;
}

#pragma mark - autoLayout

- (void)autoLayout
{
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.right.equalTo(self.view);
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"消息详情";
    [self.view addSubview:self.tableView];
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
