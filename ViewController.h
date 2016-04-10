//
//  ViewController.h
//  DExa1
//
//  Created by Viral Narshana on 4/9/16.
//  Copyright (c) 2016 Viral Narshana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DownloadTask.h"
#import "TblViewCell.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,TblViewCellDelegate,NSURLSessionDelegate,NSURLSessionDownloadDelegate>
{
    IBOutlet UITableView *tblView;
}
@property (nonatomic,strong) NSURLSession *session;
@property (nonatomic, strong) NSURL *docDirectoryURL;
- (IBAction)startOrPauseDownloadingSingleFile:(id)sender;

- (IBAction)stopDownloading:(id)sender;

- (IBAction)startAllDownloads:(id)sender;

- (IBAction)stopAllDownloads:(id)sender;

- (IBAction)initializeAll:(id)sender;

-(void)initializeFileDownloadDataArray;


@end

