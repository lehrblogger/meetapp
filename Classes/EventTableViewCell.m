//
//  EventTableViewCell.m
//  Meetapp
//
//  Created by Steven Lehrburger on 3/23/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "EventTableViewCell.h"
#import "MeetappAppDelegate.h"


@implementation EventTableViewCell

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
        // Initialization code
		self.target = self;
		self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
		self.accessoryAction = @selector(onClick:);
		
		name = [[UILabel alloc] initWithFrame:frame];
		name.backgroundColor = [UIColor clearColor];
		name.opaque = NO;
		name.textColor = [UIColor blackColor];
		//name.textAlignment = UITextAlignmentCenter;
		name.highlightedTextColor = [UIColor whiteColor];
		name.font = [UIFont boldSystemFontOfSize:18.0];		
		[self addSubview:name];
		
		
		
    }
    return self;
}

- (void) setData:(NSString*)nameString
{
	name.text = nameString;
	[name sizeToFit];
	[self setNeedsDisplay];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// called when the accessory view (disclosure button) is touched
- (void)onClick:(id)sender
{

}


- (void)dealloc {
	[name release];
    [super dealloc];
}


@end
