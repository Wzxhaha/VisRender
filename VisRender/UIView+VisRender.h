//
//  UIView+VisCorner.h
//  VisCorner
//
//  Created by WzxJiang on 17/1/3.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (VisRender)

- (void)vis_setCornerRadius:(CGFloat)cornerRadius
                       size:(CGSize)size
                      color:(UIColor *)color
                 identifier:(NSString *)identifier;

//TODO: - shadow
//- (void)vis_shadowWithCornerRadius:(CGFloat)cornerRadius
//                              size:(CGSize)size;

@end
