//
//  LXLeftLineTableViewCell.m
//  LXMenuType
//
//  Created by budgetoutsource on 2017/1/23.
//  Copyright © 2017年 LMTeam. All rights reserved.
//

#import "LXLeftLineTableViewCell.h"

@interface LXLeftLineTableViewCell ()

@property(nonatomic,strong)UIButton * lastBtn;

@end
@implementation LXLeftLineTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (IBAction)clickBtn:(UIButton *)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(LXLeftLineTableViewCell:)]) {
            [_delegate LXLeftLineTableViewCell:self];
        }
}

@end
