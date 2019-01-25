//
//  YNImageGuideViewController.h
//  YNGuidePageDemo
//
//  Created by liyangly on 2019/1/25.
//  Copyright © 2019 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YNImageGuideDelegate <NSObject>

- (void)clickEnterFormGuide;

@end

NS_ASSUME_NONNULL_BEGIN

@interface YNImageGuideViewController : UIViewController

@property (nonatomic, assign) id<YNImageGuideDelegate> delegate;

// set pageControl Rect
@property (nonatomic, assign) CGRect pageControlRect;
// set "next" button Rect
@property (nonatomic, assign) CGRect nextBtnRect;


- (void)guidePageControllerWithImages:(NSArray *)images;

/**
 initwith background image and "next" button action

 @param images  guide page background image name list
 @param hasNext  have "next" button action
 */
- (void)guidePageControllerWithImages:(NSArray *)images hasNext:(BOOL)hasNext;

+ (BOOL)isShowGuide;

@end

NS_ASSUME_NONNULL_END
