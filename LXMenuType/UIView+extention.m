//
//  UIView+extention.m
//  LXChat
//
//  Created by budgetoutsource on 2016/11/28.
//  Copyright © 2016年 budgetoutsource. All rights reserved.
//

#import "UIView+extention.h"

@implementation UIView (extention)

- (void)setLX_x:(CGFloat)LX_x
{
    CGRect frame = self.frame;
    frame.origin.x = LX_x;
    self.frame = frame;
}

- (CGFloat)LX_x
{
    return self.frame.origin.x;
}

- (void)setLX_y:(CGFloat)LX_y
{
    CGRect frame = self.frame;
    frame.origin.y = LX_y;
    self.frame = frame;
}

- (CGFloat)LX_y
{
    return self.frame.origin.y;
}

- (void)setLX_center_x:(CGFloat)LX_center_x
{
    CGPoint center = self.center;
    center.x = LX_center_x;
    self.center = center;
}

- (CGFloat)LX_center_x
{
    return self.center.x;
}

- (void)setLX_center_y:(CGFloat)LX_center_y
{
    CGPoint center = self.center;
    center.y = LX_center_y;
    self.center = center;
}

- (CGFloat)LX_center_y
{
    return self.center.y;
}

- (void)setLX_width:(CGFloat)LX_width
{
    CGRect frame = self.frame;
    frame.size.width = LX_width;
    self.frame = frame;
}

- (CGFloat)LX_width
{
    return self.frame.size.width;
}

- (void)setLX_height:(CGFloat)LX_height
{
    CGRect frame = self.frame;
    frame.size.height = LX_height;
    self.frame = frame;
}

- (CGFloat)LX_height
{
    return self.frame.size.height;
}

-(void)setLX_Origin:(CGPoint)LX_Origin
{
    CGRect frame = self.frame;
    frame.origin = LX_Origin;
    self.frame = frame;
}

-(CGPoint)LX_Origin
{
    return self.frame.origin;
}

- (void)setLX_size:(CGSize)LX_size
{
   
    CGRect frame = self.frame;
    frame.size = LX_size;
    self.frame = frame;
}

- (CGSize)LX_size
{
    return self.frame.size;
}

-(void)setLX_Right:(CGFloat)LX_Right
{
    CGRect frame = self.frame;
    frame.origin.x = LX_Right - frame.size.width;
    self.frame = frame;

}
-(CGFloat)LX_Right
{
    return CGRectGetMaxX(self.frame);

}

-(void)setLX_Bottom:(CGFloat)LX_Bottom
{
    CGRect frame = self.frame;
    frame.origin.y = LX_Bottom - frame.size.height;
    self.frame = frame;
}

-(CGFloat)LX_Bottom
{
     return CGRectGetMaxY(self.frame);

}

@end
