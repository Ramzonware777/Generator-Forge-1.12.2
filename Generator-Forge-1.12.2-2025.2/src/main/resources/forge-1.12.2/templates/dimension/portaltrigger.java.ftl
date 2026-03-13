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

<#-- @formatter:off -->
package ${package}.item;

import net.minecraft.block.Block;
import net.minecraft.block.BlockPortal;
import net.minecraft.entity.player.EntityPlayer;
import net.minecraft.item.Item;
import net.minecraft.item.ItemStack;
import net.minecraft.util.EnumActionResult;
import net.minecraft.util.EnumFacing;
import net.minecraft.util.EnumHand;
import net.minecraft.util.ResourceLocation;
import net.minecraft.util.math.BlockPos;
import net.minecraft.world.World;

import net.minecraftforge.fml.common.registry.ForgeRegistries;

public class ${name}Item extends Item {

	public ${name}Item() {
		super();
		this.setRegistryName("${modid}", "${registryname}");
		this.setUnlocalizedName("${registryname}");
	}

	@Override
	public EnumActionResult onItemUse(EntityPlayer player, World world, BlockPos pos, EnumHand hand, EnumFacing facing, float hitX, float hitY, float hitZ) {
		BlockPos targetPos = pos.offset(facing);
		ItemStack itemstack = player.getHeldItem(hand);

		if (!player.canPlayerEdit(targetPos, facing, itemstack)) {
			return EnumActionResult.FAIL;
		}

		Block portalBlock = ForgeRegistries.BLOCKS.getValue(new ResourceLocation("${modid}", "${registryname}_portal"));
		if (world.isAirBlock(targetPos) && portalBlock instanceof BlockPortal && ((BlockPortal) portalBlock).trySpawnPortal(world, targetPos)) {
			if (!player.capabilities.isCreativeMode) {
				itemstack.shrink(1);
			}
			return EnumActionResult.SUCCESS;
		}

		return EnumActionResult.FAIL;
	}
}
<#-- @formatter:on -->
