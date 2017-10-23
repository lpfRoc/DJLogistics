//
//  FSLocationManager.h
//  RWHNewton
//
//  Created by 翁志方 on 2016/12/27.
//  Copyright © 2016年 RWH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^LocationBlock)(NSString *str);

@interface FYLocationManager : NSObject<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}
+ (instancetype)shareInstance;

- (void)start;




-(void)stopLocation;

@property (nonatomic, assign) double lontitue;
@property (nonatomic, assign) double latitude;
@property (nonatomic , copy) NSString *areaStr;
@property (nonatomic , assign ) BOOL locationEnalbe;
@property (nonatomic , copy) LocationBlock locationBlock;

@property (nonatomic , strong) NSMutableArray *locationArr;


@end
