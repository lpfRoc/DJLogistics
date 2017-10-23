//
//  FSLocationManager.m
//  RWHNewton
//
//  Created by 翁志方 on 2016/12/27.
//  Copyright © 2016年 RWH. All rights reserved.
//

#import "FYLocationManager.h"
#import <UIKit/UIKit.h>
#import "FYWGS84TOGCJ02.h"
#import "UIViewController+FYCategory.h"
@interface FYLocationManager()<UIAlertViewDelegate>

@end

@implementation FYLocationManager

+ (instancetype)shareInstance
{
    static FYLocationManager *obj;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [FYLocationManager new];
        
    });
    return obj;
}


-(BOOL)locationEnalbe{
    _locationEnalbe = [CLLocationManager locationServicesEnabled];
    return _locationEnalbe;
}


- (void)start
{
    if ([CLLocationManager locationServicesEnabled]) {
        _locationEnalbe = YES;
        if (!locationManager) {
            locationManager = [CLLocationManager new];
            
//            [locationManager requestAlwaysAuthorization];
            [locationManager requestWhenInUseAuthorization];
            locationManager.delegate = self;
            
            locationManager.distanceFilter = kCLDistanceFilterNone;
            locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        }
         [locationManager startUpdatingLocation];
    }else{
        _locationEnalbe = NO;
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"请打开定位服务和权限以确保定位成功" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            if ([[UIApplication sharedApplication] canOpenURL:url])
            {
                [[UIApplication sharedApplication] openURL:url];
            }
        }];
        UIAlertAction *okAction1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alertController addAction:okAction1];
        [alertController addAction:okAction];
        
        [[UIViewController currentViewController] presentViewController:alertController animated:YES completion:nil];
    }
}

-(void)stopLocation{
    [locationManager stopUpdatingLocation];

    [self.locationArr removeAllObjects];
    
}

#pragma mark delegate

#pragma mark delegate
#pragma mark location


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    
    CLLocation *location = [locations lastObject];
    CLLocationCoordinate2D coor = location.coordinate;
   
    CLLocationCoordinate2D locNew = coor;
    if (![FYWGS84TOGCJ02 isLocationOutOfChina:coor]) {
        locNew = [FYWGS84TOGCJ02 transformFromWGSToGCJ:coor];
    }
    
    CLGeocoder *clGeoCoder = [[CLGeocoder alloc] init];
    
    CLLocation *cl = [[CLLocation alloc] initWithLatitude:locNew.latitude longitude:locNew.longitude];
    self.latitude = locNew.latitude;
    self.lontitue = locNew.longitude;
    CLLocation *locationNew = [[CLLocation alloc]initWithCoordinate:cl.coordinate altitude:location.altitude horizontalAccuracy:location.horizontalAccuracy verticalAccuracy:location.verticalAccuracy course:location.course speed:location.speed timestamp:location.timestamp];
   
    if (self.locationArr.count ==100) {
        [self.locationArr removeAllObjects];
    }
     [self.locationArr addObject:locationNew];
    
    [clGeoCoder reverseGeocodeLocation:cl completionHandler: ^(NSArray *placemarks,NSError *error) {
        
        for (CLPlacemark *placeMark in placemarks) {
            
            
            
            NSDictionary *addressDic = placeMark.addressDictionary;
            
            
            
            NSString *state=[addressDic objectForKey:@"State"];
            
            NSString *city=[addressDic objectForKey:@"City"];
            
            NSString *subLocality=[addressDic objectForKey:@"SubLocality"];
            
            NSString *street=[addressDic objectForKey:@"Street"];
            
            
           
            NSLog(@"所在城市====%@ %@ %@ %@", state, city, subLocality, street);
            NSString *str = [NSString stringWithFormat:@"%@%@%@", city, subLocality, street];
            self.areaStr = str;
            if (self.locationBlock) {
                self.locationBlock(str);
            }
            
            
        }
        
        
        
    }];
    
    
}






@end
