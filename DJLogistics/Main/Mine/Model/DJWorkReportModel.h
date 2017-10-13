//
//  DJWorkReportModel.h
//  DJLogistics
//
//  Created by Roc on 2017/10/13.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface DJWorkReportModel : NSObject
/** 月配送中 */
@property (nonatomic,strong) NSString *m_ing;
/** 月配送完成 */
@property (nonatomic,strong) NSString *m_served;
/** 日配送总量 */
@property (nonatomic,strong) NSString *d_total;
/** 日配送中 */
@property (nonatomic,strong) NSString *d_ing;
/** 日超时 */
@property (nonatomic,strong) NSString *d_overtime;
/** 月超时 */
@property (nonatomic,strong) NSString *m_overtime;
/** 日完成 */
@property (nonatomic,strong) NSString *d_served;
/** 月配送总量 */
@property (nonatomic,strong) NSString *m_total;
@end
