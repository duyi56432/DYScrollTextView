//
//  ViewController.m
//  DYScollTextView
//
//  Created by 杜燚 on 2019/1/21.
//  Copyright © 2019年 dayunwenchuang. All rights reserved.
//

#import "ViewController.h"
#import "DYScrollTextView.h"

@interface ViewController () <DYScrollTextViewDelegate>
@property (nonatomic, strong) NSArray *dataArray;
@property (nonatomic, strong) DYScrollTextView *scrollTextView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = @[@"最长寿男性去世",@"各大卫视春晚阵容",@"陈汉典回应演小品",@"易烊千玺囚服",@"陈昱霖ins",@"个税不填房东信息",@"联合国维和遇袭"];
    _scrollTextView = [[DYScrollTextView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 90)];
    _scrollTextView.delegate = self;
    _scrollTextView.intervalTime = 3;
    _scrollTextView.scrollPosition = DYScrollPositionTop;
    [self.view addSubview:_scrollTextView];
    _scrollTextView.cellHeight = 30;
    [_scrollTextView start];
    
    UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    changeButton.frame = CGRectMake(12, 300, self.view.bounds.size.width - 24, 45);
    changeButton.backgroundColor = [UIColor colorWithRed:243/255.0 green:59/255.0 blue:116/255.0 alpha:1];
    [changeButton setTitle:@"改变方向" forState:UIControlStateNormal];
    changeButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [changeButton addTarget:self action:@selector(changeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:changeButton];
    
}

- (void)changeButtonClick:(UIButton *)sender {
    if (_scrollTextView.scrollPosition == DYScrollPositionBottom) {
        _scrollTextView.scrollPosition = DYScrollPositionTop;
    } else {
        _scrollTextView.scrollPosition = DYScrollPositionBottom;
    }
    
    [_scrollTextView reloadData];
}

- (NSInteger)numberOfscrollTextView:(DYScrollTextView *)scrollTextView {
    return _dataArray.count;
}

- (UITableViewCell *)scrollTextTableView:(UITableView *)scrollTextTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [scrollTextTableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"UITableViewCell"];
    }
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

@end
