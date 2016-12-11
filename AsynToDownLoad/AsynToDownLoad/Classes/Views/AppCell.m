//
//  AppCell.m
//  AsynToDownLoad
//
//  Created by 胡坤 on 2016/12/11.
//  Copyright © 2016年 hukun. All rights reserved.
//

#import "AppCell.h"
#import "AppModel.h"
#import "UIImageView+WebCache.h"
@implementation AppCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier])
    {
        
    }

    return self;
}

-(void)setModel:(AppModel *)model
{
    _model = model;
    
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.icon ] placeholderImage:[UIImage imageNamed:@"user_default"]];
    self.textLabel.text = model.name;
    self.detailTextLabel.text = model.download;
    

}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
