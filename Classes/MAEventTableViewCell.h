//
//  MAEventTableViewCell.h
//  Meetapp
//
//  Created by Steven Lehrburger on 3/23/09.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MAEventTableViewCell : UITableViewCell {
	UILabel *nameLabel;
	UILabel *dateLabel;
}

- (void) setData:(NSString*)nameString date:(NSDate*)dateObj;
- (UILabel *)newLabelForMainText:(BOOL)isMain f:(CGRect)frame;

@end
