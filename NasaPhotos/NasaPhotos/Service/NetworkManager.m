//
//  NetworkManager.m
//  NasaPhotos
//
//  Created by Consultant on 8/6/22.
//

#import "NetworkManager.h"

@implementation NetworkManager

+(instancetype)sharedInstance {
    static NetworkManager* _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

-(instancetype)init {
    self = [super self];
    return self;
}

// MARK: Network Fetching

-(void)fetchNasa:(NSString*)Dateinput completion:(void (^)(Nasa* _Nullable))completion {
    
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@%@", BASE_NASA_URL, BASE_NASA_KEY, BASE_NASA_DATE, Dateinput]];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil);
            return;
        }
        
        if (data == nil) {
            completion(nil);
            return;
        }
        
        id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if ([object isKindOfClass:[NSDictionary class]]) {
            NSDictionary* dictionary = object;
            Nasa* copyright = [[Nasa alloc] initWithDictionary:dictionary];
            completion(copyright);
            return;
        }
                
    }] resume];
    
}

-(void)fetchNasaImage:(NSString *)imageString completion:(void (^)(UIImage * _Nullable))completion {
    
    NSURL* url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",  imageString]];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil);
            return;
        }
        
        if (data == nil) {
            completion(nil);
            return;
        }
        
        UIImage* image = [UIImage imageWithData:data];
        completion(image);
    }] resume];
    
}



@end
