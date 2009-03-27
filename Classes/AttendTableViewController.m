//
//  AttendTableViewController.m
//  Meetapp
//
//  Created by Steven Lehrburger on 3/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AttendTableViewController.h"
#import "EventTableViewCell.h"
#import <JSON/JSON.h>

@implementation AttendTableViewController

@synthesize attendEventsArray;

-(id) initWithTabBar {
	if ([self init]) {
		//this is the label on the tab button itself
		self.title = @"Attend";
		
		//use whatever image you want and add it to your project
		//self.tabBarItem.image = [UIImage imageNamed:@"name_gray.png"];
		
		// set the long name shown in the navigation bar at the top
		self.navigationItem.title=@"Attend";
	}
	return self;
	
}


/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if (self = [super initWithStyle:style]) {
    }
    return self;
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// init the url
	NSURL *jsonURL = [NSURL URLWithString:@"http://api.meetup.com/events.json/?group_id=176399&key=5636775624194f22c6362e39225c51"];
	
	NSString *jsonData = [[NSString alloc] initWithContentsOfURL:jsonURL];
	
	if (jsonData == nil) {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Webservice Down" message:@"The webservice you are accessing is down. Please try again later."  delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
		[alert show];	
		[alert release];
	}
	else {
		// converting the json data into an array
		
		NSDictionary *resultsMetaDictionary = [jsonData JSONValue];
		self.attendEventsArray = [resultsMetaDictionary objectForKey:@"results"];
	}
	
	// releasing the vars now
	[jsonURL release];
	[jsonData release];
}


/*`
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
    return [self.attendEventsArray count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    EventTableViewCell *cell = (EventTableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[EventTableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    
    // Set up the cell...
	
	// setting the text
	NSDictionary *itemAtIndex = (NSDictionary *)[self.attendEventsArray objectAtIndex:[indexPath row]];
	NSString *title = [itemAtIndex objectForKey:@"name"];
	[cell setData:title];

    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
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
    [super dealloc];
}


@end

