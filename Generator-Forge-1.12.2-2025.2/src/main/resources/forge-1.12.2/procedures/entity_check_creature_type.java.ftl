<#if field$type == "UNDEAD">
(${input$entity} instanceof EntityLiving _liv${cbi} && _liv${cbi}.getCreatureAttribute() == EnumCreatureAttribute.UNDEAD)
<#elseif field$type == "ARTHROPOD">
(${input$entity} instanceof EntityLiving _liv${cbi} && _liv${cbi}.getCreatureAttribute() == EnumCreatureAttribute.ARTHROPOD)
<#elseif field$type == "ILLAGER">
(${input$entity} instanceof EntityVillager)
<#elseif field$type == "WATER">
(${input$entity} instanceof EntityWaterMob)
<#else>
false
</#if>
