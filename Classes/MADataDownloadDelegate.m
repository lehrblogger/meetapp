//
//  MAGroupDataDownloadDelegate.m
//  Meetapp
//
//  Created by Steven Lehrburger on 4/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MADataDownloadDelegate.h"

@implementation MADataDownloadDelegate

@synthesize data, targetURL;

- (id) initWithDataAndTarget:(NSMutableData)aData targetURL:(NSString*)aTargetURL {
	self = [super init];
  if (self != nil) 
  {
		self.data = aData;
		self.targetURL = aTargetURL;	
		[[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
	}
  return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	// this method is called when the server has determined that it has enough information to create the NSURLResponse
	// it can be called multiple times, for example in the case of a redirect, so each time we reset the data.
	[data setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[data appendData:data];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	[connection release];
	[data release];
	
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
