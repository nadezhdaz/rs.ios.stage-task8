//
//  CanvasViewController.m
//  RSSchool_T8
//
//  Created by Надежда Зенкова on 16.07.2021.
//

#import "CanvasViewController.h"
#import "UIColor+AppColors.h"
#import "PaletteViewController.h"
#import "OpenButton.h"
#import "CanvasView.h"
#import <RSSchool_T8-Swift.h>

typedef enum {
    idle,
    draw,
    done,
} ScreenState;

@interface CanvasViewController () <TimerViewControllerDelegate, PaletteViewControllerDelegate, DrawingViewControllerDelegate, CanvasViewDelegate>

@property (weak, nonatomic) CanvasView *canvasView;
@property (weak, nonatomic) IBOutlet OpenButton *paletteButton;
@property (weak, nonatomic) IBOutlet OpenButton *timerButton;
@property (weak, nonatomic) IBOutlet OpenButton *drawButton;
@property (weak, nonatomic) IBOutlet OpenButton *shareButton;
@property (strong, nonatomic) DrawingsViewController *drawingsViewController;
@property (strong, nonatomic) PaletteViewController *paletteViewController;
@property (strong, nonatomic) TimerViewController *timerViewController;
@property (weak, nonatomic, nullable) id<PaletteViewControllerDelegate> paletteDelegate;
@property (weak, nonatomic, nullable) id<TimerViewControllerDelegate> timerDelegate;
@property (weak, nonatomic, nullable) id<DrawingViewControllerDelegate> drawingDelegate;
@property (weak, nonatomic, nullable) id<CanvasViewDelegate> canvasDelegate;

@end

@implementation CanvasViewController

@synthesize pattern;

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.canvasView = [[CanvasView alloc] initWithFrame:CGRectMake(38, 40, 300, 300)];
    [self.canvasView.layer setBorderColor:[UIColor colorChillSky].CGColor];
    [self.canvasView.layer setShadowColor:[UIColor colorChillSky].CGColor];
    self.canvasView.delegate = self;
    self.pattern = 1;
    self.time = 1.0;
    self.colors = [NSMutableArray arrayWithObjects:[UIColor colorDefaultBlack], [UIColor colorDefaultBlack], [UIColor colorDefaultBlack], nil];
    //self.canvasView.layer.borderColor = [UIColor colorChillSky].CGColor;
    
    [self setupCanvasView:self.canvasView];
    [self updateScreenState:idle];
    
    //[self setupButtons];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:true];
    [self setupNavigationItems];
    //self.canvasView.layer.borderColor = [UIColor colorChillSky].CGColor;
}

- (IBAction)paletteButtonPressed:(id)sender {
    if (self.paletteViewController == nil) {
        self.paletteViewController = [PaletteViewController new];;
        self.paletteViewController.delegate = self;
    }
    [self addChildViewController:self.paletteViewController];
    [self.view addSubview:self.paletteViewController.view];
    self.paletteViewController.view.frame = [self frameForChildController];
    [self.paletteViewController didMoveToParentViewController:self];
}

- (IBAction)timerButtonPressed:(id)sender {
    if (self.timerViewController == nil) {
        self.timerViewController = [TimerViewController new];
        self.timerViewController.delegate = self;
        
    }
    [self addChildViewController:self.timerViewController];
    [self.view addSubview:self.timerViewController.view];
    self.timerViewController.view.frame = [self frameForChildController];
    [self.timerViewController didMoveToParentViewController:self];
}
- (IBAction)drawButtonPressed:(id)sender {
    if ([self.drawButton.currentTitle isEqualToString:@"Reset"]) {
        [self updateScreenState:idle];
    } else {
        [self updateScreenState:draw];
        [self.canvasView drawPattern:self.pattern time:self.time colors:self.colors];
    }
}

- (IBAction)shareButtonPressed:(id)sender {
    UIGraphicsBeginImageContext(self.canvasView.bounds.size);
    [self.canvasView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *drawing = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *pngData = UIImagePNGRepresentation(drawing);    
    
    UIActivityViewController *activityViewControntroller = [[UIActivityViewController alloc] initWithActivityItems:@[pngData] applicationActivities:nil];
    activityViewControntroller.popoverPresentationController.sourceView = self.canvasView;
    [self presentViewController:activityViewControntroller animated:YES completion:nil];
    
}

-(void)setupCanvasView:(UIView*)view {
    view.layer.cornerRadius = 8;
    view.layer.borderColor = [UIColor colorChillSky].CGColor;
    view.layer.masksToBounds = NO;
    view.layer.shadowOffset = CGSizeZero;
    view.layer.shadowRadius = 4;
    view.layer.shadowOpacity = 1.0;
}

-(void)setupNavigationItems {
    self.navigationController.navigationBar.tintColor = [UIColor colorLightGreenSea];
    self.navigationItem.title = @"Artist";
    UIBarButtonItem *drawings = [[UIBarButtonItem alloc] initWithTitle:@"Drawings"
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(nextTapped:)];
    self.navigationItem.rightBarButtonItem = drawings;
    
    NSDictionary *attributes = @{
                                    NSForegroundColorAttributeName: [UIColor colorLightGreenSea],
                                    NSFontAttributeName: [UIFont fontWithName:@"Montserrat-Regular" size:17.0]
                                 };
    NSDictionary *titleAttributes = @{
                                    NSFontAttributeName: [UIFont fontWithName:@"Montserrat-Regular" size:17.0]
                                 };
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:attributes forState: UIControlStateNormal];
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:attributes forState: UIControlStateHighlighted];
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:attributes forState: UIControlStateNormal];
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:attributes forState: UIControlStateHighlighted];
    
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:titleAttributes];
}

- (void)nextTapped:(id)sender {
    if (self.drawingsViewController == nil) {
        self.drawingsViewController = [DrawingsViewController new];;
        self.drawingsViewController.delegate = self;
    }
    
    [self.navigationController pushViewController:self.drawingsViewController animated:YES];
}

- (void)backToRootTapped:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)updateScreenState:(ScreenState)state {
    switch (state) {
        case idle:
            self.paletteButton.alpha = 1.0;
            [self.paletteButton setUserInteractionEnabled:YES];
            self.timerButton.alpha = 1.0;
            [self.timerButton setUserInteractionEnabled:YES];
            self.drawButton.alpha = 1.0;
            [self.drawButton setUserInteractionEnabled:YES];
            [self.drawButton setTitle:@"Draw" forState:UIControlStateNormal];
            self.shareButton.alpha = 0.5;
            [self.shareButton setUserInteractionEnabled:NO];
            [self.canvasView.layer.sublayers makeObjectsPerformSelector:@selector(removeFromSuperlayer)];
            break;
        case draw:
            [self.paletteButton setUserInteractionEnabled:NO];
            self.paletteButton.alpha = 0.5;
            [self.timerButton setUserInteractionEnabled:NO];
            self.timerButton.alpha = 0.5;
            [self.drawButton setUserInteractionEnabled:NO];
            self.drawButton.alpha = 0.5;
            [self.shareButton setUserInteractionEnabled:NO];
            self.shareButton.alpha = 0.5;
            break;
        case done:
            self.shareButton.alpha = 1.0;
            [self.shareButton setUserInteractionEnabled:YES];
            self.drawButton.alpha = 1.0;
            [self.drawButton setUserInteractionEnabled:YES];
            [self.drawButton setTitle:@"Reset" forState:UIControlStateNormal];
            break;
    }
}

-(CGRect)frameForChildController {
    CGRect mainViewRect = self.view.bounds;
    if (CGRectIsEmpty(mainViewRect)) {
        return CGRectZero;
    } else {
        return CGRectMake(0, mainViewRect.size.height / 2, mainViewRect.size.width, mainViewRect.size.height / 2);
    }
}

- (void)screenStateDone {
    [self updateScreenState:done];
}

- (void)setColorsArray:(NSMutableArray<UIColor *> *)colors {
    self.colors = colors;
}

- (void)setTimeForTimer:(float)time {
    self.time = time;
}

- (void)setImagePattern:(NSInteger)pattern {
    self.pattern = pattern;
}


@end
