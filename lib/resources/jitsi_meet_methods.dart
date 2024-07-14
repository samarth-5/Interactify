import 'package:interactify/resources/auth_methods.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

class JitsiMeetMethods {
  final AuthMethods _authMethods = AuthMethods(); 
  
  void createMeeting({required String roomName, required bool isAudioMuted, required isVideoMuted}) async{
    try{
      var jitsiMeet = JitsiMeet();
      //var options = JitsiMeetConferenceOptions(room: roomName);
      var options = JitsiMeetConferenceOptions(
      serverURL: "https://meet.jit.si",
      room: roomName,
      configOverrides: {
        "startWithAudioMuted": isAudioMuted,
        "startWithVideoMuted": isVideoMuted,
        "subject" : "Jitsi with Flutter",
      },
      featureFlags: {
        "unsaferoomwarning.enabled": false
      },
      userInfo: JitsiMeetUserInfo(
          displayName: _authMethods.user.displayName,
          email: _authMethods.user.email,
      ),
    );
      jitsiMeet.join(options);
    }
    catch(err){
      print("Error:$err");
    }
  }
}