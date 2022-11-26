//
//  Movie.h
//  MoviesWithObjc6.28
//
//  Created by iAskedYou2nd on 8/2/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Movie : NSObject

@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, copy) NSString* posterImage;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, assign) double rating;
@property (nonatomic, assign) NSInteger duration;
@property (nonatomic, copy) NSString* releaseDate;
@property (nonatomic, copy) NSString* overView;

-(instancetype)initWithDictionary:(NSDictionary*)dictionary;


@end

NS_ASSUME_NONNULL_END
