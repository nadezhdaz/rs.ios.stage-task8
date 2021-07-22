//
//  PaletteViewController.h
//  RSSchool_T8
//
//  Created by Надежда Зенкова on 19.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PaletteViewControllerDelegate

@optional
- (void)setColorsArray:(NSMutableArray <UIColor *> *)colors;

@end

@interface PaletteViewController : UIViewController

@property (weak, nonatomic, nullable) id<PaletteViewControllerDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
