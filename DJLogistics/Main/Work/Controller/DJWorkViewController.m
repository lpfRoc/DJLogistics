//
//  DJWorkViewController.m
//  DJLogistics
//
//  Created by Roc on 2017/9/29.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJWorkViewController.h"

@interface DJWorkViewController ()

@end

@implementation DJWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"工作";
    // Do any additional setup after loading the view.
    
    [ZDBaseRequestManager POSTJKID:@"getconfig" parameters:@{} success:^(id responseObject) {
        DJLog(@"%@",responseObject);

        
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
