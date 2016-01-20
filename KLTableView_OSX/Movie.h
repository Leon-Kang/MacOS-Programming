//
//  Movie.h
//  KLTableView_OSX
//
//  Created by 康梁 on 16/1/20.
//  Copyright © 2016年 LeonKang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject <NSCopying>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) float duration;

+ (NSArray *)movies;

@end
