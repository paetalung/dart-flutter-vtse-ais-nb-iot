
1. we Gen and save Key Store is Here
C:\Users\key

2. and Here Put it here again for Publish
D:\AppDev-Flutter\03-app\vtse_obs\android\app\Users\key

3. Follow this document.
https://flutter.dev/docs/deployment/android

4.0  in File "build.gradle" Please comment  
     "signingConfigs.debug"  as same as this

            signingConfig signingConfigs.release
            //signingConfig signingConfigs.debug

4.1 in File "build.gradle" in Flutter Project 
   We have to **increase these 2 Variable** for
   Update new Version of our APP

   versionCode 3
   versionName '1.0.2'

4.1 in File "pubspec.yaml"in Flutter Project 
   We have to **increase this Variable** for
   Update new Version of our APP

   version: 1.0.1+2


4. To buile APK file
4.1  at Terminal CML > flutter clean
4.2  at Terminal CML > flutter build apk --release

5. Here is APK File
<APP FOLDER>\build\app\outputs\apk\release

6. Git









-------------
const MagellanURL =
    'https://magellan.ais.co.th/pullmessageapis/api/listen/thing/72B247A1EC3563F41338715A37BA4321';
const OpenWeatherMapURL =
    'https://api.openweathermap.org/data/2.5/weather?lat=10.7091&lon=99.3182&appid=e1b02b6dacf04857637967f73c961101';

-------------

Flutter does not support android studio 4.1
HERE IS  OUR IT WORKS FOR ME
The problem is with the 1.22 stable version I guess

step1 : run> flutter channel dev
step2  : run> flutter channel upgrade
step3 : run > flutter config --android-studio-dir="C:\Program Files\Android\Android Studio"
