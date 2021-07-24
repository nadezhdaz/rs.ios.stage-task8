//
//  AppDelegate.m
//  RSSchool_T8
//
//  Created by Надежда Зенкова on 16.07.2021.
//

#import "AppDelegate.h"
#import "CanvasViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController: [[CanvasViewController alloc] initWithNibName:@"CanvasViewController" bundle:nil]];
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    
    return YES;
}


@end
