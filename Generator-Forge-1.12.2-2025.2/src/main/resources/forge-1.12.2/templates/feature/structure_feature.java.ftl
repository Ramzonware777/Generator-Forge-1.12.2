<#--
 # MCreator (https://mcreator.net/)
 # Copyright (C) 2012-2020, Pylo
 # Copyright (C) 2020-2024, Pylo, opensource contributors
 #
 # This program is free software: you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
 # the Free Software Foundation, either version 3 of the License, or
 # (at your option) any later version.
 #
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
 # along with this program.  If not, see <https://www.gnu.org/licenses/>.
-->

<#-- @formatter:off -->
package ${package}.world.features;

public class ${name}StructureFeature extends net.minecraft.world.gen.feature.WorldGenerator {

	public ${name}StructureFeature() {
		super();
	}

	@Override
	public boolean generate(net.minecraft.world.World world, java.util.Random rand, net.minecraft.util.math.BlockPos position) {
		net.minecraft.world.gen.structure.template.Template template = world.getSaveHandler().getTemplateManager().getResource(new net.minecraft.util.ResourceLocation("${modid}", "structures/${data.structure}"));
		if (template == null) {
			return false;
		}
		
		net.minecraft.world.gen.structure.template.PlacementSettings placementSettings = new net.minecraft.world.gen.structure.template.PlacementSettings();
		
		<#if data.randomRotation>
		int rot = rand.nextInt(4);
		placementSettings.setRotation(net.minecraft.util.Rotation.values()[rot]);
		</#if>
		
		<#if data.randomMirror>
		if (rand.nextBoolean()) {
			placementSettings.setMirror(net.minecraft.util.Mirror.values()[rand.nextInt(2)]);
		}
		</#if>
		
		template.generate(world, position, placementSettings);
		return true;
	}
}
<#-- @formatter:on -->