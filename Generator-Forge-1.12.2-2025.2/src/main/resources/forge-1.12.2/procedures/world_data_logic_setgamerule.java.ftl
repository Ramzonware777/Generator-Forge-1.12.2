<#if generator.map(field$gamerulesboolean, "gamerules") != "null">
${input$world}.getGameRules().setValue(${generator.map(field$gamerulesboolean, "gamerules")}, ${input$gameruleValue} ? "true" : "false");
</#if>
