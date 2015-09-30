//
//  WorkEducationView.m
//  Resume
//
//  Created by OkSeJu on 1/24/15.
//  Copyright (c) 2015 com.fsoft.Resume. All rights reserved.
//

#import "WorkEducationView.h"
#import "Global.h"

@implementation WorkEducationView

@synthesize period = _period;
@synthesize title1 = _title1;
@synthesize content = _content;
@synthesize onoff = _onoff;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id) initWithFrame:(CGRect)frame{
    if((self = [super initWithFrame:frame])){
        //initialization.
    }
    return self;
}

-(void)initWithContentHeight:(int)rows {
/*
    [self initWithFrame:CGRectMake(0, 0, 320 - 10, 22 + rows*20)];
    self.period = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320/3 - 5, 20)];
    self.title1 = [[UILabel alloc] initWithFrame:CGRectMake(320/3 + 5, 0, 320/3*2 - 10, 20)];
    self.content = [[UITextView alloc] initWithFrame:CGRectMake(320/3 + 5, 22, 320/3*2- 10, rows*20)];
    if( IS_IPHONE5 ){
        [self initWithFrame:CGRectMake(0, 0, 320 - 10, 22 + rows*20)];
        self.period = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320/3 - 5, 20)];
        self.title1 = [[UILabel alloc] initWithFrame:CGRectMake(320/3 + 5, 0, 320/3*2 - 10, 20)];
        self.content = [[UITextView alloc] initWithFrame:CGRectMake(320/3 + 5, 22, 320/3*2- 10, rows*20)];
    }
    else if( IS_IPHONE6){
        [self initWithFrame:CGRectMake(0, 0, 375 - 10, 22 + rows*20)];
        self.period = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375/3 - 5, 20)];
        self.title1 = [[UILabel alloc] initWithFrame:CGRectMake(375/3 + 5, 0, 375/3*2 - 10, 20)];
        self.content = [[UITextView alloc] initWithFrame:CGRectMake(375/3 + 5, 22, 375/3*2- 10, rows*20)];
    }
    else{
        [self initWithFrame:CGRectMake(0, 0, 414 - 10, 22 + rows*20)];
        self.period = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 414/3 - 5, 20)];
        self.title1 = [[UILabel alloc] initWithFrame:CGRectMake(414/3 + 5, 0, 414/3*2 - 10, 20)];
        self.content = [[UITextView alloc] initWithFrame:CGRectMake(414/3 + 5, 22, 414/3*2- 10, rows*20)];
    }
 */
}

@end
