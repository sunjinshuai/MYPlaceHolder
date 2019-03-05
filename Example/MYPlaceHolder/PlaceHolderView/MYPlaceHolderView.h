//
//  MYPlaceHolderView.h
//  MYPlaceHolder_Example
//
//  Created by sunjinshuai on 2019/3/5.
//  Copyright © 2019 sunjinshuai. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MYPlaceHolderViewDelegate <NSObject>

@required
- (void)emptyOverlayClicked:(id)sender;

@end

@interface MYPlaceHolderView : UIView

@property (nonatomic, weak) id<MYPlaceHolderViewDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
