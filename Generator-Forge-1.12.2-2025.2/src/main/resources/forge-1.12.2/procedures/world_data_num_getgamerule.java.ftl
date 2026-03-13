/*@int*/<#if generator.map(field$gamerulesnumber, "gamerules") != "null">
(${input$world}.getGameRules().getInt(${generator.map(field$gamerulesnumber, "gamerules")}))
<#else>0</#if>
