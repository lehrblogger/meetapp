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

@synthesize memberId, key, groupList, eventList, organizeEventsArray, attendEventsArray, lastUpdated;

- (id) initWithMemberIdAndKey:(NSInteger)aMemberId key:(NSString*)aKey {
	self = [super init];
  if (self != nil) 
  {
		self.memberId = aMemberId;
		self.key = aKey;	
	}
  return self;
}

- (void) updateAllData {
	//clear existing groups and event lists
	if (self.groupList != nil) [self.groupList release];
	if (self.eventList != nil) [self.eventList release];
	
	self.groupList = [[NSMutableArray alloc] init];
	self.eventList = [[NSMutableArray alloc] init];
	
	//TODO check later for last updated date
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
}

- (void) beginGroupListUpdate {
	NSString *urlPartOne= @"http://api.meetup.com/groups.json/?member_id=";
	NSString *urlPartTwo= @"&key=";
	NSString *requestString = [urlPartOne stringByAppendingString:[[NSString stringWithFormat:@"%d", self.memberId] stringByAppendingString:[urlPartTwo stringByAppendingString: self.key]]];
	NSLog(@"URL - %@", requestString);
	
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
	[[LCURLConnection alloc] initWithURL:requestString delegate:self];
}


- (void) beginEventListUpdate:(NSInteger)aGroupId {
	NSString *urlPartOne= @"http://api.meetup.com/events.json/?group_id=";
	NSString *urlPartTwo= @"&key=";
	NSString *requestString = [urlPartOne stringByAppendingString:[[NSString stringWithFormat:@"%d", aGroupId] stringByAppendingString:[urlPartTwo stringByAppendingString: self.key]]];
	NSLog(@"URL - %@", requestString);
	
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
	[[LCURLConnection alloc] initWithURL:requestString delegate:self];
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
	
	if ([[[resultsMetaDictionary objectForKey:@"meta"] objectForKey:@"method"] isEqualTo:@"Groups"]) {
		NSLog(@"finishGroupListUpdate");
		[self finishGroupListUpdate:[resultsMetaDictionary objectForKey:@"results"]];
		
  } else if([[[resultsMetaDictionary objectForKey:@"meta"] objectForKey:@"method"] isEqualTo:@"Events"]) {
		NSLog(@"finishEventListUpdate"); //%@", [resultsMetaDictionary objectForKey:@"results"]);
		[self finishEventListUpdate:[resultsMetaDictionary objectForKey:@"results"]];
		
	} else if([[resultsMetaDictionary objectForKey:@"problem"] isEqualTo:@"Rate limit exceeded"]) {
		NSLog(@"Rate limit exceeded");
	}
	
  [connection release];
}

@end
