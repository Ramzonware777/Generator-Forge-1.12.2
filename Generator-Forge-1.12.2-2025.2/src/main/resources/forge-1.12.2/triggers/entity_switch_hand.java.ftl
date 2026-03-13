<#include "procedures.java.ftl">
@Mod.EventBusSubscriber public class ${name}Procedure {
	@SubscribeEvent public static void onEntityItemChanged(LivingEquipmentChangeEvent event) {
		if (event.getSlot().getSlotIndex() == 0 || event.getSlot().getSlotIndex() == 1) {
			<#assign dependenciesCode><#compress>
			<@procedureDependenciesCode dependencies, {
				"x": "event.getEntityLiving().posX",
				"y": "event.getEntityLiving().posY",
				"z": "event.getEntityLiving().posZ",
				"world": "event.getEntityLiving().world",
				"entity": "event.getEntityLiving()",
				"newmainhanditem": "event.getTo()",
				"event": "event"
				}/>
			</#compress></#assign>
			execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
		}
	}
}
