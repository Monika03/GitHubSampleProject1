//
//  RepoModel.h
//  GitHubProject
//
//  Created by Ankam Mounika on 4/6/17.
//  Copyright © 2017 Mounika. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RepoModel : NSObject

@property (nonatomic,strong) NSString *fullname;
@property (nonatomic, strong) NSString *htmlURL;

-(instancetype)initWithDictonary:(NSDictionary *)dictonary;


@end
