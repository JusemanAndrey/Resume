//
//  FileHandle.m
//  Resume
//
//  Created by OkSeJu on 1/23/15.
//  Copyright (c) 2015 com.fsoft.Resume. All rights reserved.
//

#import "FileHandle.h"

@implementation FileHandle

- ( void ) initFile:(NSString *) filename {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    NSString *dataFile = [docsDir stringByAppendingPathComponent:filename];
    
    if( ![fileManager fileExistsAtPath:dataFile] ){ //not exist?
        NSString *pattern;
        NSError *error = noErr;
        if( [filename isEqualToString:@"objectives.txt"]) {
            pattern = [NSString stringWithFormat:@"%@\n%@\n%@\n", @"objective1", @"objective2", @"objective3", nil];
        }
        else if( [filename isEqualToString:@"skills.txt"]){
            pattern = [NSString stringWithFormat:@"%@\n%@\n%@\n", @"skill1", @"skill2", @"skill3", nil];
        }
        else if( [filename isEqualToString:@"references.txt"] ){
            pattern = [NSString stringWithFormat:@"%@\n%@\n%@\n", @"references1", @"references2", @"references3", nil];
        }
        else if( [filename isEqualToString:@"addings.txt"] ){
            pattern = [NSString stringWithFormat:@"%@\n%@\n%@\n", @"adding1", @"adding2", @"adding3", nil];
        }
        else if( [filename isEqualToString:@"persionalinfo.txt"] ){
            pattern = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n", @"name", @"email", @"phonenumber", @"address", nil];
        }
        else if( [filename isEqualToString:@"workexperience.txt"] ){
            pattern = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@\n",@"##", @"period", @"title", @"-workexperience1", @"-workexperience2", @"-workexperience3", nil];
        }
        if( [filename isEqualToString:@"education.txt"] ){
            pattern = [NSString stringWithFormat:@"%@\n%@\n%@\n%@\n%@\n%@\n",@"##", @"period", @"title", @"-education1", @"-education2", @"-education3", nil];
        }
        BOOL success = [pattern writeToFile:dataFile atomically:YES encoding:NSUTF8StringEncoding error:&error];
        if (!success) {
            // handle the error
            NSLog(@"%@", error);
        }
    }
//    else{
//        if( [filename isEqualToString:@"workexperience.txt"] || [filename isEqualToString:@"education.txt"]){
//            [fileManager removeItemAtPath:dataFile error:NULL];
//        }
//    }
}


- (NSMutableArray *)getPanelsCount:(NSString*)filename{// ##delete
    NSMutableArray *retArr = [[NSMutableArray alloc] init];
    NSArray *allArray  = [self getContents:filename];//all sum
    NSString *prefix = @"", *suffix = @"";
    BOOL on = false;
    int cnt = 0;
    int loop = 0;
    
    for( NSString * each in allArray){
        if([each hasPrefix:@"-"]){
            suffix = [suffix stringByAppendingString:[each substringFromIndex:1]];
            suffix = [suffix stringByAppendingString:@"\n"];
            cnt++;
            on = true;
        }
        else{
            if( on ){
                prefix = [prefix substringFromIndex:3];
                prefix = [prefix stringByAppendingString:suffix];
                [retArr addObject:prefix];
                prefix = @"";
                suffix = @"";
                cnt = 0;
                on = false;
                loop++;
            }
            if(![each isEqualToString:@""]) {
                prefix = [prefix stringByAppendingString:each];
                prefix = [prefix stringByAppendingString:@"\n"];
            }
        }
    }
    return retArr;
}

- (NSArray *) getContents:(NSString *)filename{//as original string
    [self initFile:filename];
    NSFileManager *filemgr = [NSFileManager defaultManager];
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    NSString *dataFile = [docsDir stringByAppendingPathComponent:filename];    
    NSData *databuffer = [filemgr contentsAtPath:dataFile];
    NSString *contents = [[NSString alloc] initWithData:databuffer encoding:NSUTF8StringEncoding];
    NSArray *lines = [contents componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n"]];
    return lines;
}

- (bool) setContents:(NSString *)filename strings:(NSArray *) strArray{
    [self initFile:filename];
    NSFileManager *filemgr = [NSFileManager defaultManager];
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    NSString *dataFile = [docsDir stringByAppendingPathComponent:filename];
    if ([filemgr fileExistsAtPath:dataFile]){
        [filemgr removeItemAtPath:dataFile error:NULL];
        [filemgr createFileAtPath:dataFile contents:nil attributes:nil];
    }
    NSString *total = @"";
    for( NSString * each in strArray){
        if( ![each isEqualToString:@""] ){
            total = [total stringByAppendingString:each];
            total = [total stringByAppendingFormat:@"\n"];
        }
    }
    BOOL success = [total writeToFile:dataFile atomically:YES encoding:NSUTF8StringEncoding error:NULL];
    return success;
}

@end
