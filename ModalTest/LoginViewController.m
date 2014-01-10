//
//  LoginViewController.m
//  ModalTest
//
//  Created by T on 2014. 1. 10..
//  Copyright (c) 2014년 T. All rights reserved.
//

#import "LoginViewController.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameLabel;

@end

@implementation LoginViewController
- (IBAction)confirmLogin:(id)sender {
    // 1. Notification
    // UsernameChanged
    // 이름이 바뀌는 곳은 LoginVC
    // 이름이 바뀌는 것에 관심있는 곳은 VC
    // 이 알림에 관심있는 관심종자들을 정해서 등록한다
    // 이름이 바뀌었을 때 알린다
    // 비동기 방식
    // 2. KVO
    // Key Value Observing
    NSDictionary *userInfo =
    @{@"username" : self.usernameLabel.text};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UsernameChanged" object:nil userInfo:userInfo
  ];
    [self dismissViewControllerAnimated:YES completion:nil];
}

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

@end
