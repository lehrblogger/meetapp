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
	NSURL *jsonURL = [NSURL URLWithString:@"http://api.meetup.com/events.json/?group_id=176399&key=5636775624194f22c6362e39225c51"];
	
	NSURLRequest *jsonRequest = [NSURLRequest requestWithURL:jsonURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0];
	
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
	NSURLConnection *jsonConnection = [[NSURLConnection alloc] initWithRequest:jsonRequest delegate:self];
	
	if (jsonConnection) {
		jsonData = [[NSMutableData data] retain];
	} else {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Webservice Down" message:@"The webservice you are accessing is down. Please try again later."  delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
		[alert show];	
		[alert release];
	}	
	
	//TODO do I need to release these?
	//[jsonURL release];
	//[jsonRequest release];
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // this method is called when the server has determined that it has enough information to create the NSURLResponse
    // it can be called multiple times, for example in the case of a redirect, so each time we reset the data.
	[jsonData setLength:0];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [jsonData appendData:data];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    [connection release];
    [jsonData release];
	
	// inform the user
    NSLog(@"Connection failed! Error - %@ %@", [error localizedDescription], [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    // do something with the data
	NSString *jsonDataString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
	NSDictionary *resultsMetaDictionary = [jsonDataString JSONValue];
	self.attendEventsArray = [resultsMetaDictionary objectForKey:@"results"];  
	[self.tableView reloadData];
	
    // receivedData is declared as a method instance elsewhere
    NSLog(@"Succeeded! Received %d bytes of data",[jsonData length]); 

    // release the connection, and the data object
    [connection release];
    [jsonData release];
	[jsonDataString release];
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
	//NSDictionary *itemAtIndex = (NSDictionary *)[[self.attendEventsArray objectAtIndex:[indexPath row]] JSONValue];
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
	[jsonData dealloc];
    [super dealloc];
}


@end

