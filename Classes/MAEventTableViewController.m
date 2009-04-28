//
//  AttendTableViewController.m
//  Meetapp
//
//  Created by Steven Lehrburger on 3/23/09.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import "MAEventTableViewController.h"
#import "MAEventViewController.h"
#import "MAEventTableViewCell.h"
#import "MAEventData.h"
#import <JSON/JSON.h>

@implementation MAEventTableViewController

@synthesize memberId, organizeEventsArray, attendEventsArray;


- (id)initWithMemberId:(NSString*)aMemberId {
	if (self = [super init]) {
		self.memberId = aMemberId;
	}
	return self;
}

	
- (void)viewDidLoad {
	[super viewDidLoad];
	
	
	// configure segmented control
	NSArray *segmentTextContent = [NSArray arrayWithObjects:
																 NSLocalizedString(@"Attend", @""),
																 NSLocalizedString(@"Organize", @""),
																 nil];
	UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:segmentTextContent];
	segmentedControl.selectedSegmentIndex = 0;
	segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
	[segmentedControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
	self.navigationItem.titleView = segmentedControl;
	[segmentedControl release];
	
	[self.tableView reloadData];
}


- (void)segmentAction:(id)sender {
	UISegmentedControl* segCtl = sender;
	// the segmented control was clicked, handle it here 
	NSLog(@"segment clicked %d", [segCtl selectedSegmentIndex]);
	[self.tableView reloadData];
}

- (void)reloadTableData:(NSMutableArray*)events {
	[self recreateFilteredArrays:events];
	NSLog(@"reloading table data");
	[self.tableView reloadData];
}

- (void)recreateFilteredArrays:(NSMutableArray*)events {
	//TODO release events in arrays
	[self.attendEventsArray release];
	[self.organizeEventsArray release];
	
	self.attendEventsArray = [[NSMutableArray alloc] init];
	self.organizeEventsArray = [[NSMutableArray alloc] init];
	
	for (id elem in events) {
		MAGroupData *group = [(MAEventData*)elem getGroup];
		NSString *organizeprofileURL = [group getOrganizerProfileURL];
		
		if ([organizeprofileURL hasSuffix: [memberId	stringByAppendingString:@"/"]]) {
			[self.organizeEventsArray addObject:elem];
		}
		[self.attendEventsArray addObject:elem];
	}
}


	/*
	CGRect frame = CGRectMake(0.0, 0.0, 25.0, 25.0);
	UIActivityIndicatorView *loading = [[UIActivityIndicatorView alloc] initWithFrame:frame];
	[loading startAnimating];
	[loading sizeToFit];
	loading.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin |
								UIViewAutoresizingFlexibleRightMargin |
								UIViewAutoresizingFlexibleTopMargin |
								UIViewAutoresizingFlexibleBottomMargin);
	
	// initing the bar button
	UIBarButtonItem *loadingView = [[UIBarButtonItem alloc] initWithCustomView:loading];
	[loading release];
	loadingView.target = self;
	
	self.navigationItem.rightBarButtonItem = loadingView;
	[NSThread detachNewThreadSelector: @selector(getJSON) toTarget:self withObject:nil];
	self.navigationItem.rightBarButtonItem = nil;*/
	

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
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

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if([(UISegmentedControl*)self.navigationItem.titleView selectedSegmentIndex]) {
		return [self.organizeEventsArray count];
	} else {
		return [self.attendEventsArray count];
	}
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CellIdentifier = @"Cell";
    
	MAEventTableViewCell *cell = (MAEventTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[MAEventTableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
	}
    
    // Set up the cell...
	// setting the text
	//NSDictionary *itemAtIndex = (NSDictionary *)[[self.attendEventsArray objectAtIndex:[indexPath row]] JSONValue];
	MAEventData *eventAtIndex;
	if([(UISegmentedControl*)self.navigationItem.titleView selectedSegmentIndex]) {
		eventAtIndex = (MAEventData*)[self.organizeEventsArray objectAtIndex:[indexPath row]];
	} else {
		eventAtIndex = (MAEventData*)[self.attendEventsArray objectAtIndex:[indexPath row]];
	}
	[cell setData:eventAtIndex.eventName date:eventAtIndex.time];
	//TODO release MAEventData
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	MAEventData *eventAtIndex;
	if([(UISegmentedControl*)self.navigationItem.titleView selectedSegmentIndex]) {
		eventAtIndex = (MAEventData*)[self.organizeEventsArray objectAtIndex:[indexPath row]];
	} else {
		eventAtIndex = (MAEventData*)[self.attendEventsArray objectAtIndex:[indexPath row]];
	}
	
	MAEventViewController *eventViewController = [[MAEventViewController alloc]  initWithNibNameAndEventData:@"MAEventView" bundle:nil event:eventAtIndex];
	
	[[self navigationController] pushViewController:eventViewController animated:YES];
	
	[eventViewController release];
	[eventAtIndex release];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


- (void)dealloc {
	//TODO dealloc array?
	[super dealloc];
}


@end

