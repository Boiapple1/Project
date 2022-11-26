//
//  PageResult.m
//  MoviesWithObjc6.28
//
//  Created by iAskedYou2nd on 8/1/22.
//

#import "PageResult.h"
#import "Movie.h"

@implementation PageResult

-(instancetype)initWithJsonDictionary:(NSDictionary *)dictionary {
    self = [super self];
    if (self) {
        self.page = [[dictionary valueForKey:@"page"] integerValue];
        self.totalResults = [[dictionary valueForKey:@"total_results"] integerValue];
        self.totalPages = [[dictionary valueForKey:@"total_pages"] integerValue];
        
        NSMutableArray* movies = [[NSMutableArray alloc] init];
        NSArray* jsonMovies = [dictionary objectForKey:@"results"];
        
        for (NSDictionary* movieDict in jsonMovies) {
            Movie* movie = [[Movie alloc] initWithDictionary:movieDict];
            [movies addObject:movie];
        }
        self.movies = [NSArray arrayWithArray:movies];
    }
    
    return self;
}

@end
