//
//  ZPSubCategoryTableViewController.m
//  级联菜单
//
//  Created by apple on 2016/12/12.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPSubCategoryTableViewController.h"
#import "ZPCategoryTableViewController.h"

@interface ZPSubCategoryTableViewController () <ZPCategoryTableViewControllerDelegate>

@property (nonatomic, strong) NSArray *subCategoriesArray;

@end

static NSString *ID = @"cell1";

@implementation ZPSubCategoryTableViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}

#pragma mark ————— ZPCategoryTableViewControllerDelegate —————
-(void)categoryTableViewController:(ZPCategoryTableViewController *)categoryTableViewController didSelectSubCategories:(NSArray *)subCategories
{
    self.subCategoriesArray = subCategories;
    
    [self.tableView reloadData];
}

#pragma mark ————— UITableViewDataSource —————
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.subCategoriesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.textLabel.text = [self.subCategoriesArray objectAtIndex:indexPath.row];
    
    return cell;
}

@end
