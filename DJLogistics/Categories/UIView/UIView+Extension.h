
//  UIView+Extension.h


#import <UIKit/UIKit.h>
#import "EaseBlankPageView.h"
@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x ;
@property (nonatomic, assign) CGFloat y ;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

- (void)removeAllSubViews;

#pragma mark BlankPageView
@property (strong, nonatomic) EaseBlankPageView *blankPageView;


/**
 缺省页

 @param blankPageType 缺省页类型
 @param hasData 有无数据（NO 显示缺省页 Yes 不显示）
 @param hasError 请求报错处理
 @param reloadButtonBlock 刷新
 @param clickButtonBlock 自定义按钮操作
 */
- (void)configBlankPage:(EaseBlankPageType)blankPageType
                hasData:(BOOL)hasData
               hasError:(BOOL)hasError
      reloadButtonBlock:(void (^)(id))reloadButtonBlock
       clickButtonBlock:(void (^)(EaseBlankPageType))clickButtonBlock;

- (void)configBlankPage:(EaseBlankPageType)blankPageType
                hasData:(BOOL)hasData
               hasError:(BOOL)hasError
                offsetY:(CGFloat)offsetY
      reloadButtonBlock:(void (^)(id))reloadButtonBlock
       clickButtonBlock:(void (^)(EaseBlankPageType))clickButtonBlock;
@end
