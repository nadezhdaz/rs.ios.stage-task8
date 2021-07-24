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

@property (assign, nonatomic) NSInteger pattern;

@optional
- (void)setImagePattern:(NSInteger)pattern;



@end

@interface CanvasViewController : UIViewController <UIViewControllerTransitioningDelegate>

@property (assign, nonatomic) float time;
@property (assign, nonatomic) NSInteger drawingPattern;
@property (strong, nonatomic) NSMutableArray <UIColor *> *colors;

@end

NS_ASSUME_NONNULL_END
