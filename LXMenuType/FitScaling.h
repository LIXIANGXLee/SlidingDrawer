//
//  FitScaling.h
//  QYKUser
//
//  Created by huangxl on 16/6/7.
//  Copyright © 2016年 huangxl. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kBaseScreenWidth    375
#define kBaseScreenHeight   667

/**
 *  屏幕等比例缩放适配
 */
@interface FitScaling : NSObject

/**
 *  等比例缩放单例
 *
 *  @return 等比例缩放用的单例
 */
+ (instancetype)sharedScaling;

/**
 *  计算适配后的屏幕X坐标
 *
 *  @param x X坐标
 *
 *  @return 适配后的X坐标
 */
- (CGFloat)fittedX:(CGFloat)x;

/**
 *  计算适配后的屏幕Y坐标
 *
 *  @param y Y坐标
 *
 *  @return 适配后的Y坐标
 */
- (CGFloat)fittedY:(CGFloat)y;

/**
 *  计算适配后的宽度
 *
 *  @param width 宽度
 *
 *  @return 适配后的宽度
 */
- (CGFloat)fittedWidth:(CGFloat)width;

/**
 *  计算适配后的高度
 *
 *  @param height 高度
 *
 *  @return 适配后的高度
 */
- (CGFloat)fittedHeight:(CGFloat)height;

@end
