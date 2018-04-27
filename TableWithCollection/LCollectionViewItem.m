//
//  LCollectionViewItem.m
//  TableWithCollection
//
//  Created by idea on 2018/4/27.
//  Copyright © 2018年 idea. All rights reserved.
//

#import "LCollectionViewItem.h"

@implementation LCollectionViewItem


- (instancetype)init{
    if ((self = [super init])) {
        _delBtnHidden = NO;
        _image = [UIImage imageNamed:@"add"];
    }
    return self;
}

@end
