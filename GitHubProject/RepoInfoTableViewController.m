//
//  RepoInfoTableViewController.m
//  GitHubProject
//
//  Created by Ankam Mounika on 4/6/17.
//  Copyright © 2017 Mounika. All rights reserved.
//

#import "RepoInfoTableViewController.h"
#import "RepoInfoCell.h"
#import "NetworkHelper.h"
#import "RepoModel.h"
#import "StatusViewController.h"

#define TABLE_CELL_HEIGHT 70.0

@interface RepoInfoTableViewController ()

@property (nonatomic,strong) NSArray *repoArray;

@end

@implementation RepoInfoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ALL PUBLIC REPO'S";
    self.navigationItem.backBarButtonItem.tintColor = [UIColor whiteColor];
    [self getRepoDataFromService];
   
}

- (void)getRepoDataFromService{
   
    __weak __typeof__(self) weakSelf = self;
    NSMutableArray *repoArray = [NSMutableArray array];
    //    NetworkHelper *networkHelper = [[NetworkHelper alloc]init];
    [NetworkHelper getGitHubReposForUser:self.userName
                                 success:^(NSArray *Repo){
                                    __typeof__(self) strongSelf = weakSelf;
                                         
                                         for(NSDictionary *dictonary in Repo)
                                         {
                                             RepoModel *repoData = [[RepoModel alloc]initWithDictonary:dictonary];
                                             [repoArray addObject:repoData];
                                         }
                                     strongSelf.repoArray = repoArray;
                                     [strongSelf.tableView reloadData];
                                     
                                     if(repoArray.count == 0){
                                         dispatch_async(dispatch_get_main_queue(), ^{
                                             self.tableView.hidden = YES;
                                             
                                             StatusViewController *myViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"statusVC"];
                                             [self.navigationController presentViewController:myViewController animated:YES completion:nil];
                                             
                                         });
                                     }
                                 }
     
                                 failure:^(NSError *error)
     {
         NSLog(@"ERROR %@", error);
     }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return  1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.repoArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     RepoInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"repoInfoCell" forIndexPath:indexPath];
     [cell configureCellWithRepoInfo:self.repoArray[indexPath.row]];
     return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TABLE_CELL_HEIGHT;
    
}



@end
