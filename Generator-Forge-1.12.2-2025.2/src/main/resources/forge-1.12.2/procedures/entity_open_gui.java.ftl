<#-- @formatter:off -->
if(${input$entity} instanceof EntityPlayerMP)
	((EntityPlayerMP) ${input$entity}).openGui(${JavaModName}.instance, ${JavaModName}Screens.${field$guiname?upper_case}_ID, world, (int) x, (int) y, (int) z);
<#-- @formatter:on -->