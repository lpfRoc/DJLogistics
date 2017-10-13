//
//  DJMessageModel.h
//  DJLogistics
//
//  Created by Roc on 2017/10/12.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DJMessageModel : NSObject
@property (nonatomic, strong) NSString *content;//消息正文
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *createtime;
@property (nonatomic, strong) NSString *ID;
@end
