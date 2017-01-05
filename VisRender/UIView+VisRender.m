//
//  UIView+VisCorner.m
//  VisCorner
//
//  Created by WzxJiang on 17/1/3.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

#import "UIView+VisRender.h"
#import "NSCache+VisRender.h"

@implementation UIView (VisRender)

- (void)vis_setCornerRadius:(CGFloat)cornerRadius size:(CGSize)size color:(UIColor *)color identifier:(NSString *)identifier {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        CGFloat useCornerRadius = cornerRadius;
        CGFloat maxCornerRadius = MAX(size.width, size.height)/2.0;
        if (useCornerRadius > maxCornerRadius) {
            useCornerRadius = maxCornerRadius;
        }
        
        UIBezierPath * bezierPath = [[NSCache vis_cache] objectForKey: identifier];
        if (!bezierPath) {
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathAddRoundedRect(path, nil, (CGRect){CGPointZero, size}, useCornerRadius, useCornerRadius);
            CGPathAddRect(path, nil, (CGRect){CGPointZero, size});
            bezierPath = [UIBezierPath bezierPathWithCGPath:path];
            [[NSCache vis_cache] setObject:bezierPath forKey:identifier];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            CAShapeLayer * layer = [CAShapeLayer layer];
            layer.path = bezierPath.CGPath;
            layer.fillColor = color.CGColor;
            layer.fillRule = kCAFillRuleEvenOdd;
            [self.layer addSublayer:layer];
        });
    });
}

@end
