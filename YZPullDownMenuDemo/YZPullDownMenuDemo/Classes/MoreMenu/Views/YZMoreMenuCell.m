//
//  YZMoreMenuCell.m
//  PullDownMenu
//
//  Created by yz on 16/8/13.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "YZMoreMenuCell.h"

@interface YZMoreMenuCell ()

@property (nonatomic, strong) UIButton *cheakView;

@end

@implementation YZMoreMenuCell

- (UIButton *)cheakView
{
    if (_cheakView == nil) {
        
        _cheakView = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_cheakView setImage:[UIImage imageNamed:@"搜索-更多-未选中"] forState:UIControlStateNormal];
        
        [_cheakView setImage:[UIImage imageNamed:@"搜索-更多-已选中"] forState:UIControlStateSelected];
        
        [_cheakView sizeToFit];
        
        self.accessoryView = _cheakView;
    }
    return _cheakView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.cheakView.hidden = NO;
    }
    return self;
}
- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    
    self.cheakView.selected = isSelected;
}


@end
