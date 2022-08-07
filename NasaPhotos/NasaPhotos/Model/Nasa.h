//
//  Nasa.h
//  NasaPhotos
//
//  Created by Consultant on 8/6/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Nasa : NSObject

@property (nonatomic, copy) NSString* copyright;
@property (nonatomic, copy) NSString* date;
@property (nonatomic, copy) NSString* explanation;
@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* url;


-(instancetype)initWithDictionary:(NSDictionary*)dictionary;


@end

NS_ASSUME_NONNULL_END
