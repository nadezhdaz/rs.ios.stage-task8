//
//  ColorButton.h
//  RSSchool_T8
//
//  Created by Надежда Зенкова on 19.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ColorButton : UIButton

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color;
- (void)setDefaultFrame;

@property (strong, nonatomic) UIView * colorSubview;
@property (strong, nonatomic) NSString * colorName;

@end

NS_ASSUME_NONNULL_END
