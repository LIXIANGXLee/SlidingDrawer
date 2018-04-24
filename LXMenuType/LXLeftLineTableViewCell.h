//
//  LXLeftLineTableViewCell.h
//  LXMenuType
//
//  Created by budgetoutsource on 2017/1/23.
//  Copyright © 2017年 LMTeam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LXLeftLineTableViewCell;

@protocol LXLeftLineTableViewCellDelegate <NSObject>

-(void)LXLeftLineTableViewCell:(LXLeftLineTableViewCell *)selfCell;

@end

@interface LXLeftLineTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIButton *l_img;


@property(weak,nonatomic)id <LXLeftLineTableViewCellDelegate>delegate;


@end
