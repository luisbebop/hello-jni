# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := $(call my-dir)
RUBY_ROOT := $(LOCAL_PATH)/../../mruby

$(shell mkdir -p $(LOCAL_PATH)/../obj/local/$(TARGET_ARCH_ABI))
$(shell cp $(RUBY_ROOT)/build/android-$(TARGET_ARCH_ABI)/lib/libmruby.a $(LOCAL_PATH)/../obj/local/$(TARGET_ARCH_ABI)/libmruby.a)

include $(CLEAR_VARS)
LOCAL_MODULE    := mruby
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := hello-jni
LOCAL_SRC_FILES := hello-jni.c
LOCAL_LDLIBS 	:= -llog
LOCAL_C_INCLUDES := $(RUBY_ROOT)/include $(RUBY_ROOT)/src
LOCAL_STATIC_LIBRARIES := mruby

include $(BUILD_SHARED_LIBRARY)