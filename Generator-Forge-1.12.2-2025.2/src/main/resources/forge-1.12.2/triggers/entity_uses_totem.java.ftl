<#include "procedures.java.ftl">
@Mod.EventBusSubscriber public class ${name}Procedure {
	@SubscribeEvent public static void onEntityDeath(LivingDeathEvent event) {
		if (event != null && event.getEntityLiving() != null) {
			EntityLivingBase entity = event.getEntityLiving();
			if (entity instanceof EntityPlayer && ((EntityPlayer)entity).getHeldItemMainhand() != null && 
				((EntityPlayer)entity).getHeldItemMainhand().getItem() == Items.TOTEM_OF_UNDYING) {
				<#assign dependenciesCode><#compress>
				<@procedureDependenciesCode dependencies, {
					"x": "entity.posX",
					"y": "entity.posY",
					"z": "entity.posZ",
					"world": "entity.world",
					"entity": "entity",
					"damagesource": "event.getSource()",
					"sourceentity": "event.getSource().getTrueSource()",
					"itemstack": "((EntityPlayer)entity).getHeldItemMainhand()",
					"event": "event"
					}/>
				</#compress></#assign>
				execute(event<#if dependenciesCode?has_content>,</#if>${dependenciesCode});
			}
		}
	}
}
