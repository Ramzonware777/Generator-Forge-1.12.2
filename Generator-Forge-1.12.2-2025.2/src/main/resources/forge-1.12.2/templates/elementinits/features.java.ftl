<#--
 # MCreator note: This file will be REGENERATED on each build.
 -->
package ${package}.init;

import net.minecraft.world.gen.feature.WorldGenerator;
import net.minecraft.util.ResourceLocation;
import net.minecraftforge.fml.common.registry.GameRegistry;

public class ${JavaModName}Features {

	public static void init() {
		<#list w.getGElementsOfType("feature") as feature>
		GameRegistry.registerWorldGenerator(new ${feature.getModElement().getName()}Feature(), 5);
		</#list>
	}
}