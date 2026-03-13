/*@int*/(${input$entity} instanceof EntityLivingBase && ((EntityLivingBase)${input$entity}).isPotionActive(${generator.map(field$potion, "potions")}) ?
	((EntityLivingBase)${input$entity}).getActivePotionEffect(${generator.map(field$potion, "potions")}).getDuration() : 0)
