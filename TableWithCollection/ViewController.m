//
//  ViewController.m
//  TableWithCollection
//
//  Created by idea on 2018/4/27.
//  Copyright © 2018年 idea. All rights reserved.
//

#import "ViewController.h"
#import "NerdyUI.h"
#import "LTableViewCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,LTableViewCellDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self tableView];
    self.tableView.estimatedRowHeight = 100.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

-(UITableView *)tableView
{
    if(_tableView == nil){
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;

        //        _tableView.tableFooterView = [UIView new];
        //        [_tableView registerClass:[ThirdCell class] forCellReuseIdentifier:@"cell"];
        [self.view addSubview:_tableView];
        _tableView.makeCons(^{
            make.edge.equal.constants(0);
        });
    }
    return _tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ID = [NSString stringWithFormat:@"LTableViewCell%ld",indexPath.row];
    LTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(cell == nil){
        cell = [LTableViewCell.alloc initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.delegate = self;
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)didChangeCell:(UITableViewCell *)cell {
    [self.tableView reloadData];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone animated:NO];
}



@end
