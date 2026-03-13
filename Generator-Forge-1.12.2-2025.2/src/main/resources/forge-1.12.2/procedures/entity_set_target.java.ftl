<#if input$sourceentity == "null">
if (${input$entity} instanceof EntityLiving _entity) _entity.setAttackTarget(null);
<#else>
if (${input$entity} instanceof EntityLiving _entity && ${input$sourceentity} instanceof EntityLivingBase _ent) _entity.setAttackTarget(_ent);
</#if>
