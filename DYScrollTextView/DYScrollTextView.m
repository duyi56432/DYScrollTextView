//
//  DYScrollTextView.m
//  DYScollTextView
//
//  Created by 杜燚 on 2019/1/21.
//  Copyright © 2019年 dayunwenchuang. All rights reserved.
//

#import "DYScrollTextView.h"

@interface DYScrollTextView () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger number;
@end

@implementation DYScrollTextView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self loadUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadUI];
    }
    return self;
}

- (void)loadUI {
    _intervalTime = 2;
    _cellHeight = 20.0;
    
    _tableView = [[UITableView alloc] initWithFrame:self.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    _tableView.backgroundColor = self.backgroundColor;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 1, 1)];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:_tableView];
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    [self initData];
    _timer = [NSTimer scheduledTimerWithTimeInterval:_intervalTime target:self selector:@selector(scorll) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    _timer.fireDate = [NSDate distantFuture];
}

- (void)initData {
    if (self.scrollPosition == DYScrollPositionTop) {
        self.number = 0;
        [self.tableView scrollsToTop];
    } else if (self.scrollPosition == DYScrollPositionBottom) {
        self.number = _count * 99;
        [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.number inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    }
}

- (void)scorll {
    if (_count == 0) return;
    
    if (self.scrollPosition == DYScrollPositionTop) {
        if (self.number == _count * 99) {
            [self initData];
        } else {
            self.number++;
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.number inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];
        }
    } else if (self.scrollPosition == DYScrollPositionBottom) {
        if (self.number == 0) {
            [self initData];
        } else {
            self.number--;
            [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.number inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
        }
    }
}

- (void)start {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_intervalTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.timer.fireDate = [NSDate date];
        [self.tableView reloadData];
    });
}

- (void)stop {
    _timer.fireDate = [NSDate distantFuture];
}

- (void)reloadData {
    [self initData];
    [self.tableView reloadData];
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (newSuperview == nil) {
        [_timer invalidate];
        _timer = nil;
    }
}
#pragma mark - <UITableViewDelegate,UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if ([self.delegate respondsToSelector:@selector(numberOfscrollTextView:)]) {
        _count = [self.delegate numberOfscrollTextView:self];
        return (_count * 100);
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.delegate respondsToSelector:@selector(scrollTextTableView:cellForRowAtIndexPath:)]) {
        return [self.delegate scrollTextTableView:self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row % _count inSection:indexPath.section]];
    }
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _cellHeight;
}

@end
