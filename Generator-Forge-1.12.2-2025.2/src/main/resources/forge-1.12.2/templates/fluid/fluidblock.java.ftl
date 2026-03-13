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
<#include "../procedures.java.ftl"
<#include "../triggers.java.ftl">

package ${package}.block;

<@javacompress>
public class ${name}Block extends net.minecraft.block.BlockLiquid {

	public ${name}Block() {
		super(net.minecraft.block.material.Material.<#if data.type == "WATER">WATER<#else>LAVA</#if>);
		this.setRegistryName("${modid}", "${registryname}");
		this.blockHardness = ${data.resistance!100}f;
		this.blockResistance = ${data.resistance!100}f;
	}
}
<#-- @formatter:on -->