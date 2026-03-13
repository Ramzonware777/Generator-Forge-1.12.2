<@addTemplate file="utils/entity/entity_checkgamemode.java.ftl"/>
(getEntityGameType(${input$entity}) == net.minecraft.world.GameType.${generator.map(field$gamemode, "gamemodes")})
