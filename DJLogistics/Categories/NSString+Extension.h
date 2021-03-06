//
//  NSString+Extension.h
//  DJLogistics
//
//  Created by Roc on 2017/9/30.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
+ (BOOL)validateMobile:(NSString *)mobile;
- (CGFloat)getWidthWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
@end
