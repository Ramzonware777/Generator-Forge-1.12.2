<#include "procedures.java.ftl">
@Mod.EventBusSubscriber({Side.DEDICATED_SERVER}) public class ${name}Procedure {
	@SubscribeEvent public static void init(FMLInitializationEvent event) {
		execute();
	}
