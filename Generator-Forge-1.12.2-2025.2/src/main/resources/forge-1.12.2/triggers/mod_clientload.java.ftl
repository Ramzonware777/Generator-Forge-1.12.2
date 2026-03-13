<#include "procedures.java.ftl">
@Mod.EventBusSubscriber({Side.CLIENT}) public class ${name}Procedure {
	@SubscribeEvent public static void init(FMLInitializationEvent event) {
		execute();
	}