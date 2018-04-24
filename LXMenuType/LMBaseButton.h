//
//  LMBaseButton.h
//  ShowYourself
//
//  Created by budgetoutsource on 2017/1/16.
//  Copyright © 2017年 LMTeam. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LMBaseButton;

typedef void(^LMBaseButtonClickBlock)(LMBaseButton *);

@interface LMBaseButton : UIButton

@property (nonatomic, copy) LMBaseButtonClickBlock block;

+ (instancetype)createLMBaseButton;


@end
