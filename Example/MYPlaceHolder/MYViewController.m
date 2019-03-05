//
//  MYViewController.m
//  MYPlaceHolder
//
//  Created by sunjinshuai on 03/05/2019.
//  Copyright (c) 2019 sunjinshuai. All rights reserved.
//

#import "MYViewController.h"
#import "TestCollectionViewController.h"
#import "TestTableViewController.h"

@interface MYViewController ()

@end

@implementation MYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.title = @"占位图";
}

/// 测试tableView占位图
- (IBAction)testTableViewPlaceHolder:(UIButton *)sender {
    TestTableViewController *test = [[TestTableViewController alloc] init];
    [self.navigationController pushViewController:test animated:YES];
}

/// 测试collectionView占位图
- (IBAction)testCollectionViewPlaceHolder:(UIButton *)sender {
    TestCollectionViewController *test = [[TestCollectionViewController alloc] init];
    [self.navigationController pushViewController:test animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
