<#include "procedures.java.ftl">
@Mod.EventBusSubscriber public class ${name}Procedure {
	@SubscribeEvent public static void onPlayerXPLevelChange(PlayerXpEvent.LevelChange event) {
		if (event.getPlayer() != null) {
			<#assign dependenciesCode><#compress>
			<@procedureDependenciesCode dependencies, {
				"x": "event.getPlayer().posX",
				"y": "event.getPlayer().posY",
				"z": "event.getPlayer().posZ",
				"world": "event.getPlayer().world",
				"entity": "event.getPlayer()",
				"amount": "event.getLevels()",
				"event": "event"
				}/>
			</#compress></#assign>
			execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
		}
	}
}
