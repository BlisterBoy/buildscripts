LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := main

PLAYER_PATH := ../../../..

LOCAL_CPP_EXTENSION := .cxx .cpp

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/$(PLAYER_PATH)/src \
	$(LOCAL_PATH)/$(PLAYER_PATH)/lib/shinonome \
	$(LOCAL_PATH)/$(PLAYER_PATH)/lib/readers/include \
	$(EASYDEV_ANDROID)/include

# Add your application source files here...
LOCAL_SRC_FILES := SDL_android_main.c \
	$(patsubst $(LOCAL_PATH)/%, %, $(wildcard $(LOCAL_PATH)/$(PLAYER_PATH)/src/*.cpp)) \
	$(patsubst $(LOCAL_PATH)/%, %, $(wildcard $(LOCAL_PATH)/$(PLAYER_PATH)/src/*.c)) \
	$(patsubst $(LOCAL_PATH)/%, %, $(wildcard $(LOCAL_PATH)/$(PLAYER_PATH)/lib/shinonome/*.cxx)) \
	$(patsubst $(LOCAL_PATH)/%, %, $(wildcard $(LOCAL_PATH)/$(PLAYER_PATH)/lib/readers/src/*.cpp)) \
	$(patsubst $(LOCAL_PATH)/%, %, $(wildcard $(LOCAL_PATH)/$(PLAYER_PATH)/lib/readers/src/generated/*.cpp)) \	

#LOCAL_SHARED_LIBRARIES := SDL2 SDL2_mixer pixman png iconv

LOCAL_LDLIBS := -L$(EASYDEV_ANDROID)/libs/armeabi-v7a -lGLESv1_CM -llog -lz \
	-lSDL2 -lSDL2_mixer -lpixman -liconv -lpng -lsmpeg2 -lfreetype2-static

LOCAL_CFLAGS := -O2 -Wall -Wextra -fno-rtti -DUSE_SDL -DHAVE_SDL_MIXER -DNDEBUG -DUNIX
LOCAL_CPPFLAGS	=	$(LOCAL_C_FLAGS) -fno-exceptions -std=c++0x

include $(BUILD_SHARED_LIBRARY)
