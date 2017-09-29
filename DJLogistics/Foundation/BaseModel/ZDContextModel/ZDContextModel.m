//
//  ZDContextModel.m
//  Loan
//
//  Created by Roc on 16/10/14.
//  Copyright © 2016年 zhengDa. All rights reserved.
//

#import "ZDContextModel.h"
#import "ZDUserModel.h"
#import "ZDCacheDataModel.h"
@implementation ZDContextModel

static ZDContextModel *sharedAppContextModel = nil;
static dispatch_once_t onceToken;
+ (instancetype)sharedInstance{
    dispatch_once(&onceToken, ^{
        sharedAppContextModel = [[ZDContextModel alloc] init];
    });
    return sharedAppContextModel;
}
#pragma mark - currentUserInfo
@synthesize currentUserInfo = _currentUserInfo;
- (void)setCurrentUserInfo:(ZDUserModel *)currentUserInfo {
    _currentUserInfo = currentUserInfo;
    if (currentUserInfo) {
        [ZDCacheDataModel sharedInstance].userInfoData = [currentUserInfo yy_modelToJSONObject];
    }
}

- (ZDUserModel *)currentUserInfo{
    _currentUserInfo = [ZDUserModel yy_modelWithDictionary:[ZDCacheDataModel sharedInstance].userInfoData];
    return _currentUserInfo;
}

@end
