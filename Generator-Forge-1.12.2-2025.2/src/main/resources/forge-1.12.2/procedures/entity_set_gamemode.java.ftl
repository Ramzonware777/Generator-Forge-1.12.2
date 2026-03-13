if (${input$entity} instanceof EntityPlayerMP)
	((EntityPlayerMP)${input$entity}).setGameType(net.minecraft.world.GameType.${generator.map(field$gamemode, "gamemodes")});
