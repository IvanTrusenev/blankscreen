# blankscreen

This application implements a stub page and works according to the following logic:
1. Checking whether the main url is saved locally
2. If the main url is saved locally, check the internet connection
   2.1. If internet connection is unavailable, show no_internet_connection screen
   2.2. If internet connection is available, show main screen
3. If the main url isn't saved locally, get the link from Firebase Remote Config
   3.1. If the link from Remote Config is empty or application is running on the emulator, show news screen
   3.2. Otherwise, save the link locally and show the main screen


## Used tools and libraries

- Remote config: **Firebase Remote Config**
- State management: **flutter_bloc**
- Database: **hive**
- REST API: **http**
- API provider: **newsapi.org**
- Web view: **webview_flutter**
- Navigation: **go_router**
- Adaptive layout: **flutter_screenutil**
- Code generator: **json_serializable**, **hive_generator**
