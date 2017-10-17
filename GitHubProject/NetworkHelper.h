//
//  NetworkHelper.h
//  GitHubProject
//
//  Created by Ankam Mounika on 4/6/17.
//  Copyright © 2017 Mounika. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkHelper : NSObject

+ (void)getGitHubReposForUser:(NSString *)userName
                      success:( void (^)(NSArray *dataArray))successBlock
                      failure:(void (^)(NSError *))failure;

@end
