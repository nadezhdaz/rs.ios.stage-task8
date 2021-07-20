//
//  PaletteViewController.m
//  RSSchool_T8
//
//  Created by Надежда Зенкова on 17.07.2021.
//

#import "HalfPresentationViewController.h"

@implementation HalfPresentationViewController

-(CGRect)frameOfPresentedViewInContainerView {
    if (CGRectIsEmpty(self.containerView.bounds)) {
        return CGRectZero;
    } else {
        return CGRectMake( 0, self.containerView.bounds.size.height / 2, self.containerView.bounds.size.width, self.containerView.bounds.size.height / 2);
    }
}

@end
