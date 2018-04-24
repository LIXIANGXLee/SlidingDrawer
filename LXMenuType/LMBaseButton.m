//
//  LMBaseButton.m
//  ShowYourself
//
//  Created by budgetoutsource on 2017/1/16.
//  Copyright © 2017年 LMTeam. All rights reserved.
//

#import "LMBaseButton.h"

@implementation LMBaseButton


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}


- (void)click:(LMBaseButton *)btn
{
    if (_block) {
        _block(btn);
    }
}


+ (instancetype)createLMBaseButton
{
    return [LMBaseButton buttonWithType:UIButtonTypeCustom];
}

@end
