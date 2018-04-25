/* Automatically generated nanopb header */
/* Generated by nanopb-0.3.9 at Thu Jan 18 12:56:44 2018. */

#ifndef PB_ROKID_OPEN_SPEECH_V1_SPEECH_TYPES_PB_H_INCLUDED
#define PB_ROKID_OPEN_SPEECH_V1_SPEECH_TYPES_PB_H_INCLUDED
#include <pb.h>

/* @@protoc_insertion_point(includes) */
#if PB_PROTO_HEADER_VERSION != 30
#error Regenerate this file with the current version of nanopb generator.
#endif

#ifdef __cplusplus
extern "C" {
#endif

/* Enum definitions */
typedef enum _rokid_open_speech_v1_SpeechErrorCode {
    rokid_open_speech_v1_SpeechErrorCode_SUCCESS = 0,
    rokid_open_speech_v1_SpeechErrorCode_UNAUTHENTICATED = 2,
    rokid_open_speech_v1_SpeechErrorCode_CONNECTION_EXCEED = 3,
    rokid_open_speech_v1_SpeechErrorCode_RESOURCE_EXHASTED = 4,
    rokid_open_speech_v1_SpeechErrorCode_BUSY = 5,
    rokid_open_speech_v1_SpeechErrorCode_INTERNAL = 6,
    rokid_open_speech_v1_SpeechErrorCode_VAD_TIMEOUT = 7
} rokid_open_speech_v1_SpeechErrorCode;
#define _rokid_open_speech_v1_SpeechErrorCode_MIN rokid_open_speech_v1_SpeechErrorCode_SUCCESS
#define _rokid_open_speech_v1_SpeechErrorCode_MAX rokid_open_speech_v1_SpeechErrorCode_VAD_TIMEOUT
#define _rokid_open_speech_v1_SpeechErrorCode_ARRAYSIZE ((rokid_open_speech_v1_SpeechErrorCode)(rokid_open_speech_v1_SpeechErrorCode_VAD_TIMEOUT+1))

typedef enum _rokid_open_speech_v1_ReqType {
    rokid_open_speech_v1_ReqType_START = 0,
    rokid_open_speech_v1_ReqType_VOICE = 1,
    rokid_open_speech_v1_ReqType_END = 2,
    rokid_open_speech_v1_ReqType_TEXT = 3
} rokid_open_speech_v1_ReqType;
#define _rokid_open_speech_v1_ReqType_MIN rokid_open_speech_v1_ReqType_START
#define _rokid_open_speech_v1_ReqType_MAX rokid_open_speech_v1_ReqType_TEXT
#define _rokid_open_speech_v1_ReqType_ARRAYSIZE ((rokid_open_speech_v1_ReqType)(rokid_open_speech_v1_ReqType_TEXT+1))

typedef enum _rokid_open_speech_v1_Codec {
    rokid_open_speech_v1_Codec_PCM = 0,
    rokid_open_speech_v1_Codec_OPU = 1,
    rokid_open_speech_v1_Codec_OPU2 = 2
} rokid_open_speech_v1_Codec;
#define _rokid_open_speech_v1_Codec_MIN rokid_open_speech_v1_Codec_PCM
#define _rokid_open_speech_v1_Codec_MAX rokid_open_speech_v1_Codec_OPU2
#define _rokid_open_speech_v1_Codec_ARRAYSIZE ((rokid_open_speech_v1_Codec)(rokid_open_speech_v1_Codec_OPU2+1))

/* Struct definitions */
typedef struct _rokid_open_speech_v1_PingPayload {
    int32_t req_id;
    uint64_t now_tp;
    uint64_t req_tp;
    uint64_t resp_tp;
/* @@protoc_insertion_point(struct:rokid_open_speech_v1_PingPayload) */
} rokid_open_speech_v1_PingPayload;

/* Default values for struct fields */

/* Initializer values for message structs */
#define rokid_open_speech_v1_PingPayload_init_default {0, 0, 0, 0}
#define rokid_open_speech_v1_PingPayload_init_zero {0, 0, 0, 0}

/* Field tags (for use in manual encoding/decoding) */
#define rokid_open_speech_v1_PingPayload_req_id_tag 1
#define rokid_open_speech_v1_PingPayload_now_tp_tag 2
#define rokid_open_speech_v1_PingPayload_req_tp_tag 3
#define rokid_open_speech_v1_PingPayload_resp_tp_tag 4

/* Struct field encoding specification for nanopb */
extern const pb_field_t rokid_open_speech_v1_PingPayload_fields[5];

/* Maximum encoded size of messages (where known) */
#define rokid_open_speech_v1_PingPayload_size    44

/* Message IDs (where set with "msgid" option) */
#ifdef PB_MSGID

#define SPEECH_TYPES_MESSAGES \


#endif

#ifdef __cplusplus
} /* extern "C" */
#endif
/* @@protoc_insertion_point(eof) */

#endif