//
//  MovieTableViewCell.h
//  MoviesWithObjc6.28
//
//  Created by iAskedYou2nd on 8/3/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MovieTableViewCell : UITableViewCell

@property (nonatomic, weak) UIImageView* posterView;
@property (nonatomic, weak) UILabel* titleLabel;

@end

NS_ASSUME_NONNULL_END
