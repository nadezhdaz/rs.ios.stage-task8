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
- (void)setTimeForTimer:(float) time;

@end

@protocol DrawingViewControllerDelegate

@optional
- (void)setImagePattern:(int)pattern;

@end

@interface CanvasViewController : UIViewController <UIViewControllerTransitioningDelegate>

@property (assign, nonatomic) float time;
@property (assign, nonatomic) int pattern;
@property (strong, nonatomic) NSMutableArray <UIColor *> *colors;

@end

NS_ASSUME_NONNULL_END
