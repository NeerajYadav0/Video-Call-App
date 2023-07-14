import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';
import 'package:video_call/resources/auth_methods.dart';
import 'package:video_call/resources/firestore_methods.dart';

class JitsiMeetMethods
{
  final AuthMethods _authMethods = AuthMethods();
  final FirestoreMethods _firestoreMethods = FirestoreMethods();
  
  

  void createMeeting({
    required String roomName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = '',
  }) async {
    try {
      String name;
      if (username.isEmpty) {
        name = _authMethods.user.displayName!;
      } else {
        name = username;
      }

        var options = JitsiMeetingOptions(
      userDisplayName: name,
      roomNameOrUrl: roomName,
      userEmail: _authMethods.user.email,
      isAudioMuted: isAudioMuted,
      isVideoMuted: isVideoMuted,
    );
    _firestoreMethods.addToMeetingHistory(roomName);
  await JitsiMeetWrapper.joinMeeting(options: options);

      
    } catch (error) {
      print("error: $error");
    }
  }
}