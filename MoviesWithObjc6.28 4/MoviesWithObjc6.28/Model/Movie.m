//
//  Movie.m
//  MoviesWithObjc6.28
//
//  Created by iAskedYou2nd on 8/2/22.
//

#import "Movie.h"

@implementation Movie

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super self];
    if (self) {
        self.identifier = [[dictionary valueForKey:@"id"] integerValue];
        self.posterImage = [dictionary valueForKey:@"poster_path"];
        self.title = [dictionary valueForKey:@"title"];
        self.rating = [[dictionary valueForKey:@"vote_average"] doubleValue];
        self.duration = [[dictionary valueForKey:@"runtime"] integerValue];
        self.releaseDate = [dictionary valueForKey:@"release_date"];
        self.overView = [dictionary valueForKey:@"overview"];
    }
    
    return self;
}

@end
