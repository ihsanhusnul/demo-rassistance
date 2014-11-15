//
//  RADashboardViewController.h
//  R-Assistance
//
//  Created by IHsan HUsnul on 11/15/14.
//  Copyright (c) 2014 FiJannatin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFCalendar.h"

@protocol RADashboardViewControllerProtocol <NSObject>
@required
- (void)arrayUpdatedWithAllEvents:(NSMutableArray *)arrayUpdated;
@end


@interface RADashboardViewController : UIViewController
{
    FFMonthCalendarView* calendarMonth;
    NSMutableDictionary* dictEvents;
    __weak IBOutlet UIView *topView;
    __weak IBOutlet UIView *calendarContainer;
    __weak IBOutlet UILabel *labelWithMonthAndYear;
    __weak IBOutlet UIButton *logout;
}

@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (strong, nonatomic) id<RADashboardViewControllerProtocol>protocol;
@end
