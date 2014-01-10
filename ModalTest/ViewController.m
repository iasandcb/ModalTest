//
//  ViewController.m
//  ModalTest
//
//  Created by T on 2014. 1. 10..
//  Copyright (c) 2014년 T. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)showSignUp:(id)sender {
    UIStoryboard *storyboard = self.storyboard;
    
    UIViewController *signUpViewController = [storyboard instantiateViewControllerWithIdentifier:@"SignUp"];
    [self presentViewController:signUpViewController animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nameChanged:) name:@"UsernameChanged" object:nil];
}

- (void)nameChanged:(NSNotification *)notification {
    NSDictionary *info = notification.userInfo;
    self.nameLabel.text = info[@"username"];;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    // 만약 로그인 한적이 없으면 자동으로 로그인 화면을 모달로 띄운다
    BOOL isLoggedIn = YES;
    if (!isLoggedIn) {
        [self performSegueWithIdentifier:@"ModalSegue" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
