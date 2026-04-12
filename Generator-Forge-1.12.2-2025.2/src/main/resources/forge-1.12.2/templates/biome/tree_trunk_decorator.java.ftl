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

<#include "../utils/mcitems.ftl">

package ${package}.world.features.treedecorators;

import net.minecraft.util.EnumFacing;
import net.minecraft.block.state.IBlockState;
import net.minecraft.util.math.BlockPos;
import net.minecraft.world.World;
import net.minecraft.world.gen.feature.WorldGenTrees;
import net.minecraft.world.gen.feature.WorldGenerator;

import java.util.Random;

public class ${name}TrunkDecorator extends WorldGenerator {

    private IBlockState vineBlock;

    public ${name}TrunkDecorator(IBlockState vineBlock) {
        this.vineBlock = vineBlock;
    }

    @Override
    public boolean generate(World world, Random rand, BlockPos position) {
        for(EnumFacing facing : EnumFacing.Plane.HORIZONTAL.facing) {
            if (rand.nextInt(3) > 0) {
                BlockPos offset = position.offset(facing);
                if (world.isAirBlock(offset)) {
                    world.setBlockState(offset, vineBlock);
                }
            }
        }
        return true;
    }
}
