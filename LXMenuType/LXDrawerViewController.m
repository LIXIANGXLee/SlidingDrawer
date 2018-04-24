//
//  LXDrawerViewController.m
//  LXMenuType
//
//  Created by budgetoutsource on 2017/1/22.
//  Copyright © 2017年 LMTeam. All rights reserved.
//

#import "LXDrawerViewController.h"

#import "LMBaseButton.h"

@interface LXDrawerViewController ()

@property(nonatomic,strong)LXLelfViewController *lelfViewController;

@property(nonatomic,strong)LXMainViewController *mainViewController;

@property(nonatomic,assign)CGFloat maxWidth;

@property(nonatomic,strong)LMBaseButton *coverButton;

@property(nonatomic,assign)CGAffineTransform transformM;
@property(nonatomic,assign)CGAffineTransform transformL;


@property(nonatomic,strong)UIViewController * haha;

@end

@implementation LXDrawerViewController

{
    CGFloat _index;

}

static LXDrawerViewController * _drawerViewController;
+ (instancetype)sharedDrawerViewController {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _drawerViewController = [[LXDrawerViewController alloc] init];
    });
    
    return _drawerViewController;
}

-(LMBaseButton *)coverButton{
    if (!_coverButton) {
        _coverButton = [LMBaseButton createLMBaseButton];
        _coverButton.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        _coverButton.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.7f];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeDrawer)];
        [_coverButton addGestureRecognizer:tapGesture];
        
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(screenCloseGestureRecognizer:)];
        [_coverButton addGestureRecognizer:panGesture];
    }
    return _coverButton;
}

-(void)screenCloseGestureRecognizer:(UIPanGestureRecognizer *)pan
{

    CGFloat offsetX = [pan translationInView:_coverButton].x;
    if (offsetX > 0 ) return;
    
    [UIView animateWithDuration:0.2f animations:^{
        
        if (pan.state  == UIGestureRecognizerStateChanged && ABS(offsetX) < self.maxWidth) {
            self.mainViewController.view.transform  = CGAffineTransformTranslate( self.transformM , offsetX, 0);
            
            self.lelfViewController.view.transform = CGAffineTransformTranslate( self.transformL , _index * offsetX, 0);
            
        }else if (pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled){
            
            if (ABS(offsetX) > [UIScreen mainScreen].bounds.size.width * 0.5) {
                 [self closeDrawer];
                
            }else{
              
                 [self openDrawer];
            }
        }
    }];
}

+(LXDrawerViewController *)drawerWithMainViewController:(LXMainViewController *)mainViewController leftViewConreoller:(LXLelfViewController *)leftViewController maxWidth:(CGFloat)maxWidth{
    
    LXDrawerViewController * drawerViewController = [LXDrawerViewController sharedDrawerViewController];
    
    drawerViewController.lelfViewController = leftViewController;
    drawerViewController.maxWidth = maxWidth;
    [drawerViewController.view addSubview:leftViewController.view];
    [drawerViewController addChildViewController:leftViewController];
    drawerViewController.lelfViewController.view.frame = CGRectMake(-drawerViewController.maxWidth * 0.3, 0, maxWidth, [UIScreen mainScreen].bounds.size.height);

    drawerViewController.mainViewController = mainViewController;
    [drawerViewController.view addSubview:mainViewController.view];
    [drawerViewController addChildViewController:mainViewController];
    for (UIViewController * VC in drawerViewController.mainViewController.childViewControllers) {
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:drawerViewController action:@selector(screenEdgePanGestureRecognizer:)];
        [VC.view addGestureRecognizer:panGesture];
    }
    return drawerViewController;
}

-(void)screenEdgePanGestureRecognizer:(UIScreenEdgePanGestureRecognizer *)pan
{
    
    CGFloat offSetX = [pan translationInView:pan.view].x;
    
    if (offSetX < 0) return;
    
    [UIView animateWithDuration:0.2f animations:^{
        
        if (pan.state  == UIGestureRecognizerStateChanged && offSetX < self.maxWidth) {
            
            
            self.mainViewController.view.transform  = CGAffineTransformMakeTranslation(offSetX, 0);
            self.transformM = self.mainViewController.view.transform;
            
            self.lelfViewController.view.transform = CGAffineTransformMakeTranslation(offSetX * _index, 0);
            self.transformL = self.lelfViewController.view.transform;
            
        }else if (pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled){
        
            if (offSetX > [UIScreen mainScreen].bounds.size.width * 0.5) {
                [self openDrawer];
            }else{
                [self closeDrawer];
            }
        }
    }];
}


//打开抽屉
-(void)openDrawer
{
    [UIView animateWithDuration:0.2f delay:0.0f options:UIViewAnimationOptionCurveLinear animations:^{
        
        self.mainViewController.view.transform = CGAffineTransformMakeTranslation(self.maxWidth, 0);
        
        self.lelfViewController.view.transform = CGAffineTransformMakeTranslation(self.maxWidth * _index, 0) ;

        self.transformM = self.mainViewController.view.transform;
        self.transformL = self.lelfViewController.view.transform;
    } completion:^(BOOL finished) {
        
        [self.mainViewController.view addSubview:self.coverButton];
        [UIView animateWithDuration:0.2f animations:^{
            _coverButton.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.7f];
        }];
        
    }];
 
}

//关闭抽屉
-(void)closeDrawer
{
    
    [UIView animateWithDuration:0.2f delay:0.0f options:UIViewAnimationOptionCurveLinear animations:^{
        
        self.mainViewController.view.transform = CGAffineTransformIdentity;
        
        self.lelfViewController.view.transform = CGAffineTransformIdentity;
        self.transformM = self.mainViewController.view.transform;
        self.transformL = self.lelfViewController.view.transform;
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:0.2f animations:^{
             _coverButton.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.0f];
        }];
       

        [self.coverButton removeFromSuperview];
    }];
}

/// - parameter viewController: 跳转目标控制器

-(void)switchViewController:(UIViewController *)VC

{
    [self addChildViewController:VC];
    self.haha = VC;
    [self.view addSubview:VC.view];
    
    
    VC.view.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
    
    [UIView animateWithDuration:0.2 animations:^{
        
        VC.view.transform = CGAffineTransformIdentity;
        
    }];
}

 /// 返回到左侧控制器
-(void)switchBackMainViewController
{
    [UIView animateWithDuration:0.2 animations:^{
        
        self.haha.view.transform = CGAffineTransformMakeTranslation([UIScreen mainScreen].bounds.size.width, 0);
        
        if (_block) {
            _block();
        }
        
    } completion:^(BOOL finished) {
        
        [self.haha removeFromParentViewController];
        [self.haha.view removeFromSuperview];
        
    }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    _index = 0.3;
}


@end
