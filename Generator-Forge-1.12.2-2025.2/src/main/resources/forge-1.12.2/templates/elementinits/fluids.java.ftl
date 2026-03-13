<#--
 # MCreator note: This file will be REGENERATED on each build.
 -->
package ${package}.init;

import net.minecraft.block.Block;
import net.minecraft.item.Item;
import net.minecraft.util.ResourceLocation;
import net.minecraftforge.fml.common.registry.GameRegistry;

public class ${JavaModName}Fluids {

	<#list fluids![] as fluid>
	public static Block ${fluid.getModElement().getRegistryNameUpper()}_BLOCK;
	public static Item ${fluid.getModElement().getRegistryNameUpper()}_BUCKET;
	</#list>

	public static void init() {
		<#list fluids![] as fluid>
		${fluid.getModElement().getRegistryNameUpper()}_BLOCK = new ${fluid.getModElement().getName()}Block();
		${fluid.getModElement().getRegistryNameUpper()}_BLOCK.setRegistryName("${modid}", "${fluid.getModElement().getRegistryName()}");
		GameRegistry.register(${fluid.getModElement().getRegistryNameUpper()}_BLOCK);

		<#if fluid.generateBucket?? && fluid.generateBucket>
		${fluid.getModElement().getRegistryNameUpper()}_BUCKET = new ${fluid.getModElement().getName()}BucketItem();
		${fluid.getModElement().getRegistryNameUpper()}_BUCKET.setRegistryName("${modid}", "${fluid.getModElement().getRegistryName()}_bucket");
		GameRegistry.register(${fluid.getModElement().getRegistryNameUpper()}_BUCKET);
		</#if>
		</#list>
	}
}
