//
//  NetworkHelper.m
//  GitHubProject
//
//  Created by Ankam Mounika on 4/6/17.
//  Copyright © 2017 Mounika. All rights reserved.
//

#import "NetworkHelper.h"

@implementation NetworkHelper

+ (void)getGitHubReposForUser:(NSString *)userName
                      success:( void (^)(NSArray *dataArray))successBlock
                      failure:(void (^)(NSError *))failureBlock;
{
    
    
    NSURL *URL = [[NSURL alloc]initWithString:[NSString stringWithFormat:@"https://api.github.com/users/%@/repos", userName]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:URL];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    
                                                    if (error) {
                                                        failureBlock(error);
                                                    }
                                                    
                                                    
                                                    NSError *serializationerror;
                                                    NSArray *responseArray = [NSJSONSerialization JSONObjectWithData:data
                                                                                                           options:NSJSONReadingAllowFragments
                                                                                                               error:&serializationerror];
                                                    
                                                    if(responseArray.count <= 2){
                                                       
                                                        
                                                    }
                                                    
                                                    if (serializationerror) {
                                                        failureBlock(serializationerror);
                                                    }
                                                    
                                                    successBlock(responseArray);
                                                }];
                            [dataTask resume];
}

- (NSArray *)buildRepoModelFromResponseArray:(NSArray *)responseArray {
    
    return @[];
}

@end
