//
//  RADashboardViewController.m
//  R-Assistance
//
//  Created by IHsan HUsnul on 11/15/14.
//  Copyright (c) 2014 FiJannatin. All rights reserved.
//

#import "RADashboardViewController.h"

@interface RADashboardViewController ()

@end

@implementation RADashboardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dateChanged:) name:DATE_MANAGER_DATE_CHANGED object:nil];
    [self buildDesign];
    [self buildCalendar];
}

-(void)viewWillAppear:(BOOL)animated
{
    [self hasSignin];
    
    [super viewWillAppear:animated];
    
    [self buttonTodayAction:nil];
}

-(void)viewDidAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)hasSignin
{
    NSUserDefaults* user = [NSUserDefaults standardUserDefaults];
    if (![[user objectForKey:@"username"] length]>0)
    {
        [self performSegueWithIdentifier:@"gotoSignin" sender:nil];
    }
}

-(void)buildDesign
{
    [self updateLabelWithMonthAndYear];
    
    NSUserDefaults* user = [NSUserDefaults standardUserDefaults];
    _usernameLabel.text = [user objectForKey:@"username"];
    logout.layer.cornerRadius = 10;
}

-(void)buildCalendar
{
    dictEvents = [NSMutableDictionary new];
    
    CGRect frame = calendarContainer.bounds;
    calendarMonth = [[FFMonthCalendarView alloc] initWithFrame:frame];
    [calendarMonth setProtocol:self];
    [calendarMonth setDictEvents:dictEvents];
    [calendarContainer addSubview:calendarMonth];
}

- (void)dateChanged:(NSNotification *)notification
{
    [self updateLabelWithMonthAndYear];
}

- (void)updateLabelWithMonthAndYear
{
    NSDateComponents *comp = [NSDate componentsOfDate:[[FFDateManager sharedManager] currentDate]];
    NSString *string = [NSString stringWithFormat:@"%@ %li", [arrayMonthName objectAtIndex:comp.month-1], (long)comp.year];
    labelWithMonthAndYear.text = string;
}

- (IBAction)buttonTodayAction:(id)sender
{
    [[FFDateManager sharedManager] setCurrentDate:[NSDate dateWithYear:[NSDate componentsOfCurrentDate].year
                                                                 month:[NSDate componentsOfCurrentDate].month
                                                                   day:[NSDate componentsOfCurrentDate].day]];
}

- (IBAction)logout:(id)sender
{
    NSUserDefaults* user = [NSUserDefaults standardUserDefaults];
    [user setValue:nil forKey:@"username"];
    [user synchronize];
    [self performSegueWithIdentifier:@"gotoSignin" sender:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
