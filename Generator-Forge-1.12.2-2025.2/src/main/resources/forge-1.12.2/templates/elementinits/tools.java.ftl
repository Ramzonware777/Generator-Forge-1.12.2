<#--
 # MCreator note: This file will be REGENERATED on each build.
 -->
package ${package}.init;

import net.minecraft.item.Item;
import net.minecraftforge.fml.common.registry.ForgeRegistries;

public class ${JavaModName}Tools {

	<#list tools![] as tool>
	public static Item ${tool.getModElement().getRegistryNameUpper()};
	</#list>

	public static void init() {
		<#list tools![] as tool>
		${tool.getModElement().getRegistryNameUpper()} = new ${package}.item.${tool.getModElement().getName()}Item();
		${tool.getModElement().getRegistryNameUpper()}.setRegistryName("${modid}", "${tool.getModElement().getRegistryName()}");
		ForgeRegistries.ITEMS.register(${tool.getModElement().getRegistryNameUpper()});
		</#list>
	}
}
