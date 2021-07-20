//
//  CustomTransition.m
//  RSSchool_T8
//
//  Created by Надежда Зенкова on 18.07.2021.
//

#import "CustomTransition.h"
#import "HalfPresentationViewController.h"
#import "PresentAnimation.h"

@implementation CustomTransition

NSTimeInterval duration = 0.3;

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return [[HalfPresentationViewController alloc] initWithPresentedViewController:presented presentingViewController:presenting];
    //presentationController = [[HalfPresentationViewController alloc] initWithPresentedViewController:presented presentingViewController:presenting ?? source];
}

//- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
 //                                                                 presentingController:(UIViewController *)presenting
 //                                                                     sourceController:(UIViewController *)source {
//    return PresentAnimation;
//}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController * fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    CGRect finalFrame = [transitionContext finalFrameForViewController:fromVC];
    
    fromVC.view.frame = CGRectOffset(finalFrame, 0, finalFrame.size.height);//  finalFrame.origin. .offsetBy(0, finalFrame.size.height);
    UIViewPropertyAnimator * animator = [[UIViewPropertyAnimator alloc] initWithDuration:duration curve:UIViewAnimationCurveEaseOut animations:^{ fromVC.view.frame = finalFrame;
    }];
    [animator addCompletion:^(UIViewAnimatingPosition finalPosition) { [transitionContext completeTransition: ![transitionContext transitionWasCancelled]];}];
    [animator startAnimation];
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return duration;
}

@end
