//
//  UITableView+PlaceHolder.h
//  MYPlaceHolder
//
//  Created by michael on 2017/6/6.
//  Copyright © 2017年 MYPlaceHolder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (PlaceHolder)

// 使用 myReloadData 替换系统 reloadData
- (void)myReloadData;

@end
