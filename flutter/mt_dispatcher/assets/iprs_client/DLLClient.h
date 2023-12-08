

typedef unsigned char byte_t;

/**
	export symbol from IPRS Dll
*/

// Callback function
typedef bool (on_received_buffer_t)(void inst, const unsigned buffer, unsigned size);

/* DLL exported function prototypes
The actual function symbols are the same as the typedef identifier minus the _t, e.g. 
"IprsRemoteDllInitCore". Use GetProcAddress to retrieve them.
The symbols are in ASCII on PC, Unicode on Windows Mobile.
*/

typedef enum ECoreInitErrors_t
{
	ECIERR_OK = 0,
	ECIERR_INTERNAL,						// internal error
	ECIERR_INVALID_INST,					// invalid instance handle
	ECIERR_ALREADY_INIT,					// cannot initialize, already initialized
	ECIERR_NOT_INIT,						// cannot sign in, not initialized
	ECIERR_ALREADY_STARTED,					// cannot sign in, already signed-in
	ECIERR_OSAL,							// OS abstraction layer could not initialize
	ECIERR_INVALID_CMD_LINE,				// command line syntax is invalid
	ECIERR_INVALID_USER_ID,					// user ID is not configured properly
	ECIERR_INVALID_USER_PASSWORD,			// user password is not configured properly
	ECIERR_INVALID_VOCODER,					// vocoder is not configured properly
	ECIERR_INVALID_SERVER_ADDRESS,			// server IP address is not configured properly
	ECIERR_INVALID_RECORD_LENGTH,			// recording length is not configured properly

	ECIERR_NUM_ERRORS,

	// force type size to be 32 bits
	ECIERR_MAX_VAL = 0x7FFFFFFFL
} ECoreInitErrors;


typedef ECoreInitErrors (IprsRemoteDllInitCore_t)();
typedef bool (IprsRemoteDllTerminateCore_t)();
typedef bool (IprsRemoteDllExecute_t)(const char instruction);
typedef void (IprsRemoteDllSetReceiver_t)(void inst, on_received_buffer_t received_buf_cb);


// General
#define STR_OK									"OK"
#define STR_FAILED								"failed"
#define STR_UNSUPPORTED							"unsupported"
#define STR_LENGTH_EXCEEDED						"length-exceeded"

#define STR_VERSION								"version"
#define STR_IPRS_PROTOCOL						"protocol-version"
#define STR_GET_IPRS_PROTOCOL					"get-protocol-version"
#define STR_CLIENT_OWN_ID						"client-own-id"
#define STR_CLIENT_OWN_NAME						"client-own-name"

#define STR_SERVICES							"services"
#define STR_DISPATCHER							"dispatcher"
#define STR_ENABLED_SERVICES					"enabled-services"

#define STR_FINISHED 	 						"finished"

// Initialization errors
#define STR_SIGN_IN_FAILED						"sign-in-failed"
#define STR_NO_USER_ID							"no-user-id"
#define STR_NO_PASSWORD							"no-password"
#define STR_NO_SERVER							"no-server"
#define STR_INTERNAL_ERROR						"internal-error"
#define STR_INVALID_INSTANCE					"invalid-instance"
#define STR_ALREADY_INITIALIZED					"already-initialized"
#define STR_NOT_INITIALIZED						"not-initialized"
#define STR_ALREADY_STARTED						"already-started"
#define STR_OSAL								"OSAL"
#define STR_INVALID_COMMAND_LINE				"invalid-command-line"
#define STR_NO_VOCODER							"no-vocoder"
#define STR_INVALID_RECORD_LENGTH				"invalid-record-length"

// Configuration
#define STR_SET									"set"
#define STR_USERNAME							"username"
#define STR_PASSWORD							"password"
#define STR_SERVER								"server"
#define STR_LOGIN_LEVEL							"login-level"
#define STR_INITIAL_STATE						"initial-state"
#define STR_AUDIO_RECORD_LENGTH					"audio-recording-length"
#define STR_NAT_INTERVAL						"nat-interval"
#define STR_CONTROL_PORT						"control-port"
#define STR_AUDIO_PORT							"audio-port"
#define STR_DEFAULT								"default"
#define STR_CONN_MGR_USE						"conn-mgr"
#define STR_FORGET_ME							"forget-me"
#define STR_REMEMBER_USERNAME					"remember-username"
#define STR_REMEMBER_PASSWORD					"remember-password"
#define STR_AUTOMATIC							"automatic"
#define STR_WAVE_INPUT_DEVICE					"wave-input-device"
#define STR_WAVE_OUTPUT_DEVICE					"wave-output-device"
#define STR_AUDIO_INPUT_RATE					"audio-input-rate"
#define STR_AUDIO_OUTPUT_RATE					"audio-output-rate"

// General operation & status
#define STR_SIGN_IN								"sign-in"
#define STR_SIGN_OUT							"sign-out"
#define STR_CHANGE_STATE						"change-state"
#define STR_STATE								"state"
#define STR_OFFLINE								"offline"
#define STR_DISCONNECTING						"disconnecting"
#define STR_SHUTTING_DOWN						"shutting-down"
#define STR_ACQUIRING_NETWORK					"acquiring-network"
#define STR_CONNECTING							"connecting"
#define STR_SYNCHRONIZING						"synchronizing"
#define STR_ONLINE								"online"
#define STR_PAGEME								"page-me"
#define STR_DND									"DND"
#define STR_NO_NETWORK							"no-network"
#define STR_NO_SERVICE							"no-service"
#define STR_QUIT								"quit"
#define STR_TERMINATE							"terminate"

// Registration errors
#define STR_SIGN_IN_DENIED						"sign-in denied"
#define STR_UNKNOWN								"unknown"
#define STR_UNRECOGNIZED						"unrecognized"
#define STR_AUTH_ERROR							"auth-error"
#define STR_WRONG_VERSION						"wrong-version"
#define STR_UNKNOWN_NETWORK						"unknown-network"
#define STR_INVALID_PARAMETERS					"invalid-parameters"
#define STR_CREDIT_ERROR						"credit-error"
#define STR_SERVER_ERROR						"server-error"
#define STR_NAT_ADDRESS_ERROR					"NAT-address-error"

// Call management & information
#define STR_CALL								"call"
#define STR_ORIGINATING							"originating"
#define STR_CONNECTED							"connected"
#define STR_FAILED								"failed"
#define STR_ACCEPTED							"accepted"
#define STR_MODIFIED							"modified"
#define STR_QUERY								"query"
#define STR_CANCELED							"canceled"
#define STR_REQUESTED							"requested"
#define STR_ENDED								"ended"
#define STR_PRIVATE								"private"
#define STR_CHAT_ROOM							"chat-room"
#define STR_CONFERENCE							"conference"
#define STR_PERSONAL_GROUP						"personal-group"
#define STR_ADHOC								"ad-hoc"
#define STR_CALL_PRESENCE						"call-presence"
#define STR_CALL_INFO							"call-info"
#define STR_SESSION_MEMBERS						"call-participants"
#define STR_CALL_REQUEST						"call-request"
#define STR_LEAVE								"leave"
#define STR_INCOMING_CALL						"incoming-call"
#define STR_REJECTED							"rejected"
#define STR_TIMED_OUT							"timed-out"
#define STR_REQUEST								"request"
#define STR_PARTICIPANT  						"participant"
#define STR_ADD_TO_SESSION						"add-to-session"

// Call parameters
#define STR_PRIORITY							"priority"
#define STR_LOW									"low"
#define STR_NORMAL								"normal"
#define STR_HIGH								"high"
#define STR_URGENT								"urgent"
#define STR_EMERGENCY							"emergency"
#define STR_ANNOUNCEMENT						"announcement"
#define STR_DRIVER								"driver"
#define STR_PASSENGERS							"passengers"
#define STR_OUTSIDE_SPEAKER						"outside-speaker"
#define STR_INITIATOR_ENDS_CALL					"initiator-ends-call"
#define STR_SIMPLEX								"simplex"
#define STR_NON_INITIATOR_CANNOT_LEAVE			"non-initiator-cannot-leave"
#define STR_INITIATOR							"initiator"
#define STR_ALL									"all"
#define STR_AUDIO_OUTPUT_DEVICE					"audio-output-device"

// Call end/failure reasons
#define STR_ORIGINATION_ABORTED					"origination-aborted"
#define STR_INVALID_NUMBER						"invalid-number"
#define STR_OWN_NUMBER							"own-number"
#define STR_NO_DEFAULT_CHATROOM					"no-default-chatroom"
#define STR_NO_PERMISSION						"no-permission"
#define STR_NO_CREDIT							"no-credit"
#define STR_USER_UNAVAILABLE					"user-unavailable"
#define STR_SERVER_CONFIGURATION				"server-configuration"
#define STR_NO_VOCODER							"no-vocoder"
#define STR_NORMALLY							"normally"
#define STR_IDLE_TIMEOUT						"idle-timeout"
#define STR_ORIGINATION_ABORTED					"origination-aborted"
#define STR_INTERRUPTED_BY_OUTGOING_CALL		"interrupted-by-outgoing-call"
#define STR_INTERRUPTED_BY_INCOMING_CALL		"interrupted-by-incoming-call"
#define STR_INTERRUPTED_BY_INCOMING_VOICE_CALL	"interrupted-by-incoming-voice-call"
#define STR_USER_UNAVAILABLE					"user-unavailable"
#define STR_GROUP_UNAVAILABLE					"group-unavailable"
#define STR_TERMINATED_NO_PERMISSION			"terminated-no-permission"
#define STR_TERMINATED_NO_CREDIT				"terminated-no-credit"
#define STR_TERMINATED_BY_SERVER				"terminated-by-server"
#define STR_PEER_SWITCHED_CALL					"peer-switched-call"
#define STR_PEER_LOGGED_OUT						"peer-logged-out"

// Address book
#define STR_GET_CONTACT_LIST					"get-contact-list"
#define STR_GET_GROUP_LIST						"get-group-list"
#define STR_GET_GROUP_MEMBERS					"get-group-members"
#define STR_CONTACT_RECORD						"contact-record"
#define STR_GROUP_RECORD						"group-record"
#define STR_NAME								"name"
#define STR_CONTACT								"contact"
#define STR_CONTACT_LIST						"contact-list"
#define STR_CURRENT_CALL						"current-call"
#define STR_GROUP								"group"
#define STR_GROUP_NOTIFICATIONS					"group-notifications"
#define STR_ON									"on"
#define STR_OFF									"off"
#define STR_CONTACT_UPDATE						"contact-update"
#define STR_ADDED_TO							"added-to"
#define STR_REMOVED_FROM						"removed-from"
#define STR_IN_CALL								"in-call"

// -- Contact provisioning
#define STR_CONTACT_SEARCH						"contact-search"
#define STR_NAME								"name"
#define STR_ID									"id"

#define STR_CONTACT_SEARCH_RES					"result"
#define STR_CONTACT_ADD							"contact-add"		//Contact-add id <id> name <name> <is_nick?>
#define STR_CONTACT_DELETE						"contact-remove"	//Contact-remove id <id>

// PTT management & remote recording
#define STR_TALKER								"talker"
#define STR_YOU									"you"
#define STR_NONE								"none"
#define STR_PTT									"PTT"
#define STR_END									"END"
#define STR_ENABLED								"enabled"
#define STR_DISABLED							"disabled"
#define STR_UP									"up"
#define STR_DOWN								"down"
#define STR_REMOTE_RECORD						"remote-record"
#define STR_START								"start"
#define STR_STOP								"stop"
#define STR_SILENT								"silent"

// Audio files
#define STR_AUDIO_FILE							"audio-file"
#define STR_RECORD								"record"
#define STR_STOP_RECORD							"stop-record"
#define STR_TRANSMIT							"transmit"
#define STR_STOP_TRANSMIT						"stop-transmit"

// SOS
#define STR_SOS									"sos"
#define STR_SOS_HANDLER							"sos-handler"
#define STR_RECEIVED							"received"
#define STR_APPROVE								"approve"
#define STR_CLEAR								"clear"
#define STR_APPROVED							"approved"
#define STR_CLEARED								"cleared"
#define STR_SEND								"send"
#define STR_ACKED								"acked"

// IM
#define TEXT_CHAT					"text-chat"

// IM parameters - private or current call
#define IM_CREATE					"create"		//test-chat create contact:<id>
#define IM_LIST						"list"
#define IM_SEND						"send"
#define IM_REMOVE					"remove"

#define IM_MESSAGE_ADDED			"message added"
#define IM_INCOMING					"incoming"
#define IM_OUTGOING					"outgoing"

#define IM_DIALOG					"dialog" 
#define IM_ADDED					"added"
#define IM_REMOVED					"removed"

// Positioning
#define STR_POSITION			"position"
#define STR_UPDATE				"update"
#define CHR_POSITION_SEPARATOR	'='
#define STR_RETRIEVE			"retrieve"
#define STR_TRACK				"track"
#define STR_DURATION			"duration"
#define STR_STOP_TRACKING		"stop-tracking"

//Bluetooth
// Bluetooth Init - to initialize BT stack and report
// Bluetooth Terminate - to terminate BT report
// Bluetooth enable <device> - Vigilite or button
// Bluetooth enable ptt_button <device> - BT button
// Bluetooth enable audio - to activate audio through BT

#define STR_BT					"bluetooth"
#define STR_INIT				"init"
#define STR_ENABLE				"enable"
#define STR_DISABLE				"disable"
#define STR_VIGILITE			"vigilite"
#define STR_BT_BUTTON			"ptt_button"
#define STR_BT_AUDIO			"audio"

// Miscellaneous
#define STR_MD5_AUTH							"MD5-auth"
#define STR_MD5_RESPONSE						"MD5-response"

// General errors
#define STR_ERROR								"error"
#define STR_GENERAL								"general"
#define STR_BAD_DEFAULT_GROUP					"bad-default-group"
#define STR_CONTACT_OFFLINE						"contact-offline"
#define STR_BAD_PTT								"bad-PTT"
#define STR_CANNOT_ADD_CONTACT					"cannot-add-contact"
#define STR_CANNOT_EDIT_CONTACT					"cannot-edit-contact"
#define STR_CANNOT_REMOVE_CONTACT				"cannot-remove-contact"
#define STR_CONTACT_NOT_FOUND					"contact-not-found"
#define STR_CANNOT_ADD_OWN_ID					"cannot-add-own-ID"
#define STR_CONTACT_ALREADY_EXIST				"contact-already-exist"
#define STR_CANNOT_ADD_GROUP					"cannot-add-group"
#define STR_CANNOT_EDIT_GROUP					"cannot-edit-group"
#define STR_CANNOT_REMOVE_GROUP					"cannot-remove-group"
#define STR_GROUP_ALREADY_EXIST					"group-already-exist"
#define STR_INVALID_ID							"invalid-ID"
#define STR_NO_CREDIT							"no-credit"
#define STR_INVALID_CHARACTERS					"invalid-characters"
#define STR_NO_SESSION							"no-session"
#define STR_NO_PERMISSION						"no-permission"
#define STR_NOT_SUPPORTED						"not-supported"
#define STR_CONTACT_UNAVAILABLE					"contact-unavailable"
#define STR_CANNOT_SEND_TEXT_MESSAGE			"cannot-send-text-message"
#define STR_NOT_SUPPORTED_BY_RECIPIENTS			"not-supported-by-recipients"
#define STR_LOGGED_OUT_LOGGED_IN_ELSEWHERE		"logged-out-logged-in-elsewhere"
#define STR_LOGGED_OUT_SUSPENDED_OR_DELETED		"logged-out-suspended-or-deleted"
#define STR_LOGGED_OUT_NO_CREDIT				"logged-out-no-credit"
#define STR_CANNOT_BIND_SOCKET					"cannot-bind-socket"