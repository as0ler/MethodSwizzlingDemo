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

- (IBAction)action1:(id)sender {
    if([self credentialsAreValid]){
        [self pushWelcomePage];
    }
}
- (IBAction)action2:(id)sender {
    if([self.usernameTextField.text isEqualToString:@"Petter Griffin"] && [self.passwordTextField.text isEqualToString:@"N0D3b3sP4s4r"]){
        [self performSegueWithIdentifier:@"pushUserPage" sender:self];
    }else{
        [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Incorrect Username or password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
    }
}


-(BOOL)credentialsAreValid {
  BOOL isValidLogin = NO;
  if([self.usernameTextField.text isEqualToString:@"Bender"] && [self.passwordTextField.text isEqualToString:@"3st4sS3guro???"]){
    isValidLogin = YES;
  }else{
    [[[UIAlertView alloc] initWithTitle:@"Error" message:@"Incorrect Username or password" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil] show];
  }
  return isValidLogin;
}

-(void)pushWelcomePage {
  [self performSegueWithIdentifier:@"pushUserPage" sender:self];
}


@end
