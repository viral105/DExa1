//
//  DownloadTask.m
//  
//
//  Created by Viral Narshana on 4/9/16.
//
//

#import "DownloadTask.h"

@implementation DownloadTask

-(id)initWithFileTitle:(NSString *)title andDownloadSource:(NSString *)source{
    if (self == [super init]) {
        self.fileTitle = title;
        self.downloadSource = source;
        self.downloadProgress = 0.0;
        self.isDownloading = NO;
        self.isDownloadComplete = NO;
        self.taskIdentifier = -1;
    }
    
    return self;
}
@end
