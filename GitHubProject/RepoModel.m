//
//  RepoModel.m
//  GitHubProject
//
//  Created by Ankam Mounika on 4/6/17.
//  Copyright © 2017 Mounika. All rights reserved.
//

#import "RepoModel.h"

@implementation RepoModel

-(instancetype)initWithDictonary:(NSDictionary *)dictonary{
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.fullname = [dictonary objectForKey:@"name"];
    self.htmlURL = [dictonary objectForKey:@"html_url"];
      
    return self;
    
}




@end
