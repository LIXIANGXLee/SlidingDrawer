//
//  LXDrawerViewController.h
//  LXMenuType
//
//  Created by budgetoutsource on 2017/1/22.
//  Copyright © 2017年 LMTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LXLelfViewController.h"

#import "LXMainViewController.h"

#import "ahhahahahaViewController.h"


typedef void(^LXDrawerBlock)();

@interface LXDrawerViewController : UIViewController

@property(nonatomic,copy)LXDrawerBlock block;

// 单例方法
+ (instancetype)sharedDrawerViewController;

//初始化方法
+(LXDrawerViewController *)drawerWithMainViewController:(LXMainViewController *)mainViewController leftViewConreoller:(LXLelfViewController *)leftViewController maxWidth:(CGFloat)maxWidth;

//打开抽屉
-(void)openDrawer;

//打开抽屉
-(void)closeDrawer;

//跳转目标控制器
-(void)switchViewController:(UIViewController *)VC;

// 返回到左侧控制器
-(void)switchBackMainViewController;

@end
