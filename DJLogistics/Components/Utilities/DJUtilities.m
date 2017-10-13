//
//  DJUtilities.m
//  DJLogistics
//
//  Created by Roc on 2017/10/13.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "DJUtilities.h"

@implementation DJUtilities
+(CGSize) getStrLenByFontStyle:(NSString*) str fontStyle:(UIFont*) fontStyle textWidth:(float) textWidth{
    if (!fontStyle) {
        fontStyle = [UIFont systemFontOfSize:14];
    }
    if ([str isEqual:[NSNull null]] || [str isEqualToString:@"(null)"]) {
        return CGSizeZero;
    }
    NSDictionary *attributes = @{NSFontAttributeName: fontStyle};
    CGRect rect = [str boundingRectWithSize:CGSizeMake(textWidth, 0)
                                    options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading
                                 attributes:attributes
                                    context:nil];
    return rect.size;
}
@end
