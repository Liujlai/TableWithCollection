//
//  LTableViewCell.h
//  TableWithCollection
//
//  Created by idea on 2018/4/27.
//  Copyright © 2018年 idea. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LTableViewCellDelegate<NSObject>
-(void)didChangeCell:(UITableViewCell *)cell;
@end

@interface LTableViewCell : UITableViewCell
@property (nonatomic, assign) id<LTableViewCellDelegate> delegate;

@end
