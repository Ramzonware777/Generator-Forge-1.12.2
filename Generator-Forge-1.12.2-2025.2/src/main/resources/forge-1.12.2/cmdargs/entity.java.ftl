.then(Commands.argument("${field$name}", EntityArgument.${field$type}())${statement$args})

|
getListOfStringsMatchingLastWord(args, <#if field$type == "entities" || field$type == "entity">EntityList.getEntityNameList<#else>server.getOnlinePlayerNames</#if>())
|