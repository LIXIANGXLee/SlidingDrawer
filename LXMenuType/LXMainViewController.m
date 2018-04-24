//
//  LXMainViewController.m
//  LXMenuType
//
//  Created by budgetoutsource on 2017/1/23.
//  Copyright © 2017年 LMTeam. All rights reserved.
//

#import "LXMainViewController.h"
#import "LXDrawerViewController.h"

@interface LXMainViewController ()

@end

@implementation LXMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setUpViewControllers];
  }

- (void)setUpViewControllers {
    
    NSMutableArray * array = [NSMutableArray arrayWithArray:@[@"UIViewController",@"UIViewController"]];
    
    for (NSInteger i = 0; i < array.count; i ++) {
        
        NSString * vcName = array[i];
        
        UIViewController * vc = [[NSClassFromString(vcName) alloc] init];
        vc.title = @"机智如我";
        vc.view.backgroundColor = [UIColor purpleColor];
        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:vc];
        vc.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"点击" style:UIBarButtonItemStylePlain target:self action:@selector(open)];
        
        [array replaceObjectAtIndex:i withObject:nav];
    }
    
    self.viewControllers = array;
    
}

-(void)open
{
    [[LXDrawerViewController sharedDrawerViewController] openDrawer];
}

@end
