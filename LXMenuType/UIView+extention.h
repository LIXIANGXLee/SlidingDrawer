//
//  UIView+extention.h
//  LXChat
//
//  Created by budgetoutsource on 2016/11/28.
//  Copyright © 2016年 budgetoutsource. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (extention)

@property (nonatomic, assign) CGFloat LX_x;
@property (nonatomic, assign) CGFloat LX_y;
@property (nonatomic, assign) CGFloat LX_center_x;
@property (nonatomic, assign) CGFloat LX_center_y;
@property (nonatomic, assign) CGFloat LX_width;
@property (nonatomic, assign) CGFloat LX_height;
@property (nonatomic, assign) CGSize LX_size;

@property (nonatomic) CGPoint LX_Origin;
@property (nonatomic) CGFloat LX_Right;
@property (nonatomic) CGFloat LX_Bottom;

@end
