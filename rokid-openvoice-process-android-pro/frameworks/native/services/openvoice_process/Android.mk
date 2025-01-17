LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include

LOCAL_SRC_FILES := \
		src/IVoiceService.cpp \
		src/callback/IVoiceCallback.cpp

LOCAL_SHARED_LIBRARIES := \
		libbinder \
		libutils

LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include

ifeq ($(PLATFORM_SDK_VERSION), 22)
LOCAL_SHARED_LIBRARIES += libc++ libdl
LOCAL_C_INCLUDES += external/libcxx/include
else ifeq ($(PLATFORM_SDK_VERSION), 19)
LOCAL_C_INCLUDES += \
		external/stlport/stlport \
		bionic
LOCAL_STATIC_LIBRARIES += libstlport_static
endif

LOCAL_MODULE := libopenvoice
include $(BUILD_SHARED_LIBRARY)

#########################################################################
#
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
		src/callback/CallbackProxy.cpp \
		src/VoiceService.cpp \
		src/audio_recorder.cpp \
		src/main.cpp

LOCAL_SHARED_LIBRARIES := \
		libhardware \
		libbinder \
		libutils \
		liblog \
		libopenvoice \
		libbsiren \
		libspeech

LOCAL_C_INCLUDES += \
		$(LOCAL_PATH)/include \
		$(LOCAL_PATH)/../../../../hardware/include \
		$(LOCAL_PATH)/../../../../../rokid-blacksiren/include \
		$(LOCAL_PATH)/../../../../../rokid-blacksiren/thirdparty/libjsonc/include

ifeq ($(PLATFORM_SDK_VERSION), 22)
LOCAL_SHARED_LIBRARIES += libc++ libdl
LOCAL_C_INCLUDES += external/libcxx/include
else ifeq ($(PLATFORM_SDK_VERSION), 19)
MY_LOCAL_STATIC_LIBRARIES := prebuilts/ndk/current/sources/cxx-stl/gnu-libstdc++/libs/$(TARGET_CPU_ABI)/libgnustl_static.a
LOCAL_LDFLAGS += $(MY_LOCAL_STATIC_LIBRARIES) -ldl
LOCAL_C_INCLUDES += \
		prebuilts/ndk/current/sources/cxx-stl/gnu-libstdc++/libs/$(TARGET_CPU_ABI)/include \
		prebuilts/ndk/current/sources/cxx-stl/gnu-libstdc++/include \
		external/stlport/stlport \
		bionic
endif

LOCAL_MODULE := openvoice_proc
LOCAL_ARM_MODE := arm
LOCAL_CPPFLAGS := -DCURRENT_ANDROID_PLATFORM_SDK_VERSION=$(PLATFORM_SDK_VERSION) -std=c++11 #-DUSB_AUDIO_DEVICE
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_TARGET_ARCH := arm

include $(BUILD_EXECUTABLE)
