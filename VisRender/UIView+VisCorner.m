//
//  UIView+VisCorner.m
//  VisCorner
//
//  Created by WzxJiang on 17/1/3.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

#import "UIView+VisCorner.h"
#import "NSCache+VisCorner.h"

@implementation UIView (VisCorner)

- (void)vis_setCornerRadius:(CGFloat)cornerRadius size:(CGSize)size color:(UIColor *)color identifier:(NSString *)identifier {
    dispatch_async(dispatch_queue_create("com.vis.corner.queue", NULL), ^{
        CGFloat use_cornerRadius = cornerRadius;
        CGFloat maxCornerRadius = MAX(size.width, size.height)/2.0;
        if (use_cornerRadius > maxCornerRadius) {
            use_cornerRadius = maxCornerRadius;
        }
        
        UIBezierPath * bezierPath = [[NSCache vis_cache] objectForKey: identifier];
        if (!bezierPath) {
            CGMutablePathRef path = CGPathCreateMutable();
            CGPathAddRect(path, nil, (CGRect){CGPointZero, size});
            CGPathAddRoundedRect(path, nil, (CGRect){CGPointZero, size}, cornerRadius, cornerRadius);
            bezierPath = [UIBezierPath bezierPathWithCGPath:path];
            [[NSCache vis_cache] setObject:bezierPath forKey:identifier];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            CAShapeLayer * layer = [CAShapeLayer layer];
            layer.path = bezierPath.CGPath;
            layer.fillColor = color.CGColor;
            layer.fillRule = kCAFillRuleEvenOdd;
            [self.layer insertSublayer:layer atIndex:0];
        });
    });
}

@end
