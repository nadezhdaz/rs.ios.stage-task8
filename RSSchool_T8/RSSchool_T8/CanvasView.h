//
//  CanvasView.h
//  RSSchool_T8
//
//  Created by Надежда Зенкова on 19.07.2021.
//

#import <UIKit/UIKit.h>
#import "CanvasViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, DrawingPattern) {
    planet,
    head,
    tree,
    landscape
};

@protocol CanvasViewDelegate

@optional
-(void)screenStateDone;
-(CAShapeLayer *)clearLayers;
//-(void)setColors;

@end

@interface CanvasView : UIView

@property (weak, nonatomic, nullable) id<CanvasViewDelegate> delegate;
@property (assign, nonatomic) float currentStep;
@property (strong, nonatomic) NSArray<CAShapeLayer*> *layers;
@property (strong, nonatomic, nullable) NSTimer *timer;

-(void)drawPattern:(NSInteger)pattern time:(float)time colors:(NSMutableArray <UIColor *> *)colors ;

@end

NS_ASSUME_NONNULL_END
