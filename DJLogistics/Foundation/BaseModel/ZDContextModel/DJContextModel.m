//
//  DJContextModel.m
//  Loan
//
//  Created by Roc on 16/10/14.
//  Copyright © 2016年 zhengDa. All rights reserved.
//

#import "DJContextModel.h"
#import "DJUserModel.h"
#import "DJCacheDataModel.h"
@implementation DJContextModel

static DJContextModel *sharedAppContextModel = nil;
static dispatch_once_t onceToken;
+ (instancetype)sharedInstance{
    dispatch_once(&onceToken, ^{
        sharedAppContextModel = [[DJContextModel alloc] init];
    });
    return sharedAppContextModel;
}
#pragma mark - currentUserInfo
@synthesize currentUserInfo = _currentUserInfo;
- (void)setCurrentUserInfo:(DJUserModel *)currentUserInfo {
    _currentUserInfo = currentUserInfo;
    if (currentUserInfo) {
        [DJCacheDataModel sharedInstance].userInfoData = [currentUserInfo yy_modelToJSONObject];
    }
}

- (DJUserModel *)currentUserInfo{
    _currentUserInfo = [DJUserModel yy_modelWithDictionary:[DJCacheDataModel sharedInstance].userInfoData];
    return _currentUserInfo;
}

@end
