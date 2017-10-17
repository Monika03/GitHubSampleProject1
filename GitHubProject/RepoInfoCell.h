//
//  RepoInfoCell.h
//  GitHubProject
//
//  Created by Ankam Mounika on 4/6/17.
//  Copyright © 2017 Mounika. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RepoModel.h"

@interface RepoInfoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *projectName;
@property (weak, nonatomic) IBOutlet UILabel *repoURL;

- (void)configureCellWithRepoInfo:(RepoModel *)repo;


@end
