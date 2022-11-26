//
//  NetworkManager.h
//  MoviesWithObjc6.28
//
//  Created by iAskedYou2nd on 8/2/22.
//

#define BASE_MOVIE_URL @"https://api.themoviedb.org/3/movie/popular?api_key=705f7bed4894d3adc718c699a8ca9a4f&page="
#define BASE_IMAGE_URL @"https://image.tmdb.org/t/p/w500/"


#import <UIKit/UIKit.h>
#import "PageResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

+(instancetype)sharedInstance;

-(void)fetchMoviesWithPageNumber:(NSInteger)pageNumber completion:(void(^)(PageResult*))completion;
-(void)fetchImageWithString:(NSString*)imageString completion:(void(^)(UIImage*))completion;

@end

NS_ASSUME_NONNULL_END
