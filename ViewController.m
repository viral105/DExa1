//
//  ViewController.m
//  DExa1
//
//  Created by Viral Narshana on 4/9/16.
//  Copyright (c) 2016 Viral Narshana. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSMutableArray *arrFileDownloadData;
}
@property (nonatomic,strong)NSMutableArray *arrFileDownloadData;
@end

@implementation ViewController
@synthesize arrFileDownloadData;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initializeFileDownloadDataArray];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];

    NSArray *URLs = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    self.docDirectoryURL = [URLs objectAtIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initializeFileDownloadDataArray{
    self.arrFileDownloadData = [[NSMutableArray alloc] init];
    
    [self.arrFileDownloadData addObject:[[DownloadTask alloc] initWithFileTitle:@"iOS Programming Guide" andDownloadSource:@"http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_1mb.mp4"]];
    [self.arrFileDownloadData addObject:[[DownloadTask alloc] initWithFileTitle:@"Human Interface Guidelines" andDownloadSource:@"https://github.com/AFNetworking/AFNetworking/archive/master.zip"]];
    [self.arrFileDownloadData addObject:[[DownloadTask alloc] initWithFileTitle:@"Networking Overview" andDownloadSource:@"http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_5mb.mp4"]];
    [self.arrFileDownloadData addObject:[[DownloadTask alloc] initWithFileTitle:@"AV Foundation" andDownloadSource:@"http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_10mb.mp4"]];
    [self.arrFileDownloadData addObject:[[DownloadTask alloc] initWithFileTitle:@"iPhone User Guide" andDownloadSource:@"http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_20mb.mp4"]];
    [self.arrFileDownloadData addObject:[[DownloadTask alloc] initWithFileTitle:@"iPhone User Guide" andDownloadSource:@"http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_30mb.mp4"]];
    [self.arrFileDownloadData addObject:[[DownloadTask alloc] initWithFileTitle:@"iPhone User Guide" andDownloadSource:@"http://www.sample-videos.com/video/mp4/720/big_buck_bunny_720p_50mb.mp4"]];
    [self.arrFileDownloadData addObject:[[DownloadTask alloc] initWithFileTitle:@"iPhone User Guide" andDownloadSource:@"http://www.sample-videos.com/video/mp4/480/big_buck_bunny_480p_1mb.mp4"]];
    [self.arrFileDownloadData addObject:[[DownloadTask alloc] initWithFileTitle:@"iPhone User Guide" andDownloadSource:@"http://www.sample-videos.com/video/mp4/480/big_buck_bunny_480p_2mb.mp4"]];
    [self.arrFileDownloadData addObject:[[DownloadTask alloc] initWithFileTitle:@"iPhone User Guide" andDownloadSource:@"http://www.sample-videos.com/video/mp4/480/big_buck_bunny_480p_1mb.mp4"]];
}
-(void)updateArr:(DownloadTask*)obj indPath:(NSIndexPath*)indPath sender:(id)sender{

    int cellIndex = (int)indPath.row;
    
    // Get the FileDownloadInfo object being at the cellIndex position of the array.
    DownloadTask *fdi = [self.arrFileDownloadData objectAtIndex:cellIndex];
    
    // The isDownloading property of the fdi object defines whether a downloading should be started
    // or be stopped.
    if (!fdi.isDownloading) {
        // This is the case where a download task should be started.
        
        // Create a new task, but check whether it should be created using a URL or resume data.
        if (fdi.taskIdentifier == -1) {
            // If the taskIdentifier property of the fdi object has value -1, then create a new task
            // providing the appropriate URL as the download source.
            NSLog(@"fdi.downloadSource %@",fdi.downloadSource);
            fdi.downloadTask = [self.session downloadTaskWithURL:[NSURL URLWithString:fdi.downloadSource]];
            NSLog(@"fdi.downloadTask.taskIdentifier %ld",fdi.downloadTask.taskIdentifier);
            // Keep the new task identifier.
            fdi.taskIdentifier = fdi.downloadTask.taskIdentifier;
            
            // Start the task.
            [fdi.downloadTask resume];
        }
        else{
            // The resume of a download task will be done here.
        }
    }
    else{
        //  The pause of a download task will be done here.
    }
    
    // Change the isDownloading property value.
    fdi.isDownloading = !fdi.isDownloading;
    
    // Reload the table view.
    [tblView reloadRowsAtIndexPaths:@[indPath] withRowAnimation:UITableViewRowAnimationNone];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrFileDownloadData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TblViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    cell.delegate = self;
    cell.objDownloadTask = [self.arrFileDownloadData objectAtIndex:indexPath.row];
    cell.iPath = indexPath;
    [cell setUI];
    return cell;
}
- (IBAction)startOrPauseDownloadingSingleFile:(id)sender {
    // Check if the parent view of the sender button is a table view cell.
    if ([[[[sender superview] superview] superview] isKindOfClass:[UITableViewCell class]]) {
        // Get the container cell.
        TblViewCell *containerCell = (TblViewCell *)[[[sender superview] superview] superview];
        
        // Get the row (index) of the cell. We'll keep the index path as well, we'll need it later.
        NSIndexPath *cellIndexPath = [tblView indexPathForCell:containerCell];
        int cellIndex = (int)cellIndexPath.row;
        
        // Get the FileDownloadInfo object being at the cellIndex position of the array.
        DownloadTask *fdi = [self.arrFileDownloadData objectAtIndex:cellIndex];
        
        // The isDownloading property of the fdi object defines whether a downloading should be started
        // or be stopped.
        if (!fdi.isDownloading) {
            // This is the case where a download task should be started.
            
            // Create a new task, but check whether it should be created using a URL or resume data.
            if (fdi.taskIdentifier == -1) {
                // If the taskIdentifier property of the fdi object has value -1, then create a new task
                // providing the appropriate URL as the download source.
                fdi.downloadTask = [self.session downloadTaskWithURL:[NSURL URLWithString:fdi.downloadSource]];
                
                // Keep the new task identifier.
                fdi.taskIdentifier = fdi.downloadTask.taskIdentifier;
                
                // Start the task.
                [fdi.downloadTask resume];
            }
            else{
                // The resume of a download task will be done here.
            }
        }
        else{
            //  The pause of a download task will be done here.
        }
        
        // Change the isDownloading property value.
        fdi.isDownloading = !fdi.isDownloading;
        
        // Reload the table view.
        [tblView reloadRowsAtIndexPaths:@[cellIndexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
}
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    NSLog(@"totalBytesWritten %lld bytesWritten %lld totalBytesExpectedToWrite %lld",totalBytesWritten,bytesWritten,totalBytesExpectedToWrite);
    if (totalBytesExpectedToWrite == NSURLSessionTransferSizeUnknown) {
        NSLog(@"Unknown transfer size");
    }
    else{
        // Locate the FileDownloadInfo object among all based on the taskIdentifier property of the task.
        int index = [self getFileDownloadInfoIndexWithTaskIdentifier:downloadTask.taskIdentifier];
        DownloadTask *fdi = [self.arrFileDownloadData objectAtIndex:index];
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // Calculate the progress.
            fdi.downloadProgress = (double)totalBytesWritten / (double)totalBytesExpectedToWrite;
            
            // Get the progress view of the appropriate cell and update its progress.
            TblViewCell *cell = (TblViewCell*)[tblView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
            
            cell.viewProgress.progress = fdi.downloadProgress;
        }];
    }    
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    
    NSError *error;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *destinationFilename = downloadTask.originalRequest.URL.lastPathComponent;
    NSURL *destinationURL = [self.docDirectoryURL URLByAppendingPathComponent:destinationFilename];
    
    if ([fileManager fileExistsAtPath:[destinationURL path]]) {
        [fileManager removeItemAtURL:destinationURL error:nil];
    }
    
    BOOL success = [fileManager copyItemAtURL:location
                                        toURL:destinationURL
                                        error:&error];
    
    if (success) {
        // Change the flag values of the respective FileDownloadInfo object.
        int index = [self getFileDownloadInfoIndexWithTaskIdentifier:downloadTask.taskIdentifier];
        DownloadTask *fdi = [self.arrFileDownloadData objectAtIndex:index];
        
        fdi.isDownloading = NO;
        fdi.isDownloadComplete = YES;
        
        // Set the initial value to the taskIdentifier property of the fdi object,
        // so when the start button gets tapped again to start over the file download.
        fdi.taskIdentifier = -1;
        
        // In case there is any resume data stored in the fdi object, just make it nil.
        fdi.taskResumeData = nil;
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            // Reload the respective table view row using the main thread.
            [tblView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]]
                                 withRowAnimation:UITableViewRowAnimationNone];
            
        }];
        
    }
    else{
        NSLog(@"Unable to copy temp file. Error: %@", [error localizedDescription]);
    }
}
 
-(int)getFileDownloadInfoIndexWithTaskIdentifier:(unsigned long)taskIdentifier{
    int index = 0;
    for (int i=0; i<[self.arrFileDownloadData count]; i++) {
        DownloadTask *fdi = [self.arrFileDownloadData objectAtIndex:i];
        if (fdi.taskIdentifier == taskIdentifier) {
            index = i;
            break;
        }
    }
    
    return index;
}
@end
