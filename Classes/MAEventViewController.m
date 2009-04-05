//
//  AttendEventViewController.m
//  Meetapp
//
//  Created by Steven Lehrburger on 3/26/09.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import "MAEventViewController.h"


@implementation MAEventViewController

@synthesize testText;
@synthesize eventData;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/
- (id) initWithEvent:(MAEventData*)aEventData {
	self = [super init];
	if (self)
	{
		self.eventData = aEventData;
		self.title = NSLocalizedString(eventData.eventName, @"");
	}
	return self;
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	NSLog(@"Loading view");
	UIView *contentView = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
	contentView.backgroundColor = [UIColor blackColor];
	contentView.autoresizesSubviews = YES;
	
	// Levi: Create the dimensions and centered position for our label
	// screen width / 2 - label width / 2
	CGFloat x = 320/2 - 120/2;
	// screen height / 2 - label height / 2
	CGFloat y = 480/2 - 45/2;
	CGRect rect = CGRectMake(x , y, 240.0f, 100.0f);

	self.testText = [[[UITextView alloc] initWithFrame:rect] autorelease];
	[testText setText:eventData.description];
	[testText setTextAlignment:UITextAlignmentLeft];
	
	[contentView addSubview:testText];
	self.view = contentView;
	[contentView release];
}


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
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
	[testText release];
	[super dealloc];
}


@end
