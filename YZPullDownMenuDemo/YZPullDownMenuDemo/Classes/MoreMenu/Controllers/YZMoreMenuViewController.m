//
//  YZMoreMenuViewController.m
//  PullDownMenu
//
//  Created by yz on 16/8/12.
//  Copyright © 2016年 yz. All rights reserved.
//

#import "YZMoreMenuViewController.h"
#import "YZMoreMenuCell.h"
extern NSString * const YZUpdateMenuTitleNote;
static NSString * const ID = @"cell";

@interface YZMoreMenuViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSArray *titleArray;
// 记录选中的cell
@property (nonatomic, copy) NSMutableArray *selectCells;
@end

@implementation YZMoreMenuViewController
- (NSMutableArray *)selectCells
{
    if (_selectCells == nil) {
        _selectCells = [NSMutableArray array];
    }
    return _selectCells;
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    _titleArray = @[@"全部",@"录播课",@"直播课",@"线下课"];
    
    [self.tableView registerClass:[YZMoreMenuCell class] forCellReuseIdentifier:ID];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YZMoreMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.textLabel.text = _titleArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YZMoreMenuCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    cell.isSelected = !cell.isSelected;
    
    // 判断是否点击全部
    if (indexPath.row == 0) { // 全部
        if (cell.isSelected == YES) {
            // 选中其他所有cell
            [self selectAllCell];
        } else {
            // 取消所有cell选中
            [self unSelectAllCell];
        }
        return;
    }
    
    // 没有点击全部cell
    
    // 记录选中的cell,肯定不是全部
    if (cell.isSelected) {
        [self.selectCells addObject:cell];
    } else {
        [self.selectCells removeObject:cell];
    }
    
    // 判断选择所有cell
    if (self.selectCells.count == _titleArray.count - 1) {
        // 选中全部cell（全部）
        [self selectTotalCell];
    } else {
        // 取消选中全部cell（全部）
        [self unSelectTotalCell];
    }
    
   
}

// 选中全部cell
- (void)selectTotalCell
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    YZMoreMenuCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.isSelected = YES;
}

// 取消全部cell
- (void)unSelectTotalCell
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    YZMoreMenuCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.isSelected = NO;
}

// 取消选中所有cell
- (void)unSelectAllCell
{
    // 取消之前所有选中cell
    [self.selectCells removeAllObjects];
    
    NSInteger count = _titleArray.count;
    for (int i = 0; i < count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        YZMoreMenuCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        cell.isSelected = NO;
    }
}

// 选中所有cell
- (void)selectAllCell
{
    // 取消之前所有选中cell
    [self.selectCells removeAllObjects];
    
    NSInteger count = _titleArray.count;
    for (int i = 0; i < count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        YZMoreMenuCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        cell.isSelected = YES;
        
        if (i > 0) {
            [self.selectCells addObject:cell];
        }
    }
}

// 点击了确定
- (IBAction)clickSure:(id)sender {
    NSArray *titles = [self.selectCells valueForKeyPath:@"textLabel.text"];
    
    // 更新菜单标题
    [[NSNotificationCenter defaultCenter] postNotificationName:YZUpdateMenuTitleNote object:self userInfo:@{@"arr":titles}];
}

@end
