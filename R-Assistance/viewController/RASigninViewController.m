//
//  RASigninViewController.m
//  R-Assistance
//
//  Created by IHsan HUsnul on 11/15/14.
//  Copyright (c) 2014 FiJannatin. All rights reserved.
//

#import "RASigninViewController.h"

@interface RASigninViewController ()

@end

@implementation RASigninViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signin:(id)sender
{
    NSUserDefaults* user = [NSUserDefaults standardUserDefaults];
    if ([_usernameField.text length]>1 && [_passwordField.text length]>1)
    {
        [self dismissViewControllerAnimated:YES completion:^{
            [user setValue:_usernameField.text forKey:@"username"];
            [user synchronize];
        }];
    }
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
