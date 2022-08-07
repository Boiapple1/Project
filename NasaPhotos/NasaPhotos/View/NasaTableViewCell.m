//
//  NasaTableViewCell.m
//  NasaPhotos
//
//  Created by Consultant on 8/6/22.
//

#import <Foundation/Foundation.h>

#import "NasaTableViewCell.h"

@implementation NasaTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUp];
        self.backgroundColor = [UIColor blackColor];
    }
    
    return self;
}

-(void)setUp {
    
    UIImageView* imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [imageView setContentMode:UIViewContentModeScaleAspectFit];
    [imageView setImage:[UIImage imageNamed:@"1"]];
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [label setTextColor: [UIColor whiteColor]];
    [label setText:@"Nasa Title"];
    
    UILabel* label1 = [[UILabel alloc] initWithFrame:CGRectZero];
    [label1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label1 setNumberOfLines:0];
    [label1 setTextColor: [UIColor whiteColor]];
    [label1 setText:@"Nasa Date"];
    
    UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectZero];
    [label2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label2 setTextColor: [UIColor whiteColor]];
    [label2 setNumberOfLines:0];
    [label2 setText:@"Nasa Copyright"];
    
    self.posterView = imageView;
    self.titleLabel = label;
    self.dateLabel = label1;
    self.copyrightLabel = label2;
    
    [self.contentView addSubview:imageView];
    
    [self.contentView addSubview:label];
    [self.contentView addSubview:label1];
    [self.contentView addSubview:label2];
    
    [[imageView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8] setActive:YES];
    [[imageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:8] setActive:YES];
    [[imageView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-8] setActive:YES];
    
    [[imageView.heightAnchor constraintEqualToConstant:150] setActive:YES];
    [[imageView.widthAnchor constraintEqualToConstant:150] setActive:YES];
    
    [[label.leadingAnchor constraintEqualToAnchor:imageView.trailingAnchor constant:8] setActive:YES];
    [[label.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-8] setActive:YES];
    [[label.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor] setActive:YES];
    [[label1.leadingAnchor constraintEqualToAnchor:imageView.trailingAnchor constant:8] setActive:YES];
    [[label1.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-8] setActive:YES];
    [[label1.bottomAnchor constraintEqualToAnchor:label.topAnchor constant:-8] setActive:YES];
//    [[label1.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:8] setActive:YES];

    [[label2.leadingAnchor constraintEqualToAnchor:imageView.trailingAnchor constant:8] setActive:YES];
    [[label2.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-8] setActive:YES];
   [[label2.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-8] setActive:YES];
    [[label2.topAnchor constraintEqualToAnchor:label.bottomAnchor constant:8] setActive:YES];
    
}

@end
