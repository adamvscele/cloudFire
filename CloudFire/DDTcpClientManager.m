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
+(instancetype)instance{
    static DDTcpClientManager* g_tcpClientManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        g_tcpClientManager = [[DDTcpClientManager alloc]init];
    });
    return g_tcpClientManager;
}



-(void)connect:(NSString *)ip port:(NSInteger)port status:(NSInteger)status{
    
    _receiveBuffer =[NSMutableData data];

    _receiveLock =[[NSLock alloc]init];
    
    
    NSInputStream *tmpInput = nil;
    NSOutputStream * tmpOutput = nil;
    
    [NSStream getStreamsToHostWithName:ip port:port inputStream:&tmpInput outputStream:&tmpOutput];
    
    _inStream = tmpInput;
    _outputStream = tmpOutput;
    [_inStream setDelegate:self];
    [_outputStream setDelegate:self];
    
    [_inStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [_outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];

    [_inStream open];
    [_outputStream open];
    
}

-(void)disconnect{
    _receiveLock =nil;
    if (_inStream) {
        [_inStream close];
        [_inStream removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    }
    _inStream = nil;
    _receiveBuffer = nil;
}

-(void)writeToSocket:(NSMutableData*)data{
    [_sendLock lock];
    @try {
        if (_noDataSent == YES) {
            _noDataSent = NO;
            NSInteger len;
            len =[_outputStream write:[data mutableBytes] maxLength:[data length]];
            if (len < [data length]) {
                
            
                ...
                return;
            }
            
            
        }
    } @catch (NSException *exception) {
        <#Handle an exception thrown in the @try block#>
    } @finally {
        <#Code that gets executed whether or not an exception is thrown#>
    }
}


-(void)p_handleConnectCompleteStream:(NSStream *)sStream{
    if (sStream == _outputStream) {
        
    }
}

-(void)p_handleEventHasBytesAvailableStream:(NSStream *)aStream{
    if (aStream) {
        uint8_t buf[1024];
        NSInteger len =0;
        len = [(NSInputStream*)aStream read:buf maxLength:1024];
        if (len >0) {
            [_receiveLock lock];
            [_receiveBuffer appendBytes:buf length:len];
            NSString * string =[[NSString alloc] initWithData:_receiveBuffer encoding:NSUTF8StringEncoding];
            NSLog(@"%@",string);
            
            
            //            while ([_receiveBuffer length] >= 16) {
//                NSRange range = NSMakeRange(0, 16);
//                NSData *headerData = [_receiveBuffer subdataWithRange:range];
//                
//                
//            }
        }
        
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
            
            [self p_handleEventErrorOccuredStream:aStream];
            ;break;
        case NSStreamEventEndEncountered:
            [self p_handleEventEndEncounteredStream:aStream];
            ;break;
        case NSStreamEventHasSpaceAvailable:
            [self p_handleEventHasSpaceAvailableStream:aStream];
            ;break;
            
        default:
            break;
    }
}
@end
