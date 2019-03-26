//
//  ZPCategoryTableViewController.m
//  级联菜单
//
//  Created by apple on 2016/12/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPCategoryTableViewController.h"
#import "ZPCategory.h"

static NSString *ID = @"cell";

@interface ZPCategoryTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *categoriesArray;

@end

@implementation ZPCategoryTableViewController

#pragma mark ————— 懒加载 —————
- (NSArray *)categoriesArray
{
    if (_categoriesArray == nil)
    {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"categories" ofType:@"plist"]];
        
        NSMutableArray *tempMulArray = [NSMutableArray array];
        
        for (NSDictionary *dict in dictArray)
        {
            ZPCategory *category = [ZPCategory categoryWithDict:dict];
            [tempMulArray addObject:category];
        }
        
        _categoriesArray = tempMulArray;
    }
    
    return _categoriesArray;
}

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}

#pragma mark ————— UITableViewDataSource —————
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.categoriesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    ZPCategory *category = [self.categoriesArray objectAtIndex:indexPath.row];
    
    /**
     UITableView控件的cell分为普通(normal)状态和高亮(highlighted)状态；
     当cell被选中的时候，cell里面的所有子控件都变为高亮状态，"cell.textLabel.highlighted = YES"。
     */
    
    //设置cell在普通状态下的图片：
    cell.imageView.image = [UIImage imageNamed:category.icon];
    
    //设置cell在高亮状态下的图片：
    cell.imageView.highlightedImage = [UIImage imageNamed:category.highlighted_icon];
    
    cell.textLabel.text = category.name;
    
    //设置cell的textLabel控件在高亮状态下的文字颜色
    cell.textLabel.highlightedTextColor = [UIColor greenColor];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark ————— UITableViewDelegate —————
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(categoryTableViewController:didSelectSubCategories:)])
    {
        ZPCategory *category = [self.categoriesArray objectAtIndex:indexPath.row];
        
        [self.delegate categoryTableViewController:self didSelectSubCategories:category.subcategories];
    }
}

@end
