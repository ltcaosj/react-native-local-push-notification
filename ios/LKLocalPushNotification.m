#import <Foundation/Foundation.h>

#import "React/RCTBridgeModule.h"
#import "React/RCTEventEmitter.h"

@interface RCT_EXTERN_MODULE(LKLocalPushNotification, RCTEventEmitter)

RCT_EXTERN_METHOD(
                  notify:(NSString *)title
                  body:(NSString *)body
                )
RCT_EXTERN_METHOD(
  initialize
)
@end
