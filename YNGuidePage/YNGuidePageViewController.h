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

@property (nonatomic, assign) id<YNGuidePageDelegate> delegate;


- (void)guidePageControllerWithImages:(NSArray *)images;

- (void)guidePageControllerWithImages:(NSArray *)images isPageCtrlShow:(BOOL)isPageCtrlShow;

+ (BOOL)isShowGuide;

@end

NS_ASSUME_NONNULL_END
