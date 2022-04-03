#import "iPhoneSpeaker.h"
#import <AVFoundation/AVFoundation.h>

void _checkiOSPrepare()
{
	AVAudioSession *session = [AVAudioSession sharedInstance];

	NSError *setCategoryError = nil;
    [session setCategory:AVAudioSessionCategoryPlayAndRecord
             error:&setCategoryError];
}

void _forceToSpeaker() {
    // want audio to go to headset if it's connected
    if (_headsetConnected()) {
        return;
    }
    
    AVAudioSession *session = [AVAudioSession sharedInstance];
    
    NSError *setCategoryError = nil;
    if (![session setCategory:AVAudioSessionCategoryPlayAndRecord
                  withOptions:AVAudioSessionCategoryOptionDefaultToSpeaker
                        error:&setCategoryError]) {
        // handle error
        NSLog(@"Audio already playing through speaker!");
    }
    else{
        NSLog(@"Forcing audio to speaker");
    }
}

bool _headsetConnected() {
    
    AVAudioSessionRouteDescription* route = [[AVAudioSession sharedInstance] currentRoute];
    for (AVAudioSessionPortDescription* desc in [route outputs]) {
        if ([[desc portType] isEqualToString:AVAudioSessionPortHeadphones] ||
            [[desc portType] isEqualToString:AVAudioSessionPortBluetoothA2DP] ||
            [[desc portType] isEqualToString:AVAudioSessionPortBluetoothLE] ||
            [[desc portType] isEqualToString:AVAudioSessionPortBluetoothHFP]
            )
            return true;
    }
    return false;
}
