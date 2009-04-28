//
//  MADataManager.m
//  Meetapp
//
//  Created by Steven Lehrburger on 4/5/09.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import "MADataManager.h"
#import "MAGroupData.h"
#import "MAEventData.h"
#import <JSON/JSON.h>


@implementation MADataManager

@synthesize memberId, apiKey, groupList, eventList, eventTableViewController, lastUpdated;

- (id) initWithMemberIdAndKey:(NSString*)aMemberId key:(NSString*)aKey {
	self = [super init];
  if (self != nil) 
  {
		self.memberId = aMemberId;
		self.apiKey = aKey;	
	}
  return self;
}

- (void) setTableViewController:(MAEventTableViewController*)aEventTableViewController {
	self.eventTableViewController = aEventTableViewController;
}

- (void) updateAllData {
	//clear existing groups and event lists
	//TODO iterate through and remove objects?
	if (self.groupList != nil) [self.groupList release];
	if (self.eventList != nil) [self.eventList release];
	
	self.groupList = [[NSMutableArray alloc] init];
	self.eventList = [[NSMutableArray alloc] init];
	
	lastUpdated = [NSDate date];
	[self beginGroupListUpdate];
}

- (void) finishGroupListUpdate:(NSMutableArray*)aGroupDataArray {
	for (id elem in aGroupDataArray) {
		NSDictionary *groupDictonary = (NSDictionary *)elem;
		MAGroupData *newGroup = [[MAGroupData alloc] initWithDictionary:groupDictonary];
		[self.groupList addObject:newGroup];
		[self beginEventListUpdate:newGroup.groupId];
	}
}

- (void) finishEventListUpdate:(NSMutableArray*)aEventDataArray {
	for (id elem in aEventDataArray) {
		NSDictionary *eventDictonary = (NSDictionary *)elem;
		MAEventData *newEvent = [[MAEventData alloc] initWithDictionary:eventDictonary];
		[self.eventList addObject:newEvent];
	}
	if (self.eventTableViewController) {
		[self.eventTableViewController reloadTableData:self.eventList];
	} else {
		NSLog(@"No assigned eventTableViewController");
	}
}

- (void) beginGroupListUpdate {
	NSString *urlPartOne= @"http://api.meetup.com/groups.json/?member_id=";
	NSString *urlPartTwo= @"&key=";
	NSString *requestString = [urlPartOne stringByAppendingString:[self.memberId stringByAppendingString:[urlPartTwo stringByAppendingString: self.apiKey]]];
	NSLog(@"URL - %@", requestString);
	
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
	[[LCURLConnection alloc] initWithURL:requestString delegate:self];
}


- (void) beginEventListUpdate:(NSInteger)aGroupId {
	NSString *urlPartOne= @"http://api.meetup.com/events.json/?group_id=";
	NSString *urlPartTwo= @"&key=";
	NSString *requestString = [urlPartOne stringByAppendingString:[[NSString stringWithFormat:@"%d", aGroupId] stringByAppendingString:[urlPartTwo stringByAppendingString: self.apiKey]]];
	NSLog(@"URL - %@", requestString);
	
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
	[[LCURLConnection alloc] initWithURL:requestString delegate:self];
}
 

- (NSString*) getLastUpdatedString {
	if (self.lastUpdated) {
		return [NSString stringWithFormat:@"last updated on %@", self.lastUpdated.description];
	} else {
		return @"no previous updates";	
	}
}


#pragma mark -
#pragma mark LCURLConnection Delegate Methods

- (void) connection:(LCURLConnection*)connection didFailWithError:(NSError*)error {
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

	[connection release];
		
	// inform the user
	NSLog(@"Connection failed! Error - %@ %@", [error localizedDescription], [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
}

- (void) connectionDidFinishLoading:(LCURLConnection*)connection {
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
	
	//TODO check to see what finished? that way one function is enough
	
	NSString *response = [connection response];
	NSDictionary *resultsMetaDictionary = [response JSONValue];
	
	if ([[[resultsMetaDictionary objectForKey:@"meta"] objectForKey:@"method"] isEqualToString:@"Groups"]) {
		NSLog(@"finishGroupListUpdate");
		[self finishGroupListUpdate:[resultsMetaDictionary objectForKey:@"results"]];
		
  } else if([[[resultsMetaDictionary objectForKey:@"meta"] objectForKey:@"method"] isEqualToString:@"Events"]) {
		NSLog(@"finishEventListUpdate"); //%@", [resultsMetaDictionary objectForKey:@"results"]);
		[self finishEventListUpdate:[resultsMetaDictionary objectForKey:@"results"]];
		
	} else if([[resultsMetaDictionary objectForKey:@"problem"] isEqualToString:@"Rate limit exceeded"]) {
		NSLog(@"Rate limit exceeded");
	}
	
  [connection release];
}

@end
