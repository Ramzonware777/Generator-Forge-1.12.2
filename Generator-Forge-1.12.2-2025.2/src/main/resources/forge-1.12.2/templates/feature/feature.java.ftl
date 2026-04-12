<#--
 # MCreator (https://mcreator.net/)
 # Copyright (C) 2012-2020, Pylo
 # Copyright (C) 2020-2022, Pylo, opensource contributors
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
<#include "../utils/procedures.java.ftl">

package ${package}.world.features;

<@javacompress>
public class ${name}Feature extends net.minecraft.world.gen.feature.WorldGenerator {

	public ${name}Feature() {
		super();
	}

	@Override
	public boolean generate(net.minecraft.world.World world, java.util.Random rand, net.minecraft.util.math.BlockPos position) {
		<#if hasProcedure(data.generateCondition)>
		int x = position.getX();
		int y = position.getY();
		int z = position.getZ();
		if (!<@procedureOBJToConditionCode data.generateCondition/>)
			return false;
		</#if>
		return true;
	}
}
<#-- @formatter:on -->