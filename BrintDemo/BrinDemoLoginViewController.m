//
//  BrinDemoLoginViewController.m
//  BrintDemo
//
//  Created by Pradeep on 23/05/14.
//  Copyright (c) 2014 Pradeep. All rights reserved.
//

#import "BrinDemoLoginViewController.h"
#import "BrinDemoAppDelegate.h"
#import "WebService.h"
#import "APIDefines.h"
#import "SignUpApi.h"
#import "LoginApi.h"
#import "ForgotPasswordApi.h"
#import "MZLoadingCircle.h"
#import "LoadingLogic.h"

@interface BrinDemoLoginViewController (){
    MZLoadingCircle *loadingCircle;
}

@property (weak, nonatomic) IBOutlet UIScrollView *loginScrollView;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIImageView *scrollViewImageView;

@end

@implementation BrinDemoLoginViewController


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
    self.navigationController.navigationBarHidden = NO;
    self.loginScrollView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"mod.png"]];
    [self.signUpSubmitBtn setTitle:[NSString localizedValueForKey:@"Submit"] forState:UIControlStateNormal];
    self.signUpSubmitBtn.tag = SignupSubmitTag;
    [self modifyUIElements];
    [self backgroundImageAnimation];
    
    self.loginUsernameTxtField.text = @"Pradeep";
    self.loginPasswordTxtField.text = @"welcome";
}

- (void)modifyUIElements
{
    self.loginView.layer.cornerRadius = 10.0f;
    self.signUpView.layer.cornerRadius = 10.0f;
    self.forgotPasswordView.layer.cornerRadius = 10.0f;
    
    [[BDUtility sharedInstance] addShadowToView:self.loginView];
    [[BDUtility sharedInstance] addShadowToView:self.signUpView];
    [[BDUtility sharedInstance] addShadowToView:self.forgotPasswordView];

    self.loginView.backgroundColor = [self.loginView.backgroundColor colorWithAlphaComponent:0.6f];
    self.signUpView.backgroundColor = [self.signUpView.backgroundColor colorWithAlphaComponent:0.6f];
    self.forgotPasswordView.backgroundColor = [self.forgotPasswordView.backgroundColor colorWithAlphaComponent:0.6f];
}

- (IBAction)loginButtonClicked:(id)sender
{
    [self callLoginApi];
}

- (IBAction)forgotPasswordSubmitBtnClicked:(id)sender {

    ForgotPasswordApi *forgotPasswordApi = [[ForgotPasswordApi alloc] init];
    forgotPasswordApi.email = self.forgotPasswordTextField.text;
    forgotPasswordApi.apiType = Get;
    forgotPasswordApi.cacheing = CACHE_PERSISTANT;
    
    [[DataUtility sharedInstance] dataForObject:forgotPasswordApi response:^(APIBase *response, DataType dataType) {
        if (forgotPasswordApi.errorCode == 0) {
            [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
                self.loginView.hidden = NO;
                self.forgotPasswordView.hidden = YES;
                self.signUpView.hidden = YES;
            } completion:^(BOOL finished) {
                ;
            }];
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Brinvents" message:@"Your password has been sent to your mail address" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
            [alertView show];
        }
    }];
}

- (void)callLoginApi
{
    LoginApi *loginApi = [[LoginApi alloc] init];
    loginApi.loginDetails = [[LoginDetails alloc] init];
    loginApi.loginDetails.username = self.loginUsernameTxtField.text;
    loginApi.loginDetails.password = self.loginPasswordTxtField.text;
    loginApi.loginDetails.email = self.loginUsernameTxtField.text;
    loginApi.apiType = Post;
    loginApi.cacheing = CACHE_PERSISTANT;

    [[DataUtility sharedInstance] dataForObject:loginApi response:^(APIBase *response, DataType dataType) {
        if (loginApi.errorCode == 0) {
            [self showLoading];
            [[LoadingLogic sharedLoadingLogic] startBackGroundLoading];
            [self performSelector:@selector(pushToHomeScreen) withObject:nil afterDelay:6];
        }
    }];
}

- (IBAction)signUpSubmitBtnClicked:(id)sender {
    [self callSignUpApi];
}

- (void)callSignUpApi
{
    SignUpApi *signUpApi = [[SignUpApi alloc] init];
    signUpApi.signUpDetails = [[SignUpDetails alloc] init];
    signUpApi.signUpDetails.username = self.usernameTxtField.text;
    signUpApi.signUpDetails.password = self.signUpPasswordField.text;
    signUpApi.signUpDetails.mnumber = self.mobileNumber.text;
    signUpApi.signUpDetails.email = self.emailField.text;
    signUpApi.apiType = Post;
    signUpApi.cacheing = CACHE_PERSISTANT;
    
    [[DataUtility sharedInstance] dataForObject:signUpApi response:^(APIBase *response, DataType dataType) {
        if (signUpApi.errorCode == 0) {
            [self showLoading];
            [self performSelector:@selector(pushToHomeScreen) withObject:nil afterDelay:20];
        }
    }];
}

- (void)pushToHomeScreen {
    BrinDemoAppDelegate *appDelegate = (BrinDemoAppDelegate *)[[UIApplication sharedApplication] delegate];
    [appDelegate showHomeView];
    [self hideLoadingMode];
}

- (void)callValidateApi
{
    
}

- (IBAction)signUpBtnClicked:(id)sender {
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.loginView.hidden = YES;
        self.signUpView.hidden = NO;
    } completion:^(BOOL finished) {
        ;
    }];
}

- (IBAction)forgotPasswordBtnClicked:(id)sender {
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.loginView.hidden = YES;
        self.forgotPasswordView.hidden = NO;
    } completion:^(BOOL finished) {
        ;
    }];
}

- (IBAction)closeBtnClicked:(id)sender {
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.loginView.hidden = NO;
        self.forgotPasswordView.hidden = YES;
        self.signUpView.hidden = YES;
    } completion:^(BOOL finished) {
        ;
    }];
}

-(void) showLoading{
    if (!loadingCircle) {
        [self showLoadingMode];
    } else {
        [self hideLoadingMode];
    }
}

-(void)showLoadingMode {
    if (!loadingCircle) {
        loadingCircle = [[MZLoadingCircle alloc]initWithNibName:nil bundle:nil];
        loadingCircle.view.backgroundColor = [UIColor clearColor];
        
        //Colors for layers
        loadingCircle.colorCustomLayer = [UIColor colorWithRed:0 green:0.4 blue:0 alpha:1];
        loadingCircle.colorCustomLayer2 = [UIColor colorWithRed:0 green:0.4 blue:0 alpha:0.65];
        loadingCircle.colorCustomLayer3 = [UIColor colorWithRed:0 green:0.4 blue:0 alpha:0.4];
        
        int size = 100;
        
        CGRect frame = loadingCircle.view.frame;
        frame.size.width = size ;
        frame.size.height = size;
        frame.origin.x = self.view.frame.size.width / 2 - frame.size.width / 2;
        frame.origin.y = self.view.frame.size.height / 2 - frame.size.height / 2;
        loadingCircle.view.frame = frame;
        loadingCircle.view.layer.zPosition = MAXFLOAT;
        [self.view addSubview: loadingCircle.view];
    }
}

-(void)hideLoadingMode {
    if (loadingCircle) {
        [loadingCircle.view removeFromSuperview];
        loadingCircle = nil;
    }
}


- (void)backgroundImageAnimation
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSMutableArray *emmaImagesArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"mod.png"],[UIImage imageNamed:@"model2.png"], nil];
        self.scrollViewImageView.animationImages = emmaImagesArray;
        self.scrollViewImageView.animationDuration = 10.0;
        self.scrollViewImageView.animationRepeatCount = 0;
        
        CATransition *transition = [CATransition animation];
        transition.duration = 1.0f;
        transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        transition.type = kCATransitionFade;
        
        [self.scrollViewImageView.layer addAnimation:transition forKey:nil];
        [self.scrollViewImageView startAnimating];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
