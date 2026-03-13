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
<#include "../procedures.java.ftl">
<#include "../mcitems.ftl">
<#include "../triggers.java.ftl">

package ${package}.item;

<@javacompress>
public class ${name}Item extends net.minecraft.item.Item {

	public ${name}Item() {
		super(new net.minecraft.item.Item.Properties()
			<#if data.rarity != "COMMON">
			.setTab(${JavaModName}CreativeTabs.${data.creativeTab})
			</#if>
			<#if data.hasInventory()>
			.maxStackSize(1)
			<#elseif data.damageCount != 0>
			.maxDamage(${data.damageCount})
			<#else>
			.maxStackSize(${data.stackSize!64})
			</#if>
		);
		this.setRegistryName("${modid}", "${registryname}");
	}
}
<#-- @formatter:on -->
