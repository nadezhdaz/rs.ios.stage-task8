//
//  ColorButton.m
//  RSSchool_T8
//
//  Created by Надежда Зенкова on 19.07.2021.
//

#import "ColorButton.h"
#import "UIColor+AppColors.h"

@implementation ColorButton

- (instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupSubview:color];
        [self setupButton];
    }
    return self;
}

- (void)setupButton{
    
    [self.layer setCornerRadius:10.0];
    [self.layer setShadowOffset:CGSizeZero];
    [self.layer setShadowRadius:2.0];
    [self.layer setShadowOpacity:1.0];
    [self.layer setShadowColor:[UIColor colorPale].CGColor];
    [self addSubview:self.colorSubview];
}

-(void)setupSubview:(UIColor *)color {
    self.colorSubview = [[UIView alloc] init];
    self.colorSubview.backgroundColor = color;
    self.colorName = @"test name";
    self.colorSubview.userInteractionEnabled = NO;
    [self setDefaultFrame];
    [self addSubview:self.colorSubview];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];

    if (highlighted) {
            [self.colorSubview setFrame:CGRectMake(2, 2, 36, 36)];
            [self.colorSubview.layer setCornerRadius:8.0];
            //self.superview.backgroundColor = self.colorSubview.backgroundColor;
            [self layoutIfNeeded];
    }

}

- (void)setDefaultFrame {
    [self.colorSubview setFrame:CGRectMake(8, 8, 24, 24)];
    [self.colorSubview.layer setCornerRadius:6.0];
}

@end
