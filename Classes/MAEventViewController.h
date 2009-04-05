//
//  AttendEventViewController.h
//  Meetapp
//
//  Created by Steven Lehrburger on 3/26/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MAEventData.h"


@interface MAEventViewController : UIViewController {
	UITextView *testText;
	MAEventData *eventData;
}

- (id) initWithEvent:(MAEventData*)aEventData;

@property (nonatomic, retain)	UITextView *testText;
@property (nonatomic, retain) MAEventData *eventData;



@end
