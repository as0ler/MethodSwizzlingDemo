//
//  ViewController.m
//  MethodSwizzlingDemo
//
//  Created by Prateek Gianchandani on 04/07/13.
//  Copyright (c) 2013 Prateek Gianchandani. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (retain, nonatomic) IBOutlet UITextField *usernameTextField;
@property (retain, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)loginTapped:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationItem setTitle:@"Login Bypass"];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
  [_usernameTextField release];
  [_passwordTextField release];
  [super dealloc];
}
- (IBAction)loginTapped:(id)sender {
  if([self validateLogin]){
    [self pushLoginPage];
  }
}

- (IBAction)login2Tapped:(id)sender {
  if([self.usernameTextField.text isEqualToString:@"admin"] && [self.passwordTextField.text isEqualToString:@"password"]){
    [self performSegueWithIdentifier:@"pushUserPage" sender:self];
  }else{
    [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Incorrect Username or password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
  }

}

-(BOOL)validateLogin {
  BOOL isValidLogin = NO;
  if([self.usernameTextField.text isEqualToString:@"admin"] && [self.passwordTextField.text isEqualToString:@"password"]){
    isValidLogin = YES;
  }else{
    [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Incorrect Username or password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
  }
  return isValidLogin;
}

-(void)pushLoginPage {
  [self performSegueWithIdentifier:@"pushUserPage" sender:self];
}


@end
