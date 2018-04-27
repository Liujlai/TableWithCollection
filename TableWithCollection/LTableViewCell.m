//
//  LTableViewCell.m
//  TableWithCollection
//
//  Created by idea on 2018/4/27.
//  Copyright © 2018年 idea. All rights reserved.
//

#import "LTableViewCell.h"
#import "NerdyUI.h"
#import "LCollectionViewCell.h"
#import "LCollectionViewItem.h"
@interface LTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,LCollectionCellDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray<LCollectionViewItem *>*itemsArray;
@end

@implementation LTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}


-(void)setup{
    LCollectionViewItem *item = [LCollectionViewItem new];
    item.delBtnHidden = YES;
    _itemsArray = [NSMutableArray arrayWithObject:item];
//    [self.contentView addSubview:self.collectionView];
    self.collectionView.embedIn(self.contentView, 0).makeCons(^{
        make.height.constants(100);
    });
}


- (void)didDelete:(UICollectionViewCell *)cell
{
    NSIndexPath *indexpath = [self.collectionView indexPathForCell:cell];
    [self.itemsArray removeObjectAtIndex:indexpath.row];
    [self reloadCell];
}

-(void)reloadCell{
    [self.collectionView reloadData];
//    这个地方使用makeCons会约束冲突---> 改为updateCons
    self.collectionView.updateCons(^{
        make.height.constants(self.collectionView.collectionViewLayout.collectionViewContentSize.height);
        
    });
    [self.delegate didChangeCell:self];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.itemsArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionViewCell" forIndexPath:indexPath];
    cell.delegate = self;
    cell.item = self.itemsArray[indexPath.row];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    LCollectionViewItem *item = [LCollectionViewItem new];
    item.image = [UIImage imageNamed:@"example"];
    if (indexPath.row == self.itemsArray.count -1) {
        [self.itemsArray insertObject:item atIndex:self.itemsArray.count - 1];
    }else{
        self.itemsArray[indexPath.row] = item;
    }
    [self reloadCell];
}


-(UICollectionView *)collectionView
{
    if(_collectionView == nil){
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout.alloc init];
        layout.itemSize = CGSizeMake(125, 100);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [UICollectionView.alloc initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[LCollectionViewCell class] forCellWithReuseIdentifier:@"collectionViewCell"];
    }
    return _collectionView;
}

@end
