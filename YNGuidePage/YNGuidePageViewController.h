//
//  YNGuidePageViewController.h
//  TagsCart
//
//  Created by liyangly on 2019/1/23.
//  Copyright © 2019 makeupopular.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YNGuidePageDelegate <NSObject>

- (void)clickEnterFormGuide;

@end

NS_ASSUME_NONNULL_BEGIN

@interface YNGuidePageViewController : UIViewController

// set pageControl's frame
@property (nonatomic, assign) CGRect pageControlRect;

@property (nonatomic, assign) id<YNGuidePageDelegate> delegate;


- (void)guidePageControllerWithImages:(NSArray *)images;

+ (BOOL)isShowGuide;

@end

NS_ASSUME_NONNULL_END
