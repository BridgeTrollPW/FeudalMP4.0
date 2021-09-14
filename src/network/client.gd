extends Node

const SETTING_PATH = 'feudalmp/network/server/'

var networkInstance:ENetMultiplayerPeer;
var port;

func connect(address:String, port:int) -> void:
    if(!isInputValid(address, port)):
        return;

    Logger.info("Starting Client on %s:%s" % [address, port]);
    readConfiguration();
    networkInstance = ENetMultiplayerPeer.new();
    networkInstance.create_client(address, port);
    get_tree().network_peer = networkInstance;

    networkInstance.connection_succeeded.connect(eventConnectionSucceeded);
    networkInstance.connection_failed.connect(eventConnectionFailed);

func readConfiguration() -> void:
    port = ProjectSettings.get_setting(SETTING_PATH + 'port');

func isInputValid(address,port) -> bool:
    return ((address != null && !address.empty()) && (port != null && port > 9));

func eventConnectionSucceeded(peer:int) -> void:
    Logger.info('Connection success');
    var auth = get_node("../authentication") as Authentication;
    auth.tryAuthenticateClient('test', 'test');
    pass

func eventConnectionFailed() -> void:
    Logger.info('Connection failed');
    pass
