//
//  TestCollectionViewController.m
//  MYPlaceHolder
//
//  Created by michael on 2017/6/6.
//  Copyright © 2017年 MYPlaceHolder. All rights reserved.
//

#import "TestCollectionViewController.h"
#import "MYPlaceHolderView.h"
#import "TestCollectionViewCell.h"
#import <MJRefresh.h>
#import <MYPlaceHolder.h>

#define RandomData [NSString stringWithFormat:@"随机数据---%d", arc4random_uniform(1000000)]

@interface TestCollectionViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, MYPlaceHolderViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, assign, getter=isNoResult) BOOL noResult;

@end

@implementation TestCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"MYCollectionViewPlaceHolder";
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Register cell classes
    [self.collectionView registerClass:[TestCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([TestCollectionViewCell class])];
    
    self.dataSource = nil;
    [self setUpMJRefresh];
}

- (void)setUpMJRefresh {
    __unsafe_unretained __typeof(self) weakSelf = self;
    
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadNewData];
    }];
    
    // 马上进入刷新状态
    [self.collectionView.mj_header beginRefreshing];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([TestCollectionViewCell class]) forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", @"Random Data", self.dataSource[indexPath.row]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 55);
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
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [self.collectionView myReloadData];
        // 拿到当前的下拉刷新控件，结束刷新状态
        [self.collectionView.mj_header endRefreshing];
    });
}

- (BOOL)isNoResult {
    _noResult = (self.dataSource.count == 0);
    return _noResult;
}

#pragma mark - CYLTableViewPlaceHolderDelegate Method
- (UIView *)makePlaceHolderView {
    MYPlaceHolderView *placeHolderView = [[MYPlaceHolderView alloc] initWithFrame:self.collectionView.frame];
    placeHolderView.delegate = self;
    return placeHolderView;
}

#pragma mark - WeChatStylePlaceHolderDelegate Method

- (void)emptyOverlayClicked:(id)sender {
    [self.collectionView.mj_header beginRefreshing];
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

@end
