//
//  YNGuidePageViewController.m
//  TagsCart
//
//  Created by liyangly on 2019/1/23.
//  Copyright © 2019 makeupopular.com. All rights reserved.
//

#import "YNGuidePageViewController.h"

#define s_w [UIScreen mainScreen].bounds.size.width
#define s_h [UIScreen mainScreen].bounds.size.height
#define YN_SHOW_GUIDEPAGE @"YN_SHOW_GUIDEPAGE"

@interface YNGuidePageViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;

@property (nonatomic, strong) NSArray *imgList;

@end

@implementation YNGuidePageViewController

- (void)guidePageControllerWithImages:(NSArray *)images {
    [self guidePageControllerWithImages:images isPageCtrlShow:YES];
}

- (void)guidePageControllerWithImages:(NSArray *)images isPageCtrlShow:(BOOL)isPageCtrlShow {
    
    // scrollview
    self.imgList = images;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, s_w, s_h)];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    self.scrollView.contentSize = CGSizeMake(s_w * images.count, 0);
    [self.view addSubview:self.scrollView];
    
    // btn
    for (NSInteger i = 0; i < images.count; i ++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(s_w * i, 0, s_w, s_h);
        [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        btn.adjustsImageWhenHighlighted = NO;
        [self.scrollView addSubview:btn];
        
        btn.tag = i;
        if (i == images.count - 1) {
            [btn addTarget:self action:@selector(clickEnter) forControlEvents:UIControlEventTouchUpInside];
        } else {
            [btn addTarget:self action:@selector(clickNext:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    if (isPageCtrlShow) {
        // pageControl
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, s_w / 2, 30)];
        self.pageControl.center = CGPointMake(s_w / 2, s_h - 95);
        [self.view addSubview:self.pageControl];
        self.pageControl.numberOfPages = images.count;
    }
    
}

- (void)clickNext:(UIButton *)sender {
    
    [UIView animateWithDuration:0.2 animations:^{
        self.scrollView.contentOffset = CGPointMake(s_w * (sender.tag + 1), 0);
    }];
    [self.scrollView.superview layoutIfNeeded];
    
    if (self.pageControl) {
        self.pageControl.currentPage = self.scrollView.contentOffset.x / s_w;
    }
}

- (void)clickEnter {
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(clickEnterFormGuide)]) {
        [self.delegate clickEnterFormGuide];
    }
}

+ (BOOL)isShowGuide {
    // you can change the boolean value to control the GuidePage's showing
    BOOL isShowGuidePage = [[[NSUserDefaults standardUserDefaults] objectForKey:YN_SHOW_GUIDEPAGE] boolValue];
    if (!isShowGuidePage) {
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - ScrollerView Delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if (self.pageControl) {
        self.pageControl.currentPage = scrollView.contentOffset.x / s_w;
    }
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    // if swiping left in the last guide page, do 'YNGuidePageDelegate' func
    if (velocity.x > 0 && scrollView.contentOffset.x == s_w*self.imgList.count) {
        [self clickEnter];
    }
}

@end
