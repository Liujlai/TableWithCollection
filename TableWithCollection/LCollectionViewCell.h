//
//  LCollectionViewCell.h
//  TableWithCollection
//
//  Created by idea on 2018/4/27.
//  Copyright © 2018年 idea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCollectionViewItem.h"

@protocol LCollectionCellDelegate<NSObject>
@required
-(void)didDelete:(UICollectionViewCell *)cell;
@end

@interface LCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) LCollectionViewItem *item;
@property (nonatomic, assign) id<LCollectionCellDelegate> delegate;

@end
