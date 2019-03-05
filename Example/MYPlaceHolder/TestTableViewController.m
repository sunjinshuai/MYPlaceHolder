//
//  TestTableViewController.m
//  MYPlaceHolder
//
//  Created by michael on 2017/6/6.
//  Copyright © 2017年 MYPlaceHolder. All rights reserved.
//

#import "TestTableViewController.h"
#import "MYPlaceHolderView.h"
#import <MJRefresh.h>
#import <MYPlaceHolder.h>

#define RandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface TestTableViewController ()<UITableViewDelegate, UITableViewDataSource, MYPlaceHolderViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, assign, getter=isNoResult) BOOL noResult;

@end

@implementation TestTableViewController

static NSString * ID = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MYTableViewPlaceHolder";
    self.tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.view.backgroundColor = [UIColor yellowColor];
    self.dataSource = nil;
    [self setUpMJRefresh];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)setUpMJRefresh {
    __unsafe_unretained __typeof(self) weakSelf = self;
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
    }];
    
    // 马上进入刷新状态
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", @"Random Data", self.dataSource[indexPath.row]];
    return cell;
}

#pragma mark - 下拉刷新数据

- (void)loadNewData {
    if (!self.isNoResult) {
        self.dataSource = nil;
    } else {
        // 1.添加假数据
        for (int i = 0; i<5; i++) {
            [self.dataSource insertObject:RandomData atIndex:0];
        }
    }
    // 2.模拟1秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
                       // 刷新表格
                       [self.tableView myReloadData];
                       // 拿到当前的下拉刷新控件，结束刷新状态
                       [self.tableView.mj_header endRefreshing];
                   });
}

- (BOOL)isNoResult {
    _noResult = (self.dataSource.count == 0);
    return _noResult;
}

#pragma mark - CYLTableViewPlaceHolderDelegate Method

- (UIView *)makePlaceHolderView {
    MYPlaceHolderView *placeHolderView = [[MYPlaceHolderView alloc] initWithFrame:self.tableView.frame];
    placeHolderView.delegate = self;
    return placeHolderView;
}

#pragma mark - WeChatStylePlaceHolderDelegate Method

- (void)emptyOverlayClicked:(id)sender {
    [self.tableView.mj_header beginRefreshing];
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

@end
