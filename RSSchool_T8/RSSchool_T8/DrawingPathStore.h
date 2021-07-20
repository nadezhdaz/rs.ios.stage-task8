//
//  DrawingPathStore.h
//  RSSchool_T8
//
//  Created by Надежда Зенкова on 20.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DrawingPathStore : NSObject

+(UIBezierPath *) drawPlanetCanvasFirstPath;
+(UIBezierPath *) drawPlanetCanvasSecondPath;
+(UIBezierPath *) drawPlanetCanvasThirdPath;

+(UIBezierPath *) drawHeadCanvasFirstPath;
+(UIBezierPath *) drawHeadCanvasSecondPath;
+(UIBezierPath *) drawHeadCanvasThirdPath;

+(UIBezierPath *) drawTreeCanvasFirstPath;
+(UIBezierPath *) drawTreeCanvasSecondPath;
+(UIBezierPath *) drawTreeCanvasThirdPath;

+(UIBezierPath *) drawLandscapeCanvasFirstPath;
+(UIBezierPath *) drawLandscapeCanvasSecondPath;
+(UIBezierPath *) drawLandscapeCanvasThirdPath;

@end

NS_ASSUME_NONNULL_END
