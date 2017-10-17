//
//  RepoInfoCell.m
//  GitHubProject
//
//  Created by Ankam Mounika on 4/6/17.
//  Copyright © 2017 Mounika. All rights reserved.
//

#import "RepoInfoCell.h"
#import "RepoModel.h"

@implementation RepoInfoCell

-(void)configureCellWithRepoInfo:(RepoModel *)repo{
    
    self.projectName.text = repo.fullname;
    self.repoURL.text = repo.htmlURL;
    
}


@end
