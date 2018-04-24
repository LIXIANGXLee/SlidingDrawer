//
//  FitScaling.m
//  QYKUser
//
//  Created by huangxl on 16/6/7.
//  Copyright © 2016年 huangxl. All rights reserved.
//

#import "FitScaling.h"

@interface FitScaling ()

@property (nonatomic) CGFloat m_fScaleX;
@property (nonatomic) CGFloat m_fScaleY;

@end

@implementation FitScaling

+ (instancetype)sharedScaling {
    static FitScaling *fitScaling = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        fitScaling = [[FitScaling alloc] init];
        if ([UIScreen mainScreen].bounds.size.width == kBaseScreenWidth) {
            fitScaling.m_fScaleX = 1.0f;
            fitScaling.m_fScaleY = 1.0f;
        } else {
            fitScaling.m_fScaleX = [UIScreen mainScreen].bounds.size.width / kBaseScreenWidth;
            fitScaling.m_fScaleY = [UIScreen mainScreen].bounds.size.height / kBaseScreenHeight;
        }
    });
    
    return fitScaling;
}

- (CGFloat)fittedX:(CGFloat)x {
    CGFloat fX = x * self.m_fScaleX;
    return fX;
}

- (CGFloat)fittedY:(CGFloat)y {
    CGFloat fY = y * self.m_fScaleY;
    return fY;
}

- (CGFloat)fittedWidth:(CGFloat)width {
    CGFloat fWidth = width * self.m_fScaleX;
    return fWidth;
}

- (CGFloat)fittedHeight:(CGFloat)height {
    CGFloat fHeight = height * self.m_fScaleY;
    return fHeight;
}

@end
