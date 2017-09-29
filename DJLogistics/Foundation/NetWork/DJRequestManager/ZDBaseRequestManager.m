//
//  ZDBaseRequestManager.m
//  NetworkHelper
//
//  Created by Roc on 2017/4/25.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "ZDBaseRequestManager.h"


@implementation ZDBaseRequestManager

+ (BOOL)isWebAvailible{//判断网络是否可用
    Reachability * reach = [Reachability reachabilityForInternetConnection];
    switch ([reach currentReachabilityStatus]){
        case NotReachable:return NO; break;
        case ReachableViaWiFi: return YES;break;
        default: return YES;
    }
    return YES;
}

+ (__kindof NSURLSessionTask *)GETJKID:(NSString *)JKID
                            parameters:(id)parameters
                               success:(ZDHttpRequestSuccess)success
                               failure:(ZDHttpRequestFailed)failure
{
    /**
     *  网络是否可用
     */
    if (![self isWebAvailible]) {
        failure ? failure(ZDURLResponseStatusCodeErrorNoNetwork) : nil;
        return nil;
    }
    
    __block NSURLSessionDataTask * task = nil;
    NSString *url =[CONFIG_SERVER_URL stringByAppendingString:JKID];
    task =  [PPNetworkHelper GET:url parameters:parameters success:success failure:^(NSError *error) {
        NSHTTPURLResponse *httpUrlResponse = (NSHTTPURLResponse *)task.response;
        
        if (httpUrlResponse.statusCode == 404) {
            /**
             *  版本检测，用于版本交替时可能访问不存在的服务
             */
            
            failure ? failure(ZDURLResponseStatusCodeErrorNoServe) : nil;
        }else
        {
            
            failure ? failure(ZDURLResponseStatusCodeErrorTimeout) : nil;
        }
    }];
    return task;
}

+ (__kindof NSURLSessionTask *)GETJKID:(NSString *)JKID
                            parameters:(id)parameters
                         responseCache:(ZDHttpRequestCache)responseCache
                               success:(ZDHttpRequestSuccess)success
                               failure:(ZDHttpRequestFailed)failure
{
    

    __block NSURLSessionDataTask * task = nil;
    NSString *url =[CONFIG_SERVER_URL stringByAppendingString:JKID];
    task = [PPNetworkHelper GET:url parameters:parameters responseCache:responseCache success:success failure:^(NSError *error) {
        /**
         *  网络是否可用（放到这里，是为了在断网下也能获得缓存数据）
         */
        if (![self isWebAvailible]) {
            failure ? failure(ZDURLResponseStatusCodeErrorNoNetwork) : nil;
            return ;
        }
        
        NSHTTPURLResponse *httpUrlResponse = (NSHTTPURLResponse *)task.response;
        if (httpUrlResponse.statusCode == 404) {
            /**
             *  版本检测，用于版本交替时可能访问不存在的服务
             */
            
            failure ? failure(ZDURLResponseStatusCodeErrorNoServe) : nil;
        }else
        {
            
            failure ? failure(ZDURLResponseStatusCodeErrorTimeout) : nil;
        }
    }];
    return task;
}

+ (__kindof NSURLSessionTask *)POSTJKID:(NSString *)JKID
                             parameters:(id)parameters
                                success:(ZDHttpRequestSuccess)success
                                failure:(ZDHttpRequestFailed)failure
{
    /**
     *  网络是否可用
     */
    if (![self isWebAvailible]) {
        failure ? failure(ZDURLResponseStatusCodeErrorNoNetwork) : nil;
        return nil;
    }
    
    __block NSURLSessionDataTask * task = nil;
    NSString *url =[CONFIG_SERVER_URL stringByAppendingString:JKID];

    DJLog(@"%@",url);
    task = [PPNetworkHelper POST:url parameters:parameters success:success failure:^(NSError *error) {
        NSHTTPURLResponse *httpUrlResponse = (NSHTTPURLResponse *)task.response;
        
        if (httpUrlResponse.statusCode == 404) {
            /**
             *  版本检测，用于版本交替时可能访问不存在的服务
             */
            
            failure ? failure(ZDURLResponseStatusCodeErrorNoServe) : nil;
        }else
        {
            
            failure ? failure(ZDURLResponseStatusCodeErrorTimeout) : nil;
        }
    }];
    
    return task;
}

+ (__kindof NSURLSessionTask *)POSTJKID:(NSString *)JKID
                             parameters:(id)parameters
                          responseCache:(ZDHttpRequestCache)responseCache
                                success:(ZDHttpRequestSuccess)success
                                failure:(ZDHttpRequestFailed)failure
{

    __block NSURLSessionDataTask * task = nil;
    NSString *url =[CONFIG_SERVER_URL stringByAppendingString:JKID];

    task =[PPNetworkHelper POST:url parameters:parameters responseCache:responseCache success:success failure:^(NSError *error) {
        /**
         *  网络是否可用（放到这里，是为了在断网下也能获得缓存数据）
         */
        if (![self isWebAvailible]) {
            failure ? failure(ZDURLResponseStatusCodeErrorNoNetwork) : nil;
            return ;
        }
        
        NSHTTPURLResponse *httpUrlResponse = (NSHTTPURLResponse *)task.response;
                if (httpUrlResponse.statusCode == 404) {
            /**
             *  版本检测，用于版本交替时可能访问不存在的服务
             */
            
            failure ? failure(ZDURLResponseStatusCodeErrorNoServe) : nil;
        }else
        {
            
            failure ? failure(ZDURLResponseStatusCodeErrorTimeout) : nil;
        }
        
    }];
    return task;
}
@end
