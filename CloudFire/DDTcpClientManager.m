//
//  DDTcpClientManager.m
//  CloudFire
//
//  Created by macos on 2018/1/22.
//  Copyright © 2018年 jbu. All rights reserved.
//

#import "DDTcpClientManager.h"


@interface DDTcpClientManager()
-(void)p_handleConnectCompleteStream:(NSStream*)sStream;
-(void)p_handleEventErrorOccuredStream:(NSStream*)aStream;
-(void)p_handleEventEndEncounteredStream:(NSStream*)aStream;
-(void)p_handleEventHasBytesAvailableStream:(NSStream*)aStream;
-(void)p_handleEventHasSpaceAvailableStream:(NSStream*)aStream;
@end

@implementation DDTcpClientManager

-(void)connect:(NSString *)ip port:(NSInteger)port status:(NSInteger)status{
    
    NSInputStream *tmpInput = nil;
    NSOutputStream * tmpOutput = nil;
    
    [NSStream getStreamsToHostWithName:ip port:port inputStream:&tmpInput outputStream:&tmpOutput];
    
    _inputStream = tmpInput;
    _outputStream = tmpOutput;
    [_inputStream setDelegate:self];
    [_outputStream setDelegate:self];
    
    [_inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [_outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];

    [_inputStream open];
    [_outputStream open];
    
}

-(void)p_handleConnectCompleteStream:(NSStream *)sStream{
    if (sStream == _outputStream) {
        
    }
}

-(void)p_handleEventHasBytesAvailableStream:(NSStream *)aStream{
    if (aStream) {
        uint8_t buf[1024];
        
        
    }
}




-(void)stream:(NSStream *)aStream handleEvent:(NSStreamEvent)eventCode{
    switch (eventCode) {
        case NSStreamEventNone:
            
            break;
        case NSStreamEventOpenCompleted:
            
            [self p_handleConnectCompleteStream:aStream];
            ;break;
        case NSStreamEventHasBytesAvailable:
             [self p_handleEventHasBytesAvailableStream:aStream];
            ;break;
        case NSStreamEventErrorOccurred:
            
            
            ;break;
        case NSStreamEventEndEncountered:;break;
        case NSStreamEventHasSpaceAvailable:;break;
            
        default:
            break;
    }
}
@end
