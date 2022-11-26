//
//  MovieTableViewCell.m
//  MoviesWithObjc6.28
//
//  Created by iAskedYou2nd on 8/3/22.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUp];
    }
    
    return self;
}

-(void)setUp {
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [imageView setImage:[UIImage imageNamed:@"question-mark"]];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [label setText:@"Movie Title"];
    
    self.posterView = imageView;
    self.titleLabel = label;
    
    [self.contentView addSubview:imageView];
    [self.contentView addSubview:label];
    
    [[imageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8] setActive:YES];
    [[imageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:8] setActive:YES];
    [[imageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-8] setActive:YES];
    
    [[imageView.heightAnchor constraintEqualToConstant:150] setActive:YES];
    [[imageView.widthAnchor constraintEqualToConstant:150] setActive:YES];
    
    [[label.leadingAnchor constraintEqualToAnchor:imageView.trailingAnchor constant:8] setActive:YES];
    [[label.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-8] setActive:YES];
    [[label.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor] setActive:YES];
    
}

@end
