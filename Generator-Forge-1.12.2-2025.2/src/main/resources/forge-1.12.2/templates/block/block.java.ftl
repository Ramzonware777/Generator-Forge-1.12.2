<#--
 # MCreator (https://mcreator.net/)
 # Copyright (C) 2012-2020, Pylo
 # Copyright (C) 2020-2023, Pylo, opensource contributors
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
<#include "../utils/mcitems.ftl">
<#include "../utils/procedures.java.ftl">
<#include "../utils/triggers.java.ftl">

package ${package}.block;

<@javacompress>
public class ${name}Block extends
	<#if data.hasGravity>
		net.minecraft.block.BlockFalling
	<#elseif data.blockBase?has_content>
		${data.blockBase?replace("Stairs", "Stair")?replace("Pane", "IronBars")?replace("Leaves", "Leaves")}Block
	<#else>
		net.minecraft.block.Block
	</#if>
 {

	<#if data.rotationMode == 1 || data.rotationMode == 3>
		public static final net.minecraft.util.EnumProperty<net.minecraft.util.EnumFacing> FACING = net.minecraft.block.properties.PropertyHorizontal.FACING;
	<#elseif data.rotationMode == 2 || data.rotationMode == 4>
		public static final net.minecraft.util.EnumProperty<net.minecraft.util.EnumFacing> FACING = net.minecraft.block.properties.PropertyDirectional.FACING;
	<#elseif data.rotationMode == 5>
		public static final net.minecraft.util.EnumProperty<net.minecraft.util.EnumFacing.Axis> AXIS = net.minecraft.block.properties.PropertyAxis.AXIS;
	</#if>

	<#if data.isWaterloggable>
		public static final net.minecraft.block.properties.PropertyBool WATERLOGGED = net.minecraft.block.properties.PropertyBool.create("waterlogged");
	</#if>

	public ${name}Block() {
		super(net.minecraft.block.material.Material.<#if data.material?has_content>${data.material}<#else>ROCK</#if>);
		this.setRegistryName("${modid}", "${registryname}");
	<#if data.sound?has_content>
		this.blockSoundType = net.minecraft.block.SoundType.${data.sound};
	</#if>
	<#if data.slipperiness?has_content>
		this.slipperiness = ${data.slipperiness};
	</#if>
	<#if data.speedFactor?has_content>
		this.speedFactor = ${data.speedFactor};
	</#if>
	<#if data.jumpFactor?has_content>
		this.jumpFactor = ${data.jumpFactor};
	</#if>
	<#if data.blastResistance?has_content>
		this.blockResistance = ${data.blastResistance};
	</#if>
	<#if data.hardness?has_content>
		this.blockHardness = ${data.hardness};
	</#if>
	<#if data.harvestLevel?has_content>
		this.setHarvestLevel(${data.harvestTool}.toLowerCase(), ${data.harvestLevel});
	</#if>
	<#if data.lightOpacity?has_content>
		this.lightOpacity = ${data.lightOpacity};
	</#if>
	<#if data.lightLevel?has_content>
		this.setLightLevel(${data.lightLevel});
	</#if>
	<#if data.isNotColidable>
		this.setBlockUnbreakable();
		this.setResistance(1000000);
	</#if>
	}

	<#if data.rotationMode == 1 || data.rotationMode == 3>
	@Override public net.minecraft.util.EnumProperty<net.minecraft.util.EnumFacing> getFacing(net.minecraft.block.state.IBlockState state) {
		return FACING;
	}

	@Override public net.minecraft.block.state.IBlockState withRotation(net.minecraft.block.state.IBlockState state, net.minecraft.util.Rotation rotation) {
		return state.withProperty(FACING, rotation.rotate(state.getValue(FACING)));
	}

	@Override public net.minecraft.block.state.IBlockState withMirror(net.minecraft.block.state.IBlockState state, net.minecraft.util.Mirror mirror) {
		return state.withProperty(FACING, mirror.mirror(state.getValue(FACING)));
	}
	</#if>

	<#if data.rotationMode == 5>
	@Override public net.minecraft.block.state.IBlockState withRotation(net.minecraft.block.state.IBlockState state, net.minecraft.util.Rotation rotation) {
		return state.withProperty(AXIS, rotation.rotate(state.getValue(AXIS)));
	}
	</#if>

	<#if data.isWaterloggable>
	@Override public net.minecraft.block.state.IBlockState getStateFromMeta(int meta) {
		return this.getDefaultState().withProperty(WATERLOGGED, (meta & 8) != 0).withProperty(FACING, net.minecraft.util.EnumFacing.byIndex(meta & 7));
	}

	@Override public int getMetaFromState(net.minecraft.block.state.IBlockState state) {
		return (state.getValue(WATERLOGGED) ? 8 : 0) | state.getValue(FACING).getIndex();
	}
	</#if>

	<#if data.hasInventory>
	@Override public boolean hasTileEntity(net.minecraft.block.state.IBlockState state) {
		return true;
	}

	@Override public net.minecraft.tileentity.TileEntity createTileEntity(net.minecraft.world.World world, net.minecraft.block.state.IBlockState state) {
		return new ${name}TileEntity();
	}
	</#if>

	<#if data.isBonemealable>
	@Override public boolean canGrow(net.minecraft.world.World world, net.minecraft.util.math.BlockPos pos, net.minecraft.block.state.IBlockState state, boolean isClient) {
		return true;
	}

	@Override public void grow(net.minecraft.world.World world, net.minecraft.util.math.BlockPos pos, net.minecraft.block.state.IBlockState state) {
	}
	</#if>

	<#if data.tintType?has_content && data.tintType == "Grass" || data.tintType == "Foliage" || data.tintType == "Water">
	@SideOnly(Side.CLIENT)
	@Override public int colorMultiplier(net.minecraft.block.state.IBlockState state, net.minecraft.util.math.BlockPos pos) {
		net.minecraft.world.IBlockAccess world = this.getWorld();
		if (world == null) return 16777215;
		
		<#if data.tintType == "Grass">
		return net.minecraft.world.biome.Biome.getBiome(world.getBiome(pos).getBiomeID()).getFoliageColorAtPos(pos);
		<#elseif data.tintType == "Foliage">
		return net.minecraft.world.biome.Biome.getBiome(world.getBiome(pos).getBiomeID()).getFoliageColorAtPos(pos);
		<#elseif data.tintType == "Water">
		return net.minecraft.world.biome.Biome.getBiome(world.getBiome(pos).getBiomeID()).getWaterColor();
		</#if>
	}
	</#if>

	<#if data.hasCustomCollisionBox>
	<#if data.customBoundingBox>
	@Override public AxisAlignedBB getBoundingBox(net.minecraft.block.state.IBlockState state, net.minecraft.world.IBlockAccess world, net.minecraft.util.math.BlockPos pos) {
		return getCustomBoundingBox(state, world, pos);
	}
	</#if>
	</#if>

	<#if data.dropCount?has_content || data.dropItems?has_content>
	@Override public java.util.List<net.minecraft.item.ItemStack> getDrops(net.minecraft.world.IBlockAccess world, net.minecraft.util.math.BlockPos pos, net.minecraft.block.state.IBlockState state, int fortune) {
		java.util.List<net.minecraft.item.ItemStack> drops = super.getDrops(world, pos, state, fortune);
		<#if data.dropItems?has_content>
		<#list data.dropItems as item>
		drops.add(new net.minecraft.item.ItemStack(${mappedBlockToItem(data.dropItems)}, ${item.count}));
		</#list>
		</#if>
		return drops;
	}
	</#if>

	<#if data.reactOnPiston>
	@Override public boolean isStickyBlock(net.minecraft.block.state.IBlockState state) {
		return true;
	}
	</#if>
}
<#-- @formatter:on -->
