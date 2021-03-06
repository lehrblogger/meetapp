//
//  AttendEventViewController.m
//  Meetapp
//
//  Created by Steven Lehrburger on 3/26/09.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import "MAEventViewController.h"
#import "CellTextView.h"

@interface MAEventViewController ()

@property (nonatomic, retain) NSDateFormatter *dateFormatter;
@property (nonatomic, retain) UITableView *tableView;
@property (nonatomic, retain) NSIndexPath *selectedIndexPath;

@end


@implementation MAEventViewController

@synthesize eventData, dateFormatter, tableView, selectedIndexPath;

- (id)initWithNibNameAndEventData:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil event:(MAEventData*)aEventData {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		// Title displayed by the navigation controller.
		self.title = @"Event Info";
		self.eventData = aEventData;

		// Create a date formatter to convert the date to a string format.
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
		[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
	}
	return self;
}

- (void)dealloc {
	[selectedIndexPath release];
	[tableView release];
	[eventData release];
	[dateFormatter release];
	[super dealloc];
}

- (void)viewWillAppear:(BOOL)animated {
	// Remove any existing selection.
	[tableView deselectRowAtIndexPath:selectedIndexPath animated:NO];
	// Redisplay the data.
	[tableView reloadData];
}

#pragma mark -
#pragma mark <UITableViewDelegate, UITableViewDataSource> Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tv {
	return 5;
}

- (NSInteger)tableView:(UITableView *)tv numberOfRowsInSection:(NSInteger)section {
	// Only one row for each section
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tv cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyIdentifier"];

	switch (indexPath.section) {
		case 0: 
			if (cell == nil) {
				cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"MyIdentifier"] autorelease];
			}
			cell.font = [UIFont boldSystemFontOfSize:12];
			cell.text = eventData.groupName; 
			break;
		case 1:
			if (cell == nil) {
				cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"MyIdentifier"] autorelease];
			}
			cell.font = [UIFont boldSystemFontOfSize:12];
			cell.text = eventData.eventName;
			break;
		case 2:
			if (cell == nil) {
				cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"MyIdentifier"] autorelease];
			}
			cell.font = [UIFont systemFontOfSize:12];
			cell.text = [dateFormatter stringFromDate:eventData.time]; 
			break;
		case 3: 
			if (cell == nil) {
				cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"MyIdentifier"] autorelease];
			}
			cell.font = [UIFont systemFontOfSize:12];
			cell.text = eventData.venueName; 
			break;
		case 4: 
			if (cell == nil) {
				cell = [[[CellTextView alloc] initWithFrame:CGRectZero	reuseIdentifier:kCellTextView_ID] autorelease];
			}
			UITextView* tempTextView = [[UITextView alloc] initWithFrame:CGRectMake(0,0,300,300)];
			
			tempTextView.font = [UIFont systemFontOfSize:12];
			tempTextView.text = eventData.description;
			[((CellTextView*)cell) setView:tempTextView];
			[tempTextView release];
			break;
	}
	return cell;
}

- (NSString *)tableView:(UITableView *)tv titleForHeaderInSection:(NSInteger)section {
	// Return the displayed title for the specified section.
	switch (section) {
		case 0: return @"Group Name";
		case 1: return @"Event Name";
		case 2: return @"Date and Time";
		case 3: return @"Venue Name";
		case 4: return @"Event Description";
	}
	return nil;
}

- (NSIndexPath *)tableView:(UITableView *)tv willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// Only allow selection if editing.
	return (self.editing) ? indexPath : nil;
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tv accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath {
	// Show the disclosure indicator if editing.
	return (self.editing) ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
}

@end
