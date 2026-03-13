<#--
 # MCreator note: This file will be REGENERATED on each build.
 -->
package ${package}.init;

import net.minecraft.block.Block;
import net.minecraft.util.ResourceLocation;
import net.minecraftforge.fml.common.registry.GameRegistry;

public class ${JavaModName}Plants {

	<#list plants![] as plant>
	public static Block ${plant.getModElement().getRegistryNameUpper()};
	</#list>

	public static void init() {
		<#list plants![] as plant>
		${plant.getModElement().getRegistryNameUpper()} = new ${plant.getModElement().getName()}Block();
		${plant.getModElement().getRegistryNameUpper()}.setRegistryName("${modid}", "${plant.getModElement().getRegistryName()}");
		GameRegistry.register(${plant.getModElement().getRegistryNameUpper()});
		</#list>
	}
}
