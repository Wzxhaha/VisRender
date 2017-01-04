
//
//  MyCell.m
//  VisCorner
//
//  Created by WzxJiang on 17/1/3.
//  Copyright © 2017年 wzxjiang. All rights reserved.
//

#import "TestCell.h"
#import "Masonry.h"
#import "UIView+VisCorner.h"
@implementation TestCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1.JPG"]];
    [self.contentView addSubview:_imgView];
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [_imgView vis_setCornerRadius:15 size:CGSizeMake(30, 30) color:[UIColor whiteColor] identifier:@"vis_test_cell"];
}

@end
