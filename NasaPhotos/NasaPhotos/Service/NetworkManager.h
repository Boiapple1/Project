//
//  NetworkManager.h
//  NasaPhotos
//
//  Created by Consultant on 8/6/22.
//

#define BASE_NASA_URL @"https://api.nasa.gov/planetary/apod?api_key="
#define BASE_NASA_KEY @"6h13pi26tV0rWtJYiruzKZha4DZwaPctMsGdDOib&"
#define BASE_NASA_DATE @"date="



#import <UIKit/UIKit.h>
#import "Nasa.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkManager : NSObject

+(instancetype)sharedInstance;

-(void)fetchNasa: (NSString*)Dateinput completion:(void(^)(Nasa*))completion;
-(void)fetchNasaImage:(NSString*)imageString completion:(void(^)(UIImage*))completion;

@end

NS_ASSUME_NONNULL_END
