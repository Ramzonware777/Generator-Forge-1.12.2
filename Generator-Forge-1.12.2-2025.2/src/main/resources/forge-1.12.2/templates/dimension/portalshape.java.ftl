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

package ${package}.world.teleporter;

import net.minecraft.block.Block;
import net.minecraft.block.BlockPortal;
import net.minecraft.block.state.IBlockState;
import net.minecraft.init.Blocks;
import net.minecraft.util.EnumFacing;
import net.minecraft.util.ResourceLocation;
import net.minecraft.util.math.BlockPos;
import net.minecraft.world.World;

import net.minecraftforge.fml.common.registry.ForgeRegistries;

public class ${name}PortalShape {

	private static final Block BASE_BLOCK_1 = Blocks.OBSIDIAN;
	private static final Block BASE_BLOCK_2 = Blocks.PORTAL;

	private final World world;
	private final EnumFacing.Axis axis;
	private final BlockPos bottomLeft;
	private final int width;
	private final int height;

	private ${name}PortalShape(World worldIn, BlockPos pos, EnumFacing.Axis axisIn) {
		this.world = worldIn;
		this.axis = axisIn;
		this.bottomLeft = this.calculateBottomLeft(pos);
		this.width = this.calculateWidth();
		this.height = this.calculateHeight();
	}

	private BlockPos calculateBottomLeft(BlockPos pos) {
		int i = 0;
		BlockPos blockpos = pos;
		while (i < 21) {
			BlockPos blockpos1 = blockpos.offset(EnumFacing.NORTH);
			if (!this.isValidBlockBlockpos(blockpos1)) {
				break;
			}
			blockpos = blockpos1;
			++i;
		}
		int j = this.getDistanceUntilFace(blockpos, EnumFacing.SOUTH) - 1;
		if (j >= 0) {
			blockpos = blockpos.offset(EnumFacing.SOUTH, j);
		}
		return blockpos;
	}

	private int getDistanceUntilFace(BlockPos pos, EnumFacing direction) {
		int i = 0;
		while (i < 22) {
			BlockPos blockpos = pos.offset(direction, i);
			if (!this.isValidBlockBlockpos(blockpos) || !this.isValidFrameBlockpos(blockpos.down())) {
				break;
			}
			++i;
		}
		return i;
	}

	private int calculateWidth() {
		int i = this.getDistanceUntilFace(this.bottomLeft, EnumFacing.EAST);
		return i;
	}

	private int calculateHeight() {
		int i = 0;
		while (i < 21) {
			BlockPos blockpos = this.bottomLeft.offset(EnumFacing.UP, i);
			if (!this.isValidBlockBlockpos(blockpos)) {
				break;
			}
			BlockPos blockpos1 = this.bottomLeft.offset(EnumFacing.EAST, this.width - 1).offset(EnumFacing.UP, i);
			if (!this.isValidBlockBlockpos(blockpos1)) {
				break;
			}
			++i;
		}
		return i;
	}

	private boolean isValidBlockBlockpos(BlockPos pos) {
		IBlockState iblockstate = this.world.getBlockState(pos);
		Block block = iblockstate.getBlock();
		return block.isAir(iblockstate, this.world, pos) || block == Blocks.FIRE || block instanceof BlockPortal;
	}

	private boolean isValidFrameBlockpos(BlockPos pos) {
		IBlockState iblockstate = this.world.getBlockState(pos);
		return iblockstate.getBlock() == Blocks.OBSIDIAN;
	}

	public static ${name}PortalShape findEmptyPortalShape(World world, BlockPos pos, EnumFacing.Axis axis) {
		${name}PortalShape shape = new ${name}PortalShape(world, pos, axis);
		if (shape.isValid() && shape.width >= 2 && shape.width <= 21 && shape.height >= 2 && shape.height <= 21) {
			return shape;
		}
		return null;
	}

	public boolean isValid() {
		return this.width >= 2 && this.width <= 21 && this.height >= 2 && this.height <= 21;
	}

	public void createPortalBlocks(World world) {
		Block portalBlock = ForgeRegistries.BLOCKS.getValue(new ResourceLocation("${modid}", "${registryname}_portal"));
		if (!(portalBlock instanceof BlockPortal)) {
			return;
		}
		IBlockState portalState = portalBlock.getDefaultState().withProperty(BlockPortal.AXIS, this.axis);

		for (int i = 0; i < this.width; ++i) {
			BlockPos blockpos = this.bottomLeft.offset(this.axis == EnumFacing.Axis.X ? EnumFacing.EAST : EnumFacing.UP, i);
			for (int j = 0; j < this.height; ++j) {
				BlockPos blockpos1 = blockpos.offset(EnumFacing.UP, j);
				world.setBlockState(blockpos1, portalState);
			}
		}
	}
}
