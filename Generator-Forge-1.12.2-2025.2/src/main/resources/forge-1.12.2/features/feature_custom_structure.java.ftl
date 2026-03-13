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

package ${package}.world.gen.feature;

import net.minecraft.util.math.BlockPos;
import net.minecraft.world.World;
import net.minecraft.world.gen.feature.WorldGenerator;

import java.util.Random;

public class ${name}WorldGenerator extends WorldGenerator {

    private final String structureName;
    private final boolean randomRotation;
    private final boolean randomMirror;

    public ${name}WorldGenerator(String structureName, boolean randomRotation, boolean randomMirror) {
        this.structureName = structureName;
        this.randomRotation = randomRotation;
        this.randomMirror = randomMirror;
    }

    @Override
    public boolean generate(World world, Random rand, BlockPos position) {
        if (world.isRemote) {
            return false;
        }

        net.minecraft.world.gen.structure.template.Template template = world.getSaveHandler().getTemplateManager()
            .getResource(new net.minecraft.util.ResourceLocation("${modid}", this.structureName));

        if (template == null) {
            return false;
        }

        net.minecraft.world.gen.structure.template.PlacementSettings placementSettings = new net.minecraft.world.gen.structure.template.PlacementSettings();

        if (this.randomRotation) {
            placementSettings.setRotation(net.minecraft.util.Rotation.values()[rand.nextInt(4)]);
        }

        if (this.randomMirror) {
            placementSettings.setMirror(rand.nextBoolean() ? net.minecraft.util.Mirror.values()[rand.nextInt(2)] : net.minecraft.util.Mirror.NONE);
        }

        BlockPos size = template.getSize();
        BlockPos pos = position.add(-size.getX() / 2, 0, -size.getZ() / 2);

        template.generateWorld(world, pos, placementSettings);

        return true;
    }
}
<#-- @formatter:on -->