extends Node

const SETTING_PATH = 'feudalmp/network/server/'

var networkInstance;
var port;
var maxPlayers;

func start() -> void:
    Logger.info("Starting Server");
    readConfiguration();
    networkInstance = ENetMultiplayerPeer.new();
    networkInstance.create_server(port, maxPlayers);
    get_tree().get_multiplayer().set_multiplayer_peer(networkInstance);

    networkInstance.peer_connected.connect(eventPeerConnected);
    networkInstance.peer_disconnected.connect(eventPeerDisconnected);

func readConfiguration() -> void:
    port = ProjectSettings.get_setting(SETTING_PATH + 'port');
    maxPlayers = ProjectSettings.get_setting(SETTING_PATH + 'max_players');
    Logger.debug('port=%s, max_players=%s' % [port, maxPlayers]);

func eventPeerConnected() -> void:
    pass

func eventPeerDisconnected() -> void:
    pass
