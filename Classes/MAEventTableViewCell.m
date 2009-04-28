//
//  MAEventTableViewCell.m
//  Meetapp
//
//  Created by Steven Lehrburger on 3/23/09.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import "MAEventTableViewCell.h"
#import "MeetappAppDelegate.h"


@implementation MAEventTableViewCell

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithFrame:frame reuseIdentifier:reuseIdentifier]) {
			self.target = self;
			
			CGRect newFrame;
			
			newFrame = CGRectMake(4, -8, self.contentView.bounds.size.width - 8, self.contentView.bounds.size.height - 4);
			nameLabel = [self newLabelForMainText:YES f:newFrame];
			[self addSubview:nameLabel];
			
			newFrame = CGRectMake(4, 20, self.contentView.bounds.size.width - 8, self.contentView.bounds.size.height - 24);
			dateLabel = [self newLabelForMainText:NO f:newFrame];
			[self addSubview:dateLabel];
		}
    return self;
}

- (UILabel *)newLabelForMainText:(BOOL)isMain f:(CGRect)frame {
	UIColor *primaryColor, *selectedColor;
	UIFont *font;
	
	if (isMain) {	
		primaryColor = [UIColor blackColor];
		selectedColor = [UIColor whiteColor];
		font = [UIFont boldSystemFontOfSize:15];
	} else {
		primaryColor = [UIColor darkGrayColor];
		selectedColor = [UIColor lightGrayColor];
		font = [UIFont systemFontOfSize:12];
	}
	
	UILabel *newLabel = [[UILabel alloc] initWithFrame:frame];
	newLabel.textAlignment = UITextAlignmentLeft;
	newLabel.backgroundColor = [UIColor clearColor];
	newLabel.opaque = YES;
	newLabel.textColor = primaryColor;
	newLabel.lineBreakMode = UILineBreakModeTailTruncation;
	newLabel.highlightedTextColor = selectedColor;
	newLabel.font = font;
	
	return newLabel;
}


- (void) setData:(NSString*)nameString date:(NSDate*)dateObj {

	NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init]  autorelease];
	
	nameLabel.text = nameString;
	//[nameLabel sizeToFit];
	
	[dateFormatter setDateStyle:NSDateFormatterMediumStyle];
	[dateFormatter setTimeStyle:NSDateFormatterNoStyle];		
	NSString *formattedDateString = [dateFormatter stringFromDate:dateObj];
	
	[dateFormatter setDateStyle:NSDateFormatterNoStyle];
	[dateFormatter setTimeStyle:NSDateFormatterShortStyle];
	NSString *formattedTimeString = [dateFormatter stringFromDate:dateObj];
	dateLabel.text = [NSString stringWithFormat:@"on %@ at %@", formattedDateString, formattedTimeString];
	
	//[dateLabel sizeToFit];
	
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
	[nameLabel release];
	[dateLabel release];
    [super dealloc];
}


@end
