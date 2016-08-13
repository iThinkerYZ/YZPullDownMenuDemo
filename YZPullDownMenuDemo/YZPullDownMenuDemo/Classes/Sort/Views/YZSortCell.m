//
//  YZSortCell.m
//  PullDownMenu
//
//  Created by yz on 16/8/13.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "YZSortCell.h"

@interface YZSortCell ()

@property (nonatomic, strong) UIImageView *cheakView;

@end

@implementation YZSortCell

- (UIImageView *)cheakView
{
    if (_cheakView == nil) {
        _cheakView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"选中对号"]];
        self.accessoryView = _cheakView;
    }
    return _cheakView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    self.cheakView.hidden = !selected;
}

- (void)awakeFromNib {
    // Initialization code
}

@end
