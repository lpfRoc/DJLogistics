//
//  DJMineViewController.m
//  DJLogistics
//
//  Created by Roc on 2017/9/29.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJMineViewController.h"
#import "DJMineTableView.h"
#import "DJMineFooterView.h"
#import "DJMineWaybillViewController.h"
@interface DJMineViewController ()
/** tableView */
@property (nonatomic,strong) DJMineTableView *mineTableView;
/** footerView */
@property (nonatomic,strong) DJMineFooterView *mineFooterView;
/** 分割线 */
@property (nonatomic,strong) UIView *line;
@end

@implementation DJMineViewController
- (UIView *)line
{
    if (_line == nil) {
        
        _line = [[UIView alloc] init];
        _line.backgroundColor = COLOR_Line;
    }
    return _line;
}
- (DJMineFooterView *)mineFooterView
{
    if (_mineFooterView == nil) {
        
        _mineFooterView = [[DJMineFooterView alloc] initWithFrame:CGRectMake(0, 0,UI_SCREEN_HEIGHT, AUTO_SIZE(225))];
        [_mineFooterView addSubview:self.line];
        [_line mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(_mineFooterView.mas_bottom).with.offset(AUTO_SIZE(-82-5));
            make.left.equalTo(_mineFooterView.mas_left).with.offset(AUTO_SIZE(15));
            make.height.equalTo(@(ISRetina_Min_Line));
            make.width.equalTo(@(UI_SCREEN_WIDTH -AUTO_SIZE(15) ));

        }];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMineWaybill)];
        [_mineFooterView addGestureRecognizer:tap];
    }
    return _mineFooterView;
}
- (DJMineTableView *)mineTableView
{
    if (_mineTableView == nil) {
        
        _mineTableView = [[DJMineTableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _mineTableView.tableFooterView = self.mineFooterView;
        _mineTableView.rootVc = self;
    }
    return _mineTableView;
}
#pragma mark - autoLayout
- (void)autoLayout
{
    [_mineTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.right.equalTo(self.view);
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的";

    [self.view addSubview:self.mineTableView];
    [self autoLayout];
    NSLog(@"%@",DJUser_Info.phone);
}

-(void)tapMineWaybill
{
    [self.navigationController pushViewController:[[DJMineWaybillViewController alloc] init] animated:YES];
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
