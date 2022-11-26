//
//  PageResult.h
//  MoviesWithObjc6.28
//
//  Created by iAskedYou2nd on 8/1/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PageResult : NSObject

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) NSInteger totalResults;
@property (nonatomic, assign) NSInteger totalPages;
@property (nonatomic, strong) NSArray* movies;

-(instancetype)initWithJsonDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
