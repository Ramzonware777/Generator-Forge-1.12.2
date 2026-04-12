<#-- @formatter:off -->
<#include "../utils/mcitems.ftl">
<#include "../utils/procedures.java.ftl">
<#include "../utils/triggers.java.ftl">

package ${package}.block;

import net.minecraft.block.Block;
import net.minecraft.block.material.Material;
import net.minecraft.block.state.IBlockState;
import net.minecraft.util.math.BlockPos;
import net.minecraft.world.World;
import net.minecraft.entity.player.EntityPlayer;
import net.minecraft.util.EnumFacing;
import net.minecraft.util.EnumHand;

public class ${name}Block extends <#if data.hasGravity>net.minecraft.block.BlockFalling<#elseif data.blockBase?has_content && data.blockBase == "Stairs">net.minecraft.block.BlockStairs<#elseif data.blockBase?has_content && data.blockBase == "Leaves">net.minecraft.block.BlockLeaves<#elseif data.blockBase?has_content && data.blockBase == "Pane">net.minecraft.block.BlockPane<#elseif data.blockBase?has_content && data.blockBase == "Fence">net.minecraft.block.BlockFence<#elseif data.blockBase?has_content && data.blockBase == "FenceGate">net.minecraft.block.BlockFenceGate<#elseif data.blockBase?has_content && data.blockBase == "Wall">net.minecraft.block.BlockWall<#elseif data.blockBase?has_content && data.blockBase == "Slab">net.minecraft.block.BlockSlab<#else>Block</#if> {

	<#if data.rotationMode == 1 || data.rotationMode == 3>
	public static final net.minecraft.block.properties.PropertyHorizontal FACING = net.minecraft.block.properties.PropertyHorizontal.create("facing");
	<#elseif data.rotationMode == 2 || data.rotationMode == 4>
	public static final net.minecraft.block.properties.PropertyDirection FACING = net.minecraft.block.properties.PropertyDirection.create("facing");
	</#if>

	public ${name}Block() {
		super(Material.<#if data.material?has_content>${data.material}<#else>ROCK</#if>);
		this.setUnlocalizedName("${modid}.${registryname}");
		this.setRegistryName("${modid}", "${registryname}");
		<#if data.hardness?has_content>
		this.setHardness(${data.hardness}f);
		</#if>
		<#if data.resistance?has_content>
		this.setResistance(${data.resistance}f);
		<#elseif data.blastResistance?has_content>
		this.setResistance(${data.blastResistance}f);
		</#if>
		<#if data.luminance?has_content && data.luminance?number gt 0>
		this.setLightLevel(${data.luminance?number / 15.0}f);
		<#elseif data.lightLevel?has_content && data.lightLevel?number gt 0>
		this.setLightLevel(${data.lightLevel?number / 15.0}f);
		</#if>
		<#if data.harvestLevel?has_content && data.harvestLevel?number gte 0>
		this.setHarvestLevel("${data.harvestTool!'pickaxe'}", ${data.harvestLevel});
		</#if>
		<#if data.sound?has_content && data.sound != "NONE">
		this.setSoundType(net.minecraft.block.SoundType.${data.sound});
		</#if>
		<#if data.creativeTab?has_content && data.creativeTab != "NONE">
		this.setCreativeTab(${data.creativeTab});
		</#if>
		<#if data.isNotColidable?? && data.isNotColidable>
		this.setBlockUnbreakable();
		this.setResistance(6000000.0f);
		</#if>
	}

	<#if data.hasInventory?? && data.hasInventory>
	@Override
	public boolean hasTileEntity(IBlockState state) {
		return true;
	}

	@Override
	public net.minecraft.tileentity.TileEntity createTileEntity(World world, IBlockState state) {
		return new ${name}TileEntity();
	}
	</#if>

	<#if hasProcedure(data.onBlockAdded)>
	@Override
	public void onBlockAdded(World world, BlockPos pos, IBlockState state) {
		super.onBlockAdded(world, pos, state);
		int x = pos.getX(); int y = pos.getY(); int z = pos.getZ();
		<@procedureCode data.onBlockAdded, {"x": "x", "y": "y", "z": "z", "world": "world"}/>
	}
	</#if>

	<#if hasProcedure(data.onBlockPlacedBy)>
	@Override
	public void onBlockPlacedBy(World world, BlockPos pos, IBlockState state, net.minecraft.entity.EntityLivingBase placer, net.minecraft.item.ItemStack stack) {
		super.onBlockPlacedBy(world, pos, state, placer, stack);
		int x = pos.getX(); int y = pos.getY(); int z = pos.getZ();
		<@procedureCode data.onBlockPlacedBy, {"x": "x", "y": "y", "z": "z", "world": "world", "entity": "placer", "itemstack": "stack"}/>
	}
	</#if>

	<#if hasProcedure(data.onRightClicked)>
	@Override
	public boolean onBlockActivated(World world, BlockPos pos, IBlockState state, EntityPlayer player, EnumHand hand, EnumFacing facing, float hitX, float hitY, float hitZ) {
		int x = pos.getX(); int y = pos.getY(); int z = pos.getZ();
		<@procedureCode data.onRightClicked, {"x": "x", "y": "y", "z": "z", "world": "world", "entity": "player", "itemstack": "player.getHeldItem(hand)"}/>
		return true;
	}
	</#if>

	<#if hasProcedure(data.onBlockDestroyedByPlayer)>
	@Override
	public void onBlockDestroyedByPlayer(World world, BlockPos pos, IBlockState state) {
		super.onBlockDestroyedByPlayer(world, pos, state);
		int x = pos.getX(); int y = pos.getY(); int z = pos.getZ();
		<@procedureCode data.onBlockDestroyedByPlayer, {"x": "x", "y": "y", "z": "z", "world": "world"}/>
	}
	</#if>

	<#if hasProcedure(data.onEntityWalksOn)>
	@Override
	public void onEntityWalk(World world, BlockPos pos, net.minecraft.entity.Entity entity) {
		super.onEntityWalk(world, pos, entity);
		int x = pos.getX(); int y = pos.getY(); int z = pos.getZ();
		<@procedureCode data.onEntityWalksOn, {"x": "x", "y": "y", "z": "z", "world": "world", "entity": "entity"}/>
	}
	</#if>

	<#if hasProcedure(data.onTickUpdate)>
	@Override
	public void randomTick(World world, BlockPos pos, IBlockState state, java.util.Random random) {
		super.randomTick(world, pos, state, random);
		int x = pos.getX(); int y = pos.getY(); int z = pos.getZ();
		<@procedureCode data.onTickUpdate, {"x": "x", "y": "y", "z": "z", "world": "world"}/>
	}
	</#if>
}
<#-- @formatter:on -->
