//
//  CanvasView.m
//  RSSchool_T8
//
//  Created by Надежда Зенкова on 19.07.2021.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//
//  This code was generated by Trial version of PaintCode, therefore cannot be used for commercial purposes.
//

#import "CanvasView.h"
#import "UIColor+AppColors.h"
#import "DrawingPathStore.h"
#import "NSMutableArray+Shuffle.h"

@implementation CanvasView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setAppearance];
        self.time = 1.0/(60.0*1.0);
        self.pattern = 1;
        self.colors = [NSMutableArray arrayWithObjects:[UIColor colorDefaultBlack], [UIColor colorDefaultBlack], [UIColor colorDefaultBlack], nil];
        self.layers = [NSMutableArray arrayWithObjects:[self createNewLayer], [self createNewLayer], [self createNewLayer], nil];
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setAppearance];
}

-(void)setAppearance {
    [self setBackgroundColor:[UIColor whiteColor]];
    [self.layer setShadowRadius:4.0];
    [self.layer setShadowOpacity:1.0];
    [self.layer setShadowOffset:CGSizeZero];
    [self.layer setCornerRadius:8.0];
    [self.layer setBorderColor:[UIColor colorChillSky].CGColor];
    [self.layer setShadowColor:[UIColor colorChillSky].CGColor];
}

-(void)setCurrentLayers:(int)pattern {
    //CAShapeLayer *self.layers[0] = [self createNewLayer];
    //CAShapeLayer *self.layers[1] = [self createNewLayer];
    //CAShapeLayer *self.layers[2] = [self createNewLayer];
    
    [self.colors shuffle];
    
    switch (pattern) {
        case 0:
            self.layers[0].path = [DrawingPathStore drawPlanetCanvasFirstPath].CGPath;
            self.layers[1].path = [DrawingPathStore drawPlanetCanvasSecondPath].CGPath;
            self.layers[2].path = [DrawingPathStore drawPlanetCanvasThirdPath].CGPath;
            self.layers[2].lineWidth = 1;
            self.layers[0].strokeColor = self.colors[0].CGColor;
            self.layers[1].strokeColor = self.colors[1].CGColor;
            self.layers[2].strokeColor = self.colors[2].CGColor;
            break;
            
        case 1:
            self.layers[0].path = [DrawingPathStore drawHeadCanvasFirstPath].CGPath;
            self.layers[1].path = [DrawingPathStore drawHeadCanvasSecondPath].CGPath;
            self.layers[2].path = [DrawingPathStore drawHeadCanvasThirdPath].CGPath;
            self.layers[1].lineWidth = 1;
            self.layers[0].strokeColor = self.colors[0].CGColor;
            self.layers[1].strokeColor = self.colors[1].CGColor;
            self.layers[2].strokeColor = self.colors[2].CGColor;
            break;
            
        case 2:
            self.layers[0].path = [DrawingPathStore drawTreeCanvasFirstPath].CGPath;
            self.layers[1].path = [DrawingPathStore drawTreeCanvasSecondPath].CGPath;
            self.layers[2].path = [DrawingPathStore drawTreeCanvasThirdPath].CGPath;
            self.layers[2].lineWidth = 0.5;
            self.layers[0].strokeColor = self.colors[0].CGColor;
            self.layers[1].strokeColor = self.colors[1].CGColor;
            self.layers[2].strokeColor = self.colors[2].CGColor;
            break;
            
        case 3:
            self.layers[0].path = [DrawingPathStore drawLandscapeCanvasFirstPath].CGPath;
            self.layers[1].path = [DrawingPathStore drawLandscapeCanvasSecondPath].CGPath;
            self.layers[2].path = [DrawingPathStore drawLandscapeCanvasThirdPath].CGPath;
            self.layers[2].lineWidth = 0.5;
            self.layers[0].strokeColor = self.colors[0].CGColor;
            self.layers[1].strokeColor = self.colors[1].CGColor;
            self.layers[2].strokeColor = self.colors[2].CGColor;
            break;
    }
    
}

-(void)drawPattern {
    [self drawPattern:self.pattern];
}

-(void)drawPattern:(int)pattern {
    [self setCurrentLayers:pattern];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval: 0.01
                                                  target:self
                                                selector:@selector(updateTimer)
                                                userInfo:nil
                                                 repeats:YES];
    [self.timer setTolerance:0.01];
}

-(void)updateTimer {
    CAShapeLayer *currentLayer = self.layers[0];
    if (currentLayer.strokeEnd > 1){
        [self.timer invalidate];
        [self setTimer:nil];
        [self.delegate screenStateDone];
        return;
    }
    if (currentLayer.strokeEnd < 1)  {
        for (CAShapeLayer *layer in self.layers) {
            layer.strokeEnd += self.time;
        }
    }
}

-(CAShapeLayer *)createNewLayer {
    CAShapeLayer* layer = [CAShapeLayer layer];
    [layer setStrokeStart:0];
    [layer setStrokeEnd:0];
    [layer setFillColor: [UIColor clearColor].CGColor];
    [layer setStrokeColor: [UIColor colorDefaultBlack].CGColor];
    [layer setLineWidth: 1.0];
    [layer setFrame: self.bounds];
    layer.lineCap = kCALineCapRound;
    layer.lineJoin = kCALineJoinRound;
    [self.layer addSublayer:layer];
    return layer;
}

@end
