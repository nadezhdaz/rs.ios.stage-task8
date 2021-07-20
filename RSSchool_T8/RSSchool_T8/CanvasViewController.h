//
//  CanvasViewController.h
//  RSSchool_T8
//
//  Created by Надежда Зенкова on 16.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TimerViewControllerDelegate

@optional
- (void)setTime:(float) time;

@end

@interface CanvasViewController : UIViewController <UIViewControllerTransitioningDelegate>

@end

NS_ASSUME_NONNULL_END
