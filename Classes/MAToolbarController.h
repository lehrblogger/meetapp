//
//  MAToolbarController.h
//  Meetapp
//
//  Created by Steven Lehrburger on 4/27/09.
//  Copyright 2009 Steven Lehrburger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MADataManager.h"

@interface MAToolbarController : UIViewController <UINavigationControllerDelegate> {
	UIViewController *_contentViewController;
	UIToolbar *_toolbar;
	MADataManager *_dataManager;
	UILabel *updateLabel;
}

@property(nonatomic, retain, readonly) UIViewController *contentViewController;
@property(nonatomic, retain, readonly) UIToolbar *toolbar;
@property(nonatomic, retain, readonly) MADataManager *dataManager;
@property(nonatomic, retain) UILabel *updateLabel;

-(id)initWithContentViewControllerAndDataManager:(UIViewController*)contentViewController manager:(MADataManager*)dataManager;

@end
