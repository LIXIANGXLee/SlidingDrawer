//
//  LXLelfViewController.m
//  LXMenuType
//
//  Created by budgetoutsource on 2017/1/22.
//  Copyright © 2017年 LMTeam. All rights reserved.
//

#import "LXLelfViewController.h"

#import "UIView+extention.h"

#import "LXLeftLineTableViewCell.h"

#import "LXDrawerViewController.h"

#import "FitScaling.h"

#import "ahhahahahaViewController.h"


static NSString * identifier2 = @"LXLeftLineTableViewCell";

@interface LXLelfViewController ()<UITableViewDelegate,UITableViewDataSource,LXLeftLineTableViewCellDelegate>
@property(nonatomic,strong)UITableView * l_tableView;
@property(nonatomic,strong)NSMutableArray * dataSource;

@property(nonatomic,weak)UIImageView * headerImg;
@property(nonatomic,assign)CGRect origineheaderImgFrame;

@property(nonatomic,assign)BOOL  isTag;

@end

@implementation LXLelfViewController

-(NSMutableArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = [NSMutableArray arrayWithCapacity:0];
        NSDictionary * dic1 = @{@"lab":@"头像",@"img":@"tab_buddy_nor",@"selectImg":@"tab_buddy_press"};
        NSDictionary * dic2 = @{@"lab":@"空间",@"img":@"tab_qworld_nor",@"selectImg":@"tab_qworld_press"};
        NSDictionary * dic3 = @{@"lab":@"消息",@"img":@"tab_recent_nor",@"selectImg":@"tab_recent_press"};
        NSDictionary * dic5 = @{@"lab":@"消息",@"img":@"tab_recent_nor",@"selectImg":@"tab_recent_press"};
        NSDictionary * dic6 = @{@"lab":@"消息",@"img":@"tab_recent_nor",@"selectImg":@"tab_recent_press"};
        NSDictionary * dic7 = @{@"lab":@"消息",@"img":@"tab_recent_nor",@"selectImg":@"tab_recent_press"};
        NSDictionary * dic8 = @{@"lab":@"消息",@"img":@"tab_recent_nor",@"selectImg":@"tab_recent_press"};
        NSDictionary * dic9 = @{@"lab":@"消息",@"img":@"tab_recent_nor",@"selectImg":@"tab_recent_press"};
        NSDictionary * dic4 = @{@"lab":@"",@"img":@"",@"selectImg":@""};
        [_dataSource addObject:dic1];
        [_dataSource addObject:dic2];
        [_dataSource addObject:dic3];
        [_dataSource addObject:dic4];
         [_dataSource addObject:dic5];
         [_dataSource addObject:dic6];
         [_dataSource addObject:dic7];
         [_dataSource addObject:dic8];
         [_dataSource addObject:dic9];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self initTableView];
    [self initUI];
    
}

-(void)initTableView
{
    UIImageView * headerImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [[FitScaling sharedScaling] fittedWidth:300], 400)];
    headerImg.image = [UIImage imageNamed:@"scenery"];
    [self.view addSubview:headerImg];
    self.headerImg = headerImg;
    self.origineheaderImgFrame = headerImg.frame;
    
    _l_tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [[FitScaling sharedScaling] fittedWidth:300], self.view.LX_height) style:UITableViewStylePlain];
    _l_tableView.delegate = self;
    _l_tableView.dataSource = self;
    _l_tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_l_tableView];
    
    UIView * headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    headerView.backgroundColor = [UIColor clearColor];
    _l_tableView.tableHeaderView = headerView;
    
    
    UIView * footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.view.LX_height - 200 - [self.dataSource count] * 60)];
    footerView.backgroundColor = [UIColor  whiteColor];
    _l_tableView.tableFooterView = footerView;
    
    
}

-(void)initUI
{
    [_l_tableView registerNib:[UINib nibWithNibName:@"LXLeftLineTableViewCell" bundle:nil] forCellReuseIdentifier:identifier2];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    return 60;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return [self.dataSource count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
         LXLeftLineTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:identifier2 forIndexPath:indexPath];
    
         cell.delegate = self;
        
         [cell.l_img setImage:[UIImage imageNamed:[self.dataSource[indexPath.row ]  objectForKey:@"img"]] forState:UIControlStateNormal];
    
         [cell.l_img setImage:[UIImage imageNamed:[self.dataSource[indexPath.row ]  objectForKey:@"selectImg"]] forState:UIControlStateSelected];
    
          [cell.l_img setTitle:[self.dataSource[indexPath.row] objectForKey:@"lab"] forState:UIControlStateNormal];
    
          cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
   
}

#pragma mark - LXLeftLineTableViewCellDelegate
-(void)LXLeftLineTableViewCell:(LXLeftLineTableViewCell *)selfCell
{
    if (!_isTag) {
        
        _isTag = YES;
        NSIndexPath * index = [self.l_tableView indexPathForCell:selfCell];
        UIViewController * vc = [ahhahahahaViewController initWithTitle:[self.dataSource[index.row] objectForKey:@"lab"]];
        [[LXDrawerViewController sharedDrawerViewController] switchViewController:vc];
        
        [LXDrawerViewController sharedDrawerViewController].block = ^(){
        
            _isTag = NO;
        };
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = scrollView.contentOffset.y ;
    
    if (offsetY > 0) {
        self.headerImg.frame = ({
        
            CGRect frame = self.headerImg.frame;
            frame.origin.y = self.origineheaderImgFrame.origin.y - offsetY;
            frame;
        });
        
    }else{
    
        self.headerImg.frame = ({
            
            CGRect frame = self.headerImg.frame;
            frame.size.height = self.origineheaderImgFrame.size.height - offsetY;
            frame.size.width = self.origineheaderImgFrame.size.width*frame.size.height/self.origineheaderImgFrame.size.height;
            frame.origin.x = -(frame.size.width - self.origineheaderImgFrame.size.width) * 0.5;
            frame;
        });
    }
}

@end
