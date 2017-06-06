//
//  MYPlaceHolderDelegate.h
//  MYPlaceHolder
//
//  Created by michael on 2017/6/6.
//  Copyright © 2017年 MYPlaceHolder. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MYPlaceHolderDelegate <NSObject>

@required

- (UIView *)makePlaceHolderView;

@optional

- (BOOL)enableScrollWhenPlaceHolderViewShowing;

@end
