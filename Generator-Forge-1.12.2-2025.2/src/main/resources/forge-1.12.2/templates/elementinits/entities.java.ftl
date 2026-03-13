<#--
 # MCreator note: This file will be REGENERATED on each build.
 -->
package ${package}.init;

import net.minecraft.entity.Entity;
import net.minecraft.entity.EntityList;
import net.minecraft.util.ResourceLocation;
import net.minecraftforge.fml.common.registry.EntityEntry;
import net.minecraftforge.fml.common.registry.EntityRegistry;

public class ${JavaModName}Entities {

	public static void init() {
		<#list entities![] as entity>
		EntityRegistry.registerModEntity(
			new ResourceLocation("${modid}", "${entity.getModElement().getRegistryName()}"),
			${entity.getModElement().getName()}Entity.class,
			"${entity.getModElement().getRegistryName()}",
			${entity?index},
			${JavaModName}.instance,
			${entity.trackingRange!80},
			3,
			true<#if entity.hasSpawnEgg>,
			${entity.spawnEggBaseColor.getRGB()}, ${entity.spawnEggDotColor.getRGB()}</#if>
		);
		</#list>
	}
}
