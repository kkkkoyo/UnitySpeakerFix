Update
Unity has add Force iOS Speakers in PlayerSetting, you would try this.

WARNING
=======

This is based on https://github.com/cbaltzer/UnitySpeakerFix, I have update code to use on iOS 7.0 - 12.0 with Unity 2018 (Nov, 2018)

***

Unity iPhone Speaker Fix
========================

When using microphone input, Unity iPhone switches audio output to the earpiece speaker, 
instead of the usual speakerphone speaker. As a result, all the audio in game suddenly 
becomes very quiet, even at max volume. In particular, this is problematic for games 
which include voice-chat. 


How-To
======

Simply install the Unity package, 
add a call to `iPhoneSpeaker.CheckiOSPrepare()` before you call `Microphone.Start()`. 
add a call to `iPhoneSpeaker.ForceToSpeaker()` before you call `audio.Play()`.

Credit
======

Base code from these two SO threads:
* http://stackoverflow.com/questions/9784573/play-and-record-audiosessionsetproperty
* http://stackoverflow.com/questions/5036399/how-do-you-force-audio-to-come-out-of-the-iphone-speaker-when-a-headset-is-attac


