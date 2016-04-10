//
//  DownloadTask.h
//  
//
//  Created by Viral Narshana on 4/9/16.
//
//

#import <Foundation/Foundation.h>

@interface DownloadTask : NSObject

@property (nonatomic, strong) NSString *fileTitle;

@property (nonatomic, strong) NSString *downloadSource;

@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;

@property (nonatomic, strong) NSData *taskResumeData;

@property (nonatomic) double downloadProgress;

@property (nonatomic) BOOL isDownloading;

@property (nonatomic) BOOL isDownloadComplete;

@property (nonatomic) unsigned long taskIdentifier;

-(id)initWithFileTitle:(NSString *)title andDownloadSource:(NSString *)source;

@end
