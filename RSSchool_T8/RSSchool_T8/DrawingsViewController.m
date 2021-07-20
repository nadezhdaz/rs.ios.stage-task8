//
//  DrawingsViewController.m
//  RSSchool_T8
//
//  Created by Надежда Зенкова on 17.07.2021.
//

#import "DrawingsViewController.h"
#import "UIColor+AppColors.h"

@interface DrawingsViewController ()

@end

@implementation DrawingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:true];
    [self setupButtons];
    self.navigationItem.title = @"Drawings";
}

-(void)setupButtons {
    
}

- (void)backToRootTapped:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)patternButtonTapped:(id)sender {
    
    //let nextViewController = MainScreen2()
    //nextViewController.delegate = self // HERE WHERE YOU SET THE DELEGATE
    //navigationController?.pushViewController(nextViewController, animated: true)
    
    [self.navigationController popToRootViewControllerAnimated:YES];
            
}

@end
