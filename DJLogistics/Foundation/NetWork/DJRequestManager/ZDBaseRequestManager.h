//
//  ZDBaseRequestManager.h
//  NetworkHelper
//
//  Created by Roc on 2017/4/25.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  网络请求返回状态  要记住 这些状态都是基于请求已经结束的
 */
typedef NS_ENUM(NSUInteger, ZDURLResponseStatusCode) {
    /**
     * 成功
     */
    ZDURLResponseStatusCodeSuccess,
    /**
     *  请求超时
     */
    ZDURLResponseStatusCodeErrorTimeout,
    /**
     *  默认除了超时以外的错误都是无网络错误。
     */
    ZDURLResponseStatusCodeErrorNoNetwork,
    /**
     *  404无法连接服务器
     */
    ZDURLResponseStatusCodeErrorNoServe
    
};

/** 缓存的Block */
typedef void(^ZDHttpRequestCache)(id responseCache);

/** 请求成功的Block */
typedef void(^ZDHttpRequestSuccess)(id responseObject);

/** 请求失败的Block */
typedef void(^ZDHttpRequestFailed)(ZDURLResponseStatusCode errorCode);

@interface ZDBaseRequestManager : NSObject

/**
 *  GET请求,无缓存
 *
 *  @param JKID        请求接口ID
 *  @param parameters 请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)GETJKID:(NSString *)JKID
                        parameters:(id)parameters
                           success:(ZDHttpRequestSuccess)success
                           failure:(ZDHttpRequestFailed)failure;

/**
 *  GET请求,自动缓存
 *
 *  @param JKID        请求接口ID
 *  @param parameters    请求参数
 *  @param responseCache 缓存数据的回调
 *  @param success       请求成功的回调
 *  @param failure       请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)GETJKID:(NSString *)JKID
                        parameters:(id)parameters
                     responseCache:(ZDHttpRequestCache)responseCache
                           success:(ZDHttpRequestSuccess)success
                           failure:(ZDHttpRequestFailed)failure;

/**
 *  POST请求,无缓存
 *
 *  @param JKID        请求接口ID
 *  @param parameters 请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)POSTJKID:(NSString *)JKID
                         parameters:(id)parameters
                            success:(ZDHttpRequestSuccess)success
                            failure:(ZDHttpRequestFailed)failure;

/**
 *  POST请求,自动缓存
 *
 *  @param JKID        请求接口ID
 *  @param parameters    请求参数
 *  @param responseCache 缓存数据的回调
 *  @param success       请求成功的回调
 *  @param failure       请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)POSTJKID:(NSString *)JKID
                         parameters:(id)parameters
                      responseCache:(ZDHttpRequestCache)responseCache
                            success:(ZDHttpRequestSuccess)success
                            failure:(ZDHttpRequestFailed)failure;

@end
