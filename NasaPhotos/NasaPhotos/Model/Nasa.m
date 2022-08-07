//
//  Nasa.m
//  NasaPhotos
//
//  Created by Consultant on 8/6/22.
//

#import "Nasa.h"

@implementation Nasa

-(instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super self];
    if (self) {
        self.copyright = [dictionary valueForKey:@"copyright"];
        self.date = [dictionary valueForKey:@"date"];
        self.explanation = [dictionary valueForKey:@"explanation"];
        self.title = [dictionary valueForKey:@"title"];
        self.url = [dictionary valueForKey:@"url"];
    }
    
    return self;
}

@end
