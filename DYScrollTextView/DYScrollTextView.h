//
//  DYScrollTextView.h
//  DYScollTextView
//
//  Created by 杜燚 on 2019/1/21.
//  Copyright © 2019年 dayunwenchuang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DYScrollTextView;

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,DYScrollPosition) {
    DYScrollPositionTop,
    DYScrollPositionBottom
};
@protocol DYScrollTextViewDelegate <NSObject>

- (NSInteger)numberOfscrollTextView:(DYScrollTextView *)scrollTextView;

- (UITableViewCell *)scrollTextTableView:(UITableView *)scrollTextTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface DYScrollTextView : UIView
@property (nonatomic, weak) id<DYScrollTextViewDelegate> delegate;

/**
 cell高度,默认20
 */
@property (nonatomic, assign) CGFloat cellHeight;

/**
 滚动间隔时间，默认2s
 */
@property (nonatomic, assign) NSInteger intervalTime;


/**
 滚动方向，默认向上滚动
 */
@property (nonatomic, assign) DYScrollPosition scrollPosition;

- (void)start;

- (void)stop;

- (void)reloadData;
@end

NS_ASSUME_NONNULL_END
