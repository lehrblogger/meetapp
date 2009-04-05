//
//  MAGroupDataDownloadDelegate.h
//  Meetapp
//
//  Created by Steven Lehrburger on 4/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MADataDownloadDelegate : NSObject {
	NSMutableData *data;
	NSString *targetURL;
}

@property(retain) NSMutableData *jsonGroupData;
@property(retain) NSString *targetURL;

- (id) initWithDataAndTarget:(NSMutableData)aData targetURL:(NSString*)aTargetURL;

@end