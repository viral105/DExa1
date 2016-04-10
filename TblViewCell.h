//
//  TblViewCell.h
//  
//
//  Created by Viral Narshana on 4/9/16.
//
//

#import <UIKit/UIKit.h>
#import "DownloadTask.h"

@protocol TblViewCellDelegate <NSObject>

-(void)updateArr:(DownloadTask*)obj indPath:(NSIndexPath*)indPath sender:(id)sender;

@end

@interface TblViewCell : UITableViewCell
{
    IBOutlet UIButton *btnDownload;
    IBOutlet UIProgressView *viewProgress;
    IBOutlet UILabel *lblTitle;
}
@property (nonatomic,strong) IBOutlet UIProgressView *viewProgress;
@property (nonatomic,strong) DownloadTask *objDownloadTask;
@property (nonatomic,strong) NSIndexPath *iPath;
@property (nonatomic,strong) id<TblViewCellDelegate> delegate;
-(void)setUI;
@end
