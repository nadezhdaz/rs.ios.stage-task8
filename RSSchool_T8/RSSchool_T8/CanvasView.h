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

@protocol CanvasViewDelegate <NSObject>

-(void)screenStateDone;

@end

@interface CanvasView : UIView

@property (weak, nonatomic, nullable) id<CanvasViewDelegate> delegate;
@property (assign, nonatomic) DrawingPattern *drawingPattern;
@property (assign, nonatomic) float time;
@property (strong, nonatomic) NSMutableArray <UIColor *> *colors;
@property (strong, nonatomic) NSArray<CAShapeLayer*> *layers;
@property (assign, nonatomic) int pattern;
@property (strong, nonatomic, nullable) NSTimer *timer;

-(void)drawPattern;

@end

NS_ASSUME_NONNULL_END
