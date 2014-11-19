//
//  BrinDemoLoginViewController.h
//  BrintDemo
//
//  Created by Pradeep on 23/05/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BrinDemoLoginViewController : UIViewController

- (IBAction)loginButtonClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *forgotPasswordView;
@property (weak, nonatomic) IBOutlet UITextField *forgotPasswordTextField;
- (IBAction)forgotPasswordSubmitBtnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *signUpPasswordField;
@property (weak, nonatomic) IBOutlet UITextField *signUpConfirmPasswordField;
@property (weak, nonatomic) IBOutlet UITextField *loginPasswordTxtField;

- (IBAction)signUpSubmitBtnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *usernameTxtField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *mobileNumber;
@property (weak, nonatomic) IBOutlet UIButton *signUpSubmitBtn;
@property (weak, nonatomic) IBOutlet UITextField *loginUsernameTxtField;
- (IBAction)signUpBtnClicked:(id)sender;
- (IBAction)forgotPasswordBtnClicked:(id)sender;
- (IBAction)closeBtnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *signUpView;
@property (weak, nonatomic) IBOutlet UITextField *validationCode;
@end
