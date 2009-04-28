//
//  MAToolbarController.m
//  Meetapp
//
//  Created by Steven Lehrburger on 4/27/09.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import "MAToolbarController.h"
#import "MADataManager.h"


@implementation MAToolbarController

@synthesize contentViewController = _contentViewController;
@synthesize toolbar = _toolbar;
@synthesize dataManager = _dataManager;
@synthesize updateLabel;

-(id)initWithContentViewControllerAndDataManager:(UIViewController*)contentViewController manager:(MADataManager*)dataManager {
	self = [super init];
	if (self) {
		_contentViewController = [contentViewController retain];
		if ([_contentViewController isKindOfClass:[UINavigationController class]]) {
			((UINavigationController*)_contentViewController).delegate = self;
		}
		_dataManager = [dataManager retain];
	}
	return self;
}


// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	UIView* contentView = _contentViewController.view;
	CGRect frame = contentView.frame;
	UIView* view = [[UIView alloc] initWithFrame:frame];
	
	frame = CGRectMake(0, 0, frame.size.width, frame.size.height - 44.0f);
	contentView.frame = frame;
	[view addSubview:contentView];

	frame = CGRectMake(0.0f, frame.size.height, frame.size.width, 44.0f);
	_toolbar = [[UIToolbar alloc] initWithFrame:frame];
	[view addSubview:_toolbar];
 
	self.view = view;
	[view release];
	[_toolbar release];
}

/*
- (void)navigationController:(UINavigationController *)navigationController 
			willShowViewController:(UIViewController *)viewController animated:(BOOL)animated;
{
	NSArray* items = nil;
	if ([viewController respondsToSelector:@selector(toolbarItems)]) {
		items = [viewController performSelector:@selector(toolbarItems)];
	}
	[_toolbar setItems:items animated:animated];
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
 
	UIBarButtonItem *refreshButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
																																										 target:self action:@selector(startLoadingData)];
 
	// flex item used to separate the left groups items and right grouped items
	UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
																																						target:nil
																																						action:nil];
	CGRect frame = _contentViewController.view.frame;
	CGRect updateLabelRect = CGRectMake(50, frame.size.height - 44, frame.size.width - 50 , 44);
	updateLabel = [[UILabel alloc] initWithFrame:updateLabelRect];
	updateLabel.backgroundColor = [UIColor clearColor];
	updateLabel.opaque = NO;
	updateLabel.textColor = [UIColor whiteColor];
	updateLabel.highlightedTextColor = [UIColor whiteColor];
	updateLabel.textAlignment = UITextAlignmentRight;
	updateLabel.font = [UIFont boldSystemFontOfSize: 13];
	updateLabel.text = [self.dataManager getLastUpdatedString];
	UIBarButtonItem *lastUpdateItem = [[UIBarButtonItem alloc] init];
	lastUpdateItem.customView = updateLabel;
 
	NSArray *items = [NSArray arrayWithObjects: refreshButtonItem, flexItem, lastUpdateItem, nil];
	[self.toolbar setItems:items animated:NO];
 
	[refreshButtonItem release];
	[flexItem release];
	[updateLabel release];
	[lastUpdateItem release];
}

- (void)startLoadingData {
	[self.dataManager updateAllData];
	updateLabel.text = [self.dataManager getLastUpdatedString];
}
	/*
- (void)dataDidLoad {	
	
	//reload tables 	[self.tableView reloadData];
	//stop icon spinning
	//change update text
	
 }
 */	





/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
	// Release anything that's not essential, such as cached data
}


- (void)dealloc {
	[_contentViewController	release];
	[super dealloc];
}


@end
