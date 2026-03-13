<#--
 # MCreator (https://mcreator.net/)
 # Copyright (C) 2012-2020, Pylo
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

package ${package}.block;

import ${package}.world.teleporter.${name}PortalShape;

import net.minecraft.block.Block;
import net.minecraft.block.BlockPortal;
import net.minecraft.block.state.IBlockState;
import net.minecraft.util.EnumFacing;
import net.minecraft.util.ResourceLocation;
import net.minecraft.util.math.BlockPos;
import net.minecraft.world.World;

import net.minecraftforge.fml.common.registry.ForgeRegistries;

public class ${name}PortalBlock extends BlockPortal {

	public ${name}PortalBlock() {
		super();
		this.setRegistryName("${modid}", "${registryname}_portal");
		this.setDefaultState(this.blockState.getBaseState().withProperty(AXIS, EnumFacing.Axis.X));
	}

	@Override
	public void updateTick(World world, BlockPos pos, IBlockState state, java.util.Random rand) {
	}

	public static void portalSpawn(World world, BlockPos pos) {
		Block portalBlock = ForgeRegistries.BLOCKS.getValue(new ResourceLocation("${modid}", "${registryname}_portal"));
		if (portalBlock != null) {
			world.setBlockState(pos, portalBlock.getDefaultState().withProperty(AXIS, EnumFacing.Axis.X));
		}
	}

	@Override
	public boolean trySpawnPortal(World world, BlockPos pos) {
		${name}PortalShape shape = ${name}PortalShape.findEmptyPortalShape(world, pos, EnumFacing.Axis.X);
		if (shape == null) {
			return false;
		}
		shape.createPortalBlocks(world);
		return true;
	}
}
