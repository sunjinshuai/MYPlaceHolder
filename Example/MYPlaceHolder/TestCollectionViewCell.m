//
//  TestCollectionViewCell.m
//  MYPlaceHolder_Example
//
//  Created by sunjinshuai on 2019/3/5.
//  Copyright © 2019 sunjinshuai. All rights reserved.
//

#import "TestCollectionViewCell.h"

@implementation TestCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *textLabel = [UILabel new];
        textLabel.frame = self.contentView.bounds;
        textLabel.textColor = [UIColor blueColor];
        textLabel.font = [UIFont systemFontOfSize:17.0];
        [self.contentView addSubview:textLabel];
        self.textLabel = textLabel;
    }
    return self;
}

@end
