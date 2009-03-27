//
//  MeetappAppDelegate.m
//  Meetapp
//
//  Created by Steven Lehrburger on 3/23/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "MeetappAppDelegate.h"
#import "OrganizeTableViewController.h"
#import "AttendTableViewController.h"
#import "ExploreTableViewController.h"
#import "SettingsViewController.h"

@implementation MeetappAppDelegate

@synthesize window;
@synthesize tabBarController;


- (void)applicationDidFinishLaunching:(UIApplication *)application { 
	// this helps in debugging, so that you know "exactly" where your views are placed;
	// if you see "red", you are looking at the bare window, otherwise use black
	window.backgroundColor = [UIColor redColor];
	
	//set up a nav controller for each window (rather than a local one for all windows as in the blog WHY??)
	UINavigationController *organizeNavigationController;
	UINavigationController *attendNavigationController;
	UINavigationController *exploreNavigationController;
	UINavigationController *settingsNavigationController;

	// set up the window
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[window setBackgroundColor:[UIColor blackColor]];
	
	// create tab bar controller and array to hold the view controllers
	tabBarController = [[UITabBarController alloc] init];
	NSMutableArray *localControllersArray = [[NSMutableArray alloc] initWithCapacity:4];

	
	// setup the first view controller (Root view controller)
	OrganizeTableViewController *organizeTableViewController;
	AttendTableViewController *attendTableViewController;
	ExploreTableViewController *exploreTableViewController;
	SettingsViewController *settingsViewController;
	organizeTableViewController = [[OrganizeTableViewController alloc] initWithTabBar];
	attendTableViewController = [[AttendTableViewController alloc] initWithTabBar];
	exploreTableViewController = [[ExploreTableViewController alloc] initWithTabBar];
	settingsViewController = [[SettingsViewController alloc] initWithTabBar];

	
	// create the nav controller and add the root view controller as its first view
	organizeNavigationController = [[UINavigationController alloc] initWithRootViewController:organizeTableViewController];
	attendNavigationController = [[UINavigationController alloc] initWithRootViewController:attendTableViewController];
	exploreNavigationController = [[UINavigationController alloc] initWithRootViewController:exploreTableViewController];
	settingsNavigationController = [[UINavigationController alloc] initWithRootViewController:settingsViewController];
	
	
	// add the new nav controller (with the root view controller inside it) to the array of controllers
	[localControllersArray addObject:organizeNavigationController];
	[localControllersArray addObject:attendNavigationController];
	[localControllersArray addObject:exploreNavigationController];
	[localControllersArray addObject:settingsNavigationController];

	
	// release since we are done with this for now
	[organizeNavigationController release];
	[attendNavigationController release];
	[exploreNavigationController release];
	[settingsNavigationController release];
	
	[organizeTableViewController release];
	[attendTableViewController release];
	[exploreTableViewController release];
	[settingsViewController release];
	
	
	// load up our tab bar controller with the view controllers
	tabBarController.viewControllers = localControllersArray;
	
	// release the array because the tab bar controller now has it
	[localControllersArray release];
	
	// add the tabBarController as a subview in the window
	[window addSubview:tabBarController.view];
	
	// need this last line to display the window (and tab bar controller)
    [window makeKeyAndVisible];
}


- (void)dealloc {
	[tabBarController release];
    [window release];
    [super dealloc];
}


@end
