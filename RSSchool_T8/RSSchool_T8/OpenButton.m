//
//  OpenButton.m
//  RSSchool_T8
//
//  Created by Надежда Зенкова on 16.07.2021.
//

#import "OpenButton.h"
#import "UIColor+AppColors.h"

@implementation OpenButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setAppearance];
    }
    return self;
}

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setAppearance];
}

- (void)setAppearance {
    self.backgroundColor = [UIColor whiteColor];
    [self.layer setBorderColor: [UIColor colorPale].CGColor];
    self.layer.cornerRadius = 10.0;
    [self setTitleColor:[UIColor colorLightGreenSea] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18.0];
    self.titleEdgeInsets = UIEdgeInsetsMake(0, 21.0, 0, 21.0);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.layer.masksToBounds = YES;
    self.clipsToBounds = NO;
    self.layer.shadowColor = [UIColor colorPale].CGColor;
    self.layer.shadowOffset = CGSizeZero;
    self.layer.shadowRadius = 2;
    self.layer.shadowOpacity = 1.0;
}

- (void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted: highlighted];
    
    if (highlighted) {
        self.layer.shadowColor = [UIColor colorLightGreenSea].CGColor;
        self.layer.shadowRadius = 4;
    } else {
        self.layer.shadowColor = [UIColor colorPale].CGColor;
        self.layer.shadowRadius = 2;
    }
    
}

@end
