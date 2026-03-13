<#if generator.map(field$gamerulesnumber, "gamerules") != "null">
${input$world}.getGameRules().setValue(${generator.map(field$gamerulesnumber, "gamerules")}, String.valueOf(${opt.toInt(input$gameruleValue)}));
</#if>
