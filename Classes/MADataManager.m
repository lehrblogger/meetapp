//
//  MADataManager.m
//  Meetapp
//
//  Created by Steven Lehrburger on 4/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MADataManager.h"
#import "MAGroupData.h"
#import <JSON/JSON.h>


@implementation MADataManager

@synthesize memberId, key, groupList, jsonGroupData, groupDataArray, organizeEventsArray, attendEventsArray, lastUpdated;

- (id) initWithMemberIdAndKey:(NSInteger)aMemberId key:(NSString*)aKey {
	self = [super init];
  if (self != nil) 
  {
		self.memberId = aMemberId;
		self.key = aKey;	
	}
  return self;
}

- (void) beginAllDataUpdate {
	//check later for last updated date
	[self groupListUpdate];
}
- (void) finishAllDataUpdate {
	if (self.groupList != nil) [self.groupList release];
	
	self.groupList = [[NSMutableArray alloc] init];
	for (id elem in self.groupDataArray) {
		NSDictionary *groupDictonary = (NSDictionary *)elem;
		MAGroupData *newGroup = [[MAGroupData alloc] initWithDictionary:groupDictonary];
		[self.groupList addObject:newGroup];
	}
	
	[self.groupDataArray release];
	
	/*
	for (id group in self.groupList) {
		NSMutableArray *eventsForTempGroup = //get events for group - each  one makes it's own API Clalas
		
		for (id event in eventsForTempGroup) {
			// add to attendEventsArray
			//if organizer
			//add to organizeEventsArray
		}
	}*/
}

- (void) groupListUpdate {
	//store in groupList
	
	NSString *urlPartOne= @"http://api.meetup.com/groups.json/?member_id=";
	NSString *urlPartTwo= @"&key=";
	NSString *jsonGroupURLString = [urlPartOne stringByAppendingString:[[NSString stringWithFormat:@"%d", self.memberId] stringByAppendingString:[urlPartTwo stringByAppendingString: self.key]]];
	NSLog(@"URL - %@", jsonGroupURLString);
	
	NSURL *jsonGroupURL = [NSURL URLWithString:jsonGroupURLString];
	NSURLRequest *jsonGroupRequest = [NSURLRequest requestWithURL:jsonGroupURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:10.0];
		
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
	NSURLConnection *jsonGroupConnection = [[NSURLConnection alloc] initWithRequest:jsonGroupRequest delegate:self];
		
	if (jsonGroupConnection) {
		jsonGroupData = [[NSMutableData data] retain];
	} else {
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Webservice Down" message:@"The webservice you are accessing is down. Please try again later."  delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
		[alert show];	
		[alert release];
	}	
	//TODO do I need to release these?
	//[jsonGroupURL release];
	//[jsonGroupRequest release];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	// this method is called when the server has determined that it has enough information to create the NSURLResponse
	// it can be called multiple times, for example in the case of a redirect, so each time we reset the data.
	[jsonGroupData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[jsonGroupData appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	[connection release];
	[jsonGroupData release];
		
	// inform the user
	NSLog(@"Connection failed! Error - %@ %@", [error localizedDescription], [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
	// do something with the data
	NSString *jsonGroupDataString = [[NSString alloc] initWithData:jsonGroupData encoding:NSUTF8StringEncoding];
	NSDictionary *resultsMetaDictionary = [jsonGroupDataString JSONValue];
	self.groupDataArray = [resultsMetaDictionary objectForKey:@"results"];  
	
	// receivedData is declared as a method instance elsewhere
	NSLog(@"Succeeded! Received %d bytes of data",[jsonGroupData length]); 
	
	[self finishAllDataUpdate];
	
	// release the connection, and the data object
	[connection release];
	[jsonGroupData release];
	[jsonGroupDataString release];	
}


@end
