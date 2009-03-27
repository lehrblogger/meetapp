//
//  AttendTableViewController.m
//  Meetapp
//
//  Created by Steven Lehrburger on 3/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AttendTableViewController.h"
#import "CJSONDeserializer.h"

@implementation AttendTableViewController

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

// from http://developer.apple.com/iphone/library/documentation/Networking/Conceptual/CFNetwork/Introduction/Introduction.html#//apple_ref/doc/uid/TP30001132-CH1-DontLinkElementID_24
- (NSString) getEventAsJSONString {
	CFStringRef bodyData = CFSTR(""); // Usually used for POST data
	
	//CFStringRef headerFieldName = CFSTR("X-My-Favorite-Field");
	//CFStringRef headerFieldValue = CFSTR("Dreams");
	
	CFStringRef url = CFSTR("http://api.meetup.com/events.json/?group_id=1377720&key=5636775624194f22c6362e39225c51");
	CFURLRef meetupURL = CFURLCreateWithString(kCFAllocatorDefault, url, NULL);
	
	CFStringRef requestMethod = CFSTR("GET");
	CFHTTPMessageRef meetupRequest = CFHTTPMessageCreateRequest(kCFAllocatorDefault, requestMethod, meetupURL, kCFHTTPVersion1_1);
	
	CFHTTPMessageSetBody(meetupRequest, bodyData);
	//CFHTTPMessageSetHeaderFieldValue(myRequest, headerFieldName, headerFieldValue);
	
	CFDataRef meetupSerializedRequest = CFHTTPMessageCopySerializedMessage(meetupRequest);
	
	/* release!
	 CFRelease(myRequest);
	 CFRelease(myURL);
	 CFRelease(url);
	 CFRelease(mySerializedRequest);
	 myRequest = NULL;
	 mySerializedRequest = NULL;
	 */
}

- (void)viewDidLoad {
    [super viewDidLoad];

	NSString *jsonString = getEventAsJSONString();//@"{\"results\":[{\"group_name\":\"New York Scala Enthusiasts\",\"lon\":\"-74.0\",\"rsvpcount\":\"17\",\"venue_name\":\"\",\"photo_url\":\"http:\/\/photos1.meetupstatic.com\/photos\/event\/e\/2\/3\/global_7215619.jpeg\",\"questions\":[],\"feecurrency\":\"USD\",\"attendee_count\":\"0\",\"myrsvp\":\"yes\",\"venue_lon\":\"\",\"id\":\"9807503\",\"fee\":\"0.0\",\"time\":\"Mon Mar 30 18:30:00 EDT 2009\",\"feedesc\":\"\",\"ismeetup\":\"1\",\"updated\":\"Tue Mar 24 22:48:40 EDT 2009\",\"event_url\":\"http:\/\/softwaredev.meetup.com\/157\/calendar\/9807503\",\"description\":\"Shashank Tiwari is giving a redux presentation on the actors library that he gave at a conference in October.  Here is the abstract and some information on Shashank:\r\n\r\n[b]Presentation Abstract[\/b]\r\nScala is the new language within the JVM. Among other nifty features, it brings the Erlang style concurrency without low-level manipulation of threads to the JVM. In this session, we see why and how this actor based concurrency model may make it easy for you to build application on the JVM without sweating over complex thread-handling mechanisms.\r\n\r\n[b]\r\nShashank Tiwari[\/b]\r\nChief Technologist, Saven Technologies Inc.\r\nShashank Tiwari is the Chief Technologist at Saven Technologies, a technology driven business solutions company headquartered in Chicago, IL. As an experienced software developer and architect, he is adept in a multitude of technologies. He is an expert group member on a number of JCP (Java Community Process) specifications, JSRs 274, 283, 299, 301 & 312, and is an Adobe Flex Champion. Currently, he passionately builds rich high performance applications and advises many on RIA and SOA adoption. Many of his clients are banking, money management, and financial service companies that he has helped build robust, quantitative, data-intensive, highly interactive, and scalable applications. He writes regularly in many technical magazines, presents in seminars and mentors developers and architects. He has a popular blog on the O'Reilly Network. He is an ardent supporter of and contributor to open source software. He lives with his wife and two sons in New York. More information about him can be accessed at his website.\",\"name\":\"New York Scala Enthusiasts March Meetup: The Actors Library\",\"venue_lat\":\"\",\"lat\":\"40.720001220703125\"}],\"meta\":{\"lon\":\"\",\"count\":1,\"link\":\"http:\/\/api.meetup.com\/events\/\",\"next\":\"\",\"total_count\":1,\"url\":\"http:\/\/api.meetup.com\/events\/?order=time&radius=25&key=5636775624194f22c6362e39225c51&group_id=1377720&page=200&resource=%2Fevents.json%2F&format=json&offset=0\",\"id\":\"\",\"title\":\"Meetup Events\",\"updated\":\"2009-03-24 22:48:40 EDT\",\"description\":\"API method for accessing meetup events\",\"method\":\"Events\",\"lat\":\"\"}}";
	NSData *jsonData = [jsonString dataUsingEncoding:NSUTF32BigEndianStringEncoding];
	NSError *error = nil;
	NSDictionary *dictionary = [[CJSONDeserializer deserializer] deserializeAsDictionary:jsonData error:&error];
}


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
    return 0;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Set up the cell...

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

