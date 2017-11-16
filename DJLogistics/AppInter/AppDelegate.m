//
//  AppDelegate.m
//  DJLogistics
//
//  Created by Roc on 2017/9/29.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "AppDelegate.h"
#import "DJLoginViewController.h"
#import "DJNavgationViewController.h"
#import "DJTabBarController.h"
#import "DJAppManagerInit.h"
#import "DJCacheDataModel.h"
#import <AVFoundation/AVFoundation.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0

#import <UserNotifications/UserNotifications.h>


@interface AppDelegate() <UNUserNotificationCenterDelegate>
@end
#endif

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    NSError *setCategoryErr =nil;
    NSError *activationErr=nil;
    
    [[AVAudioSession sharedInstance]
     
     setCategory: AVAudioSessionCategoryPlayback
     
     error:&setCategoryErr];
    
    [[AVAudioSession sharedInstance]
     
     setActive: YES
     
     error:&activationErr];
    
    [AMapServices sharedServices].apiKey = @"3f843f8e909afb65f75a251c49f15571";
    
    
    if ([[DJCacheDataModel sharedInstance] isAutoLogin]){
        self.window.rootViewController = [[DJTabBarController alloc] init];
    
    }else
    {
        DJNavgationViewController*nav = [[DJNavgationViewController alloc]initWithRootViewController:[[DJLoginViewController alloc] init]];
        
        self.window.rootViewController = nav;
    }
    
    [self.window makeKeyAndVisible];
    
    //第三发配置
    [DJAppManagerInit  config];
    [self registerAPNS];
    [XGPush handleLaunching:launchOptions successCallback:^{
        DJLog(@"[DLLogistics] Handle launching success");
    } errorCallback:^{
        DJLog(@"[DLLogistics] Handle launching error");
    }];
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    NSString *deviceTokenStr = [XGPush registerDevice:deviceToken account:nil successCallback:^{
        NSLog(@"[DLLogistics] register push success");
    } errorCallback:^{
        NSLog(@"[DLLogistics] register push error");
    }];
    NSLog(@"[DLLogistics] device token is %@", deviceTokenStr);
    
    //保存token
    [DJCacheDataModel sharedInstance].pushDeviceToken = [NSDictionary dictionaryWithObjects:@[deviceTokenStr] forKeys:@[@"pushDeviceToken"]];

    NSLog(@"%@",deviceTokenStr);
    if(deviceTokenStr.length && DJUser_Info.phone)
    {
        [self bindTokenByPhone: DJUser_Info.phone Token:deviceTokenStr];
    }
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    DJLog(@"[DLLogistics] register APNS fail.\n[DLLogistics] reason : %@", error);
}

/**
 收到通知的回调
 
 @param application  UIApplication 实例
 @param userInfo 推送时指定的参数
 */
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    DJLog(@"[DLLogistics] receive Notification");
    [XGPush handleReceiveNotification:userInfo
                      successCallback:^{
                          DJLog(@"[DLLogistics] Handle receive success");
                      } errorCallback:^{
                          DJLog(@"[DLLogistics] Handle receive error");
                      }];
}
/**
 收到静默推送的回调
 
 @param application  UIApplication 实例
 @param userInfo 推送时指定的参数
 @param completionHandler 完成回调
 */
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    NSLog(@"[DLLogistics] receive slient Notification");
    NSLog(@"[DLLogistics] userinfo %@", userInfo);
    [XGPush handleReceiveNotification:userInfo
                      successCallback:^{
                          NSLog(@"[DLLogistics] Handle receive success");
                      } errorCallback:^{
                          NSLog(@"[DLLogistics] Handle receive error");
                      }];
    
    completionHandler(UIBackgroundFetchResultNewData);
}

// iOS 10 新增 API
// iOS 10 会走新 API, iOS 10 以前会走到老 API
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
// App 用户点击通知的回调
// 无论本地推送还是远程推送都会走这个回调
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)())completionHandler {
    DJLog(@"[DLLogistics] click notification");
    [XGPush handleReceiveNotification:response.notification.request.content.userInfo
                      successCallback:^{
                          DJLog(@"[DLLogistics] Handle receive success");
                      } errorCallback:^{
                          DJLog(@"[DLLogistics] Handle receive error");
                      }];
    
    completionHandler();
}

// App 在前台弹通知需要调用这个接口
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler {
    
    completionHandler(UNNotificationPresentationOptionBadge | UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert);
}
#endif


- (void)registerAPNS {
    float sysVer = [[[UIDevice currentDevice] systemVersion] floatValue];
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
    if (sysVer >= 10) {
        // iOS 10
        [self registerPush10];
    } else if (sysVer >= 8) {
        // iOS 8-9
        [self registerPush8to9];
    } else {
        // before iOS 8
        [self registerPushBefore8];
    }
#else
    if (sysVer < 8) {
        // before iOS 8
        [self registerPushBefore8];
    } else {
        // iOS 8-9
        [self registerPush8to9];
    }
#endif
}

- (void)registerPush10{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    
    
    [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted) {
        }
    }];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
#endif
}

- (void)registerPush8to9{
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    [[UIApplication sharedApplication] registerForRemoteNotifications];
}

- (void)registerPushBefore8{
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
}

-(void)bindTokenByPhone:(NSString *)phoneNum Token:(NSString *)token
{
    NSDictionary *parameters = @{
                                 @"phone":phoneNum,
                                 @"token":token,
                                 };
    [ZDBaseRequestManager POSTJKID:@"bind" parameters:parameters success:^(id responseObject) {
        DJLog(@"%@",responseObject);
        if ([responseObject[@"code"] integerValue] == 1) {//成功

        }
    } failure:^(ZDURLResponseStatusCode errorCode) {
        
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    __block UIBackgroundTaskIdentifier bgTask;
    
    bgTask= [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        
        dispatch_async(dispatch_get_main_queue(),^{if(bgTask !=UIBackgroundTaskInvalid)
            
        {
            
            bgTask=UIBackgroundTaskInvalid;
            
        }
            
        });
        
    }];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0), ^{
        
        dispatch_async(dispatch_get_main_queue(),^{if(bgTask !=UIBackgroundTaskInvalid)
            
        {
            
            bgTask=UIBackgroundTaskInvalid;
            
        }
            
        });
        
    });
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
