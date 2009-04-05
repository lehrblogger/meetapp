//
//  MeetappAppDelegate.m
//  Meetapp
//
//  Created by Steven Lehrburger on 3/23/09.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import "MeetappAppDelegate.h"
#import "OrganizeTableViewController.h"
#import "AttendTableViewController.h"
#import "ExploreTableViewController.h"
#import "SettingsViewController.h"

@implementation MeetappAppDelegate

@synthesize window, tabBarController, dataManager;

- (void)applicationDidFinishLaunching:(UIApplication *)application { 
	NSInteger myId = 6376832;
	NSString *myKey = @"5636775624194f22c6362e39225c51";
	http://api.meetup.com/groups.json/?member_id=6376832
	dataManager = [[MADataManager alloc] initWithMemberIdAndKey:myId key:myKey ];
	[dataManager updateAllData];
	
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
	organizeTableViewController = [[OrganizeTableViewController alloc] initWithTabBarAndDataManager:dataManager];
	attendTableViewController = [[AttendTableViewController alloc] initWithTabBarAndDataManager:dataManager];
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
	[dataManager release];
	[tabBarController release];
	[window release];
	[super dealloc];
}


@end
