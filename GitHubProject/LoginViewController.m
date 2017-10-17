//
//  ViewController.m
//  GitHubProject
//
//  Created by Ankam Mounika on 4/6/17.
//  Copyright © 2017 Mounika. All rights reserved.
//

#import "LoginViewController.h"
#import "NetworkHelper.h"
#import "RepoInfoTableViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameText;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)getUserRepo:(id)sender {
    
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    RepoInfoTableViewController* repoTableView = [storyboard instantiateViewControllerWithIdentifier:@"RepoViewController"];
    repoTableView.userName = self.userNameText.text;
    [self.navigationController pushViewController:repoTableView animated:YES];
    

 
}




@end
