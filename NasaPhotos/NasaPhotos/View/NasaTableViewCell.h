//
//  NasaTableViewCell.h
//  NasaPhotos
//
//  Created by Consultant on 8/6/22.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NasaTableViewCell : UITableViewCell

@property (nonatomic, weak) UIImageView* posterView;
@property (nonatomic, weak) UILabel* titleLabel;
@property (nonatomic, weak) UILabel* dateLabel;
@property (nonatomic, weak) UILabel* copyrightLabel;


@end

NS_ASSUME_NONNULL_END
