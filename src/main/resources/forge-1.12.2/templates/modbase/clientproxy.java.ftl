<#-- @formatter:off -->
package ${package}.network;

public class ${JavaModName}ClientProxy extends ${JavaModName}CommonProxy {

	@Override public void init(FMLInitializationEvent event) {
	}

	@Override public void preInit(FMLPreInitializationEvent event) {
		OBJLoader.INSTANCE.addDomain("${modid}");
	}

	@Override public void postInit(FMLPostInitializationEvent event) {
	}

	@Override public void serverLoad(FMLServerStartingEvent event) {
	}
}
<#-- @formatter:on -->