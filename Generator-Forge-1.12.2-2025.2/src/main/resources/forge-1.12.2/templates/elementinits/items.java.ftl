<#--
 # MCreator note: This file will be REGENERATED on each build.
 -->
package ${package}.init;

import net.minecraft.item.Item;
import net.minecraftforge.fml.common.registry.ForgeRegistries;

public class ${JavaModName}Items {

	<#list items![] as item>
	<#if item.getModElement().getTypeString() != "dimension" || item.hasIgniter()>
	public static Item ${item.getModElement().getRegistryNameUpper()};
	</#if>
	</#list>

	<#list tools![] as tool>
	public static Item ${tool.getModElement().getRegistryNameUpper()};
	</#list>

	public static void init() {
		<#list items![] as item>
		<#if item.getModElement().getTypeString() != "dimension" || item.hasIgniter()>
		${item.getModElement().getRegistryNameUpper()} = new ${package}.item.${item.getModElement().getName()}Item();
		${item.getModElement().getRegistryNameUpper()}.setRegistryName("${modid}", "${item.getModElement().getRegistryName()}");
		ForgeRegistries.ITEMS.register(${item.getModElement().getRegistryNameUpper()});
		</#if>
		</#list>

		<#list tools![] as tool>
		${tool.getModElement().getRegistryNameUpper()} = new ${package}.item.${tool.getModElement().getName()}Item();
		${tool.getModElement().getRegistryNameUpper()}.setRegistryName("${modid}", "${tool.getModElement().getRegistryName()}");
		ForgeRegistries.ITEMS.register(${tool.getModElement().getRegistryNameUpper()});
		</#list>
	}
}
