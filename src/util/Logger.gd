extends Node

enum LOG_LEVEL {
    DEBUG,
    INFO,
    WARN,
    ERROR
    }

func debug(msg:String) -> void:
    write(LOG_LEVEL.DEBUG, msg);

func info(msg:String) -> void:
    write(LOG_LEVEL.INFO, msg);

func warn(msg:String) -> void:
    write(LOG_LEVEL.WARN, msg);

func error(msg:String) -> void:
    write(LOG_LEVEL.ERROR, msg);

func write(logLevel:LOG_LEVEL, msg: String) -> void:
    printDelegate('[%s] [%s] [%s] - %s' % [getDateTimeFormatted(), getNetworkAuthorityFormatted(), logLevel, msg]);

func getDateTimeFormatted() -> String:
    var dateTimeDict = Time.get_datetime_dict_from_system();
    return (
        '%d.%d.%d - %d:%d:%d'
        % [
            dateTimeDict['day'],
            dateTimeDict['month'],
            dateTimeDict['year'],
            dateTimeDict['hour'],
            dateTimeDict['minute'],
            dateTimeDict['second']
        ]
    )

func printDelegate(output:String) -> void:
    print(output);

func getNetworkAuthorityFormatted() -> String:
    if(!get_tree().get_multiplayer().has_multiplayer_peer()):
        return "None";
    return "Server" if get_tree().is_network_server() else "Client";
