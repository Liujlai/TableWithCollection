//
//  LCollectionViewCell.m
//  TableWithCollection
//
//  Created by idea on 2018/4/27.
//  Copyright © 2018年 idea. All rights reserved.
//

#import "LCollectionViewCell.h"
#import "NerdyUI.h"

@interface LCollectionViewCell()
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UIButton *delBtn;
@end

@implementation LCollectionViewCell


-(void)delCell{
    if([self.delegate respondsToSelector:@selector(didDelete:)]){
        [self.delegate didDelete:self];
    }
}

- (void)setItem:(LCollectionViewItem *)item
{
    self.icon.image = item.image;
    self.delBtn.hidden = item.delBtnHidden;
}


-(UIImageView *)icon
{
    if (_icon == nil) {
        _icon = [[UIImageView alloc]init];
        [self.contentView addSubview:_icon];
        _icon.makeCons(^{
            make.left.constants(20);
            make.top.constants(10);
            make.width.height.constants(80);
        });
    }
    return _icon;
}
- (UIButton *)delBtn
{
    if (_delBtn == nil) {
        _delBtn = [[UIButton alloc] init];
        _delBtn.img(@"del");
        [self.contentView addSubview:_delBtn];
        _delBtn.onClick(@"delCell");
        _delBtn.makeCons(^{
            make.top.equal.view(self.icon);
            make.right.equal.view(self.icon);
            make.width.height.constants(20);
        });
    }
    return _delBtn;
    
}

@end
