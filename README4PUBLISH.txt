
1. we Gen and save Key Store is Here
C:\Users\key

2. and Here Put it here again for Publish
D:\AppDev-Flutter\03-app\vtse_obs\android\app\Users\key

3. Follow this document.
https://flutter.dev/docs/deployment/android

4. in File "build.gradle" in Flutter Project 
   We have to increase these 2 Variable for
   Update new Version of our APP

   versionCode 3
   versionName '1.0.2'

   


4. To buile APK file
4.1  at Terminal CML > flutter clean
4.2  at Terminal CML > flutter build apk --release

5. Here is APK File
<APP FOLDER>\build\app\outputs\apk\release



-------------
const MagellanURL =
    'https://magellan.ais.co.th/pullmessageapis/api/listen/thing/72B247A1EC3563F41338715A37BA4321';
const OpenWeatherMapURL =
    'https://api.openweathermap.org/data/2.5/weather?lat=10.715056&lon=99.359889&appid=e1b02b6dacf04857637967f73c961101';

