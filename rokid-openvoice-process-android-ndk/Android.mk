LOCAL_PATH:= $(call my-dir)

ifndef ROKID_BLACKSIREN_CONFIG
ROKID_BLACKSIREN_CONFIG := rokid_dev_board
endif

$(shell mkdir -p $(TARGET_OUT_ETC))
$(shell cp $(LOCAL_PATH)/assets/etc/openvoice_profile.json $(TARGET_OUT_ETC))
$(shell cp $(LOCAL_PATH)/assets/etc/blacksiren_$(ROKID_BLACKSIREN_CONFIG).json $(TARGET_OUT_ETC)/blacksiren.json)
$(shell cp -r $(LOCAL_PATH)/assets/workdir_cn $(TARGET_OUT)/workdir_cn)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
		$(call all-java-files-under, src) \
		src/com/rokid/tts/ITts.aidl \
		src/com/rokid/tts/ITtsCallback.aidl \
		src/com/rokid/voicerec/BearKid.aidl
LOCAL_STATIC_JAVA_LIBRARIES := opus_player rokid_speech
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := true
LOCAL_PROGUARD_ENABLED := disabled
LOCAL_PACKAGE_NAME := openvoice_process
include $(BUILD_PACKAGE)

include $(CLEAR_VARS)
LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := \
		opus_player:libs/opus_player.jar \
		rokid_speech:libs/rokid_speech.jar 
include $(BUILD_MULTI_PREBUILT)

include $(CLEAR_VARS)
LOCAL_PREBUILT_LIBS := \
		libc++_shared:libs/$(TARGET_CPU_ABI)/libc++_shared \
		libopenvoice2:libs/$(TARGET_CPU_ABI)/libopenvoice2.so \
		libbsiren:libs/$(TARGET_CPU_ABI)/libbsiren.so \
		libopenvoice:libs/$(TARGET_CPU_ABI)/libopenvoice.so \
		libr2ssp:libs/$(TARGET_CPU_ABI)/libr2ssp.so \
		libr2vt:libs/$(TARGET_CPU_ABI)/libr2vt.so \
		libspeech:libs/$(TARGET_CPU_ABI)/libspeech.so \
		libztvad:libs/$(TARGET_CPU_ABI)/libztvad.so \
		libuWS:libs/$(TARGET_CPU_ABI)/libuWS.so
ifndef ALTER_MIC_ARRAY
LOCAL_PREBUILT_LIBS += libmic_array:$(DEPENDENT_LIBRARIES_PATH)/libmic_array.so
endif
include $(BUILD_MULTI_PREBUILT)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
		$(call all-java-files-under, jar) \
		src/com/rokid/voicerec/ActionToComponent.java \
		src/com/rokid/voicerec/CustomWord.java \
		src/com/rokid/voicerec/BearKidResult.java \
		src/com/rokid/voicerec/BearKid.aidl
LOCAL_JACK_ENABLED = disabled
LOCAL_MODULE := BearKidAdapter
include $(BUILD_STATIC_JAVA_LIBRARY)

include $(LOCAL_PATH)/demo/Android.mk
