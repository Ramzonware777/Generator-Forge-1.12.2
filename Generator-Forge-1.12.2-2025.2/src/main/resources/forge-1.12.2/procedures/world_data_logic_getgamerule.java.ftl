<#if generator.map(field$gamerulesboolean, "gamerules") != "null">
(${input$world}.getGameRules().getBoolean(${generator.map(field$gamerulesboolean, "gamerules")}))
<#else>false</#if>
