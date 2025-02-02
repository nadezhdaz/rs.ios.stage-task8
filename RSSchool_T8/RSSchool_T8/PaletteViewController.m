//
//  PaletteViewController.m
//  RSSchool_T8
//
//  Created by Надежда Зенкова on 19.07.2021.
//

#import "PaletteViewController.h"
#import "UIColor+AppColors.h"
#import "ColorButton.h"
#import "CanvasView.h"

@interface PaletteViewController ()

@property (nonatomic, strong) NSMutableArray<ColorButton*> * colorsToDrawArray;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation PaletteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupButtons];
    [self setupView];
    self.colorsToDrawArray = [NSMutableArray new];
    //self.canvasView = [CanvasView new];
}
- (IBAction)saveButtonTapped:(id)sender {
    [self setColorsArrayToCanvasView];
    [self willMoveToParentViewController:nil];
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

-(void)setColorsArrayToCanvasView {
    NSMutableArray *arrayWithcolors = [NSMutableArray new];
    for (ColorButton * button in self.colorsToDrawArray) {
        [arrayWithcolors addObject:button.colorSubview.backgroundColor];
    }
    while (arrayWithcolors.count < 3) {
        [arrayWithcolors addObject:[UIColor colorDefaultBlack]];
    }    
    [self.delegate setColorsArray:arrayWithcolors];
}

- (void)tapColor:(ColorButton *)sender {
    if ([self.colorsToDrawArray containsObject:sender]) {
        [self.colorsToDrawArray removeObject:sender];
        
        [sender setDefaultFrame];
        [self.view setBackgroundColor:[UIColor whiteColor]];
    } else {
        if (self.colorsToDrawArray.count >= 3) {
            [self.colorsToDrawArray.firstObject setDefaultFrame];
            [self.colorsToDrawArray removeObjectAtIndex:0];
        }
        [self.colorsToDrawArray addObject:sender];
        [self.view setBackgroundColor:sender.colorSubview.backgroundColor];        
        if (self.timer.isValid) {
            [self.timer invalidate];
        }
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(setDefaultBackgroundColor) userInfo:nil repeats:NO];
    }
}

- (void)setDefaultBackgroundColor {
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setupView {
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.layer.cornerRadius = 40.0;
    self.view.layer.shadowColor = [UIColor colorPale].CGColor;
    self.view.layer.shadowRadius = 4.0;
    self.view.layer.shadowOpacity = 1.0;
    self.view.layer.shadowOffset = CGSizeZero;
    self.view.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner;
}

- (void)setupButtons {
    ColorButton *buttonRed = [[ColorButton alloc] initWithFrame:CGRectMake(0+17, 92, 40, 40) color:[UIColor colorRed]];
    ColorButton *buttonBlue = [[ColorButton alloc] initWithFrame:CGRectMake(60+17, 92, 40, 40)  color:[UIColor colorBlue]];
    ColorButton *buttonGreen = [[ColorButton alloc] initWithFrame:CGRectMake(120+17, 92, 40, 40)  color:[UIColor colorGreen]];
    ColorButton *buttonGray = [[ColorButton alloc] initWithFrame:CGRectMake(180+17, 92, 40, 40)  color:[UIColor colorGray]];
    ColorButton *buttonViolet = [[ColorButton alloc] initWithFrame:CGRectMake(240+17, 92, 40, 40)  color:[UIColor colorViolet]];
    ColorButton *buttonPeach = [[ColorButton alloc] initWithFrame:CGRectMake(300+17, 92, 40, 40)  color:[UIColor colorPeach]];
    ColorButton *buttonOrange = [[ColorButton alloc] initWithFrame:CGRectMake(0+17, 152, 40, 40)  color:[UIColor colorOrange]];
    ColorButton *buttonLightBlue = [[ColorButton alloc] initWithFrame:CGRectMake(60+17, 152, 40, 40)  color:[UIColor colorLightBlue]];
    ColorButton *buttonPink = [[ColorButton alloc] initWithFrame:CGRectMake(120+17, 152, 40, 40)  color:[UIColor colorPink]];
    ColorButton *buttonBlack = [[ColorButton alloc] initWithFrame:CGRectMake(180+17, 152, 40, 40)  color:[UIColor colorBlack]];
    ColorButton *buttonDarkGreen = [[ColorButton alloc] initWithFrame:CGRectMake(240+17, 152, 40, 40)  color:[UIColor colorDarkGreen]];
    ColorButton *buttonBrown = [[ColorButton alloc] initWithFrame:CGRectMake(300+17, 152, 40, 40)  color:[UIColor colorBrown]];
    
    [buttonRed addTarget:self action:@selector(tapColor:) forControlEvents:UIControlEventTouchUpInside];
    [buttonBlue addTarget:self action:@selector(tapColor:) forControlEvents:UIControlEventTouchUpInside];
    [buttonGreen addTarget:self action:@selector(tapColor:) forControlEvents:UIControlEventTouchUpInside];
    [buttonGray addTarget:self action:@selector(tapColor:) forControlEvents:UIControlEventTouchUpInside];
    [buttonViolet addTarget:self action:@selector(tapColor:) forControlEvents:UIControlEventTouchUpInside];
    [buttonPeach addTarget:self action:@selector(tapColor:) forControlEvents:UIControlEventTouchUpInside];
    [buttonOrange addTarget:self action:@selector(tapColor:) forControlEvents:UIControlEventTouchUpInside];
    [buttonLightBlue addTarget:self action:@selector(tapColor:) forControlEvents:UIControlEventTouchUpInside];
    [buttonPink addTarget:self action:@selector(tapColor:) forControlEvents:UIControlEventTouchUpInside];
    [buttonBlack addTarget:self action:@selector(tapColor:) forControlEvents:UIControlEventTouchUpInside];
    [buttonDarkGreen addTarget:self action:@selector(tapColor:) forControlEvents:UIControlEventTouchUpInside];
    [buttonBrown addTarget:self action:@selector(tapColor:) forControlEvents:UIControlEventTouchUpInside];
    
    buttonRed.colorName = @"red";
    buttonBlue.colorName = @"blue";
    buttonGreen.colorName = @"green";
    buttonGray.colorName = @"gray";
    buttonViolet.colorName = @"violet";
    buttonPeach.colorName = @"peach";
    buttonOrange.colorName = @"orange";
    buttonLightBlue.colorName = @"light blue";
    buttonPink.colorName = @"pink";
    buttonBlack.colorName = @"black";
    buttonDarkGreen.colorName = @"dark green";
    buttonBrown.colorName = @"brown";
    
    [self.view addSubview:buttonRed];
    [self.view addSubview:buttonBlue];
    [self.view addSubview:buttonGreen];
    [self.view addSubview:buttonGray];
    [self.view addSubview:buttonViolet];
    [self.view addSubview:buttonPeach];
    [self.view addSubview:buttonOrange];
    [self.view addSubview:buttonLightBlue];
    [self.view addSubview:buttonPink];
    [self.view addSubview:buttonBlack];
    [self.view addSubview:buttonDarkGreen];
    [self.view addSubview:buttonBrown];
}

@end
