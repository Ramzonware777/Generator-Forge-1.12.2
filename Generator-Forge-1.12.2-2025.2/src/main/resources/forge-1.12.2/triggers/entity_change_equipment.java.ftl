<#include "procedures.java.ftl">
@Mod.EventBusSubscriber public class ${name}Procedure {
	@SubscribeEvent public static void onEntityEquipmentChange(LivingEquipmentChangeEvent event) {
		<#assign dependenciesCode><#compress>
		<@procedureDependenciesCode dependencies, {
			"x": "event.getEntityLiving().posX",
			"y": "event.getEntityLiving().posY",
			"z": "event.getEntityLiving().posZ",
			"world": "event.getEntityLiving().world",
			"entity": "event.getEntityLiving()",
			"equipmentslot": "event.getSlot().getSlotIndex()",
			"olditemstack": "event.getFrom()",
			"newitemstack": "event.getTo()",
			"event": "event"
			}/>
		</#compress></#assign>
		execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
	}
}
