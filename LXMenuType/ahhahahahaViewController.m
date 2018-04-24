//
//  ahhahahahaViewController.m
//  LXMenuType
//
//  Created by budgetoutsource on 2017/1/24.
//  Copyright © 2017年 LMTeam. All rights reserved.
//

#import "ahhahahahaViewController.h"
#import "LXDrawerViewController.h"
@interface ahhahahahaViewController ()

@end

@implementation ahhahahahaViewController

+(UIViewController *)initWithTitle:(NSString *)title{

    ahhahahahaViewController * ha = [[ahhahahahaViewController alloc]init];
    
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:ha];


    ha.navigationItem.title = title;
    
    return nav;

}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"切换" style:UIBarButtonItemStylePlain target:self action:@selector(switchBackMainViewController)];
}

-(void)switchBackMainViewController
{
    [[LXDrawerViewController sharedDrawerViewController] switchBackMainViewController];
}


@end
