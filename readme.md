#mruby + android + JNI = S2

0. Install android NDK and android SDK
1. Clone this repository to the same directory of mruby project from github.com/luisbebop/mruby
2. Enter on mruby dir and rename build_config_android.rb to build_config.rb
3. make all
4. Go back to this directory and enter on jni
5. ndk-build
6. cd ..
7. ant debug install
8. adb logcat

The mruby-print gem implements the method p that prints messages on log output from android. The method inside hello-jni.c is called by HelloJni.java via jni. Inside this method there is an initilization of a mruby runtime and a little ruby code that will print the output on adb logcat from android.