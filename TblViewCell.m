//
//  TblViewCell.m
//  
//
//  Created by Viral Narshana on 4/9/16.
//
//

#import "TblViewCell.h"

@implementation TblViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setUI{
    lblTitle.text = self.objDownloadTask.fileTitle;
    if (self.objDownloadTask.isDownloading){
        viewProgress.progress = self.objDownloadTask.downloadProgress;
    }
    else{
        self.viewProgress.progress = self.objDownloadTask.downloadProgress;
    }
    
    if (self.objDownloadTask.isDownloadComplete) {
        [btnDownload setTitle:@"DComplete" forState:UIControlStateNormal];
    }
}
-(IBAction)btnDownload_Click:(id)sender{
    [self.delegate updateArr:self.objDownloadTask indPath:self.iPath sender:sender];
}
@end
