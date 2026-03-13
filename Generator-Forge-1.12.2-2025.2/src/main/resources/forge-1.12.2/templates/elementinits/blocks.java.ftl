<#--
 # MCreator note: This file will be REGENERATED on each build.
 -->
package ${package}.init;

import net.minecraft.block.Block;
import net.minecraftforge.fml.common.registry.ForgeRegistries;

public class ${JavaModName}Blocks {

	<#list blocks![] as block>
	<#if block.getModElement().getTypeString() == "dimension">
	public static Block ${block.getModElement().getRegistryNameUpper()}_PORTAL;
	<#else>
	public static Block ${block.getModElement().getRegistryNameUpper()};
	</#if>
	</#list>

	public static void init() {
		<#list blocks![] as block>
		<#if block.getModElement().getTypeString() == "dimension">
		${block.getModElement().getRegistryNameUpper()}_PORTAL = new ${package}.block.${block.getModElement().getName()}PortalBlock();
		${block.getModElement().getRegistryNameUpper()}_PORTAL.setRegistryName("${modid}", "${block.getModElement().getRegistryName()}_portal");
		ForgeRegistries.BLOCKS.register(${block.getModElement().getRegistryNameUpper()}_PORTAL);
		<#else>
		${block.getModElement().getRegistryNameUpper()} = new ${package}.block.${block.getModElement().getName()}Block();
		${block.getModElement().getRegistryNameUpper()}.setRegistryName("${modid}", "${block.getModElement().getRegistryName()}");
		ForgeRegistries.BLOCKS.register(${block.getModElement().getRegistryNameUpper()});
		</#if>
		</#list>
	}
}
