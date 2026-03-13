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
<#include "mcitems.ftl">
<#include "procedures.java.ftl">
<#include "triggers.java.ftl">

package ${package}.item;

<@javacompress>
public class ${name}Item extends 
	<#if data.toolType == "Pickaxe">net.minecraft.item.ItemPickaxe
	<#elseif data.toolType == "Axe">net.minecraft.item.ItemAxe
	<#elseif data.toolType == "Sword">net.minecraft.item.ItemSword
	<#elseif data.toolType == "Spade">net.minecraft.item.ItemSpade
	<#elseif data.toolType == "Hoe">net.minecraft.item.ItemHoe
	<#elseif data.toolType == "Shield">net.minecraft.item.ItemShield
	<#else>net.minecraft.item.Item
	</#if> {

	public ${name}Item() {
		super(new net.minecraft.item.Item.Properties()
			<#if data.toolType == "Pickaxe" || data.toolType == "Axe" || data.toolType == "Sword" || data.toolType == "Spade" || data.toolType == "Hoe">
			.maxStackSize(1)
			.maxDamage(${data.usageCount})
			</#if>
		);
		this.setRegistryName("${modid}", "${registryname}");
	}
}
<#-- @formatter:on -->