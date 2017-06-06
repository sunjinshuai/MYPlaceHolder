//
//  ViewController.m
//  MYPlaceHolder
//
//  Created by michael on 2017/6/6.
//  Copyright © 2017年 MYPlaceHolder. All rights reserved.
//

#import "ViewController.h"
#import "TestTableViewController.h"
#import "TestCollectionViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
