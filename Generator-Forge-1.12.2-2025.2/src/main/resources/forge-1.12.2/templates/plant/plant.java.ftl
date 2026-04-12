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
<#include "../utils/boundingboxes.java.ftl">
<#include "../utils/procedures.java.ftl">
<#include "../utils/triggers.java.ftl">
<#include "../utils/mcitems.ftl">

package ${package}.block;

<@javacompress>
public class ${name}Block extends 
	<#if data.plantType == "sapling">net.minecraft.block.BlockSapling
	<#elseif data.plantType == "grass">net.minecraft.block.BlockTallGrass
	<#elseif data.plantType == "flower">net.minecraft.block.BlockFlower
	<#else>net.minecraft.block.Block
	</#if> {

	public ${name}Block() {
		super(net.minecraft.block.material.Material.PLANTS);
		this.setRegistryName("${modid}", "${registryname}");
		<#if data.sound?has_content>
		this.blockSoundType = net.minecraft.block.SoundType.${data.sound};
		</#if>
		this.blockHardness = ${data.hardness!1.0}f;
		this.blockResistance = ${data.resistance!1.0}f;
	}

	<#if data.plantType == "sapling">
	@Override
	public void generateTree(net.minecraft.world.World world, net.minecraft.util.math.BlockPos pos, net.minecraft.block.state.IBlockState state, java.util.Random rand) {
	}
	</#if>
}
<#-- @formatter:on -->
