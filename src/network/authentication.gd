extends Node
class_name Authentication

enum AUTH_STATE {
	SUCCESS,
	FAILURE
   };

func tryAuthenticateClient(username:String, password:String) -> void:
	rpc_id(1, 'serverAuthenticateUser', username, password);

@rpc
func serverAuthenticateUser(username:String, password:String) -> void:
	Logger.debug("Received auth data user=%s pw=*******" % username);
	rpc_id(get_tree().get_rpc_sender_id(), "clientReceiveAuthenticationState", AUTH_STATE.FAILURE);

@rpc
func clientReceiveAuthenticationState(authState:int) -> void:
	Logger.debug("Received AUTH_STATE %d" % authState);
