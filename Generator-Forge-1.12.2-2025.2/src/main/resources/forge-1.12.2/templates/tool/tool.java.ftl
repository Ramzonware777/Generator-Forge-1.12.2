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

import net.minecraftforge.common.util.EnumHelper;
import net.minecraft.item.Item;
import net.minecraft.item.ItemStack;
import net.minecraft.item.Item.ToolMaterial;

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

	public static final ToolMaterial TOOL_MATERIAL = EnumHelper.addToolMaterial("${registryname}".toUpperCase(),
		${data.harvestLevel!0}, ${data.usageCount}, ${data.efficiency}f, ${data.damage}f, ${data.enchantability});

	public ${name}Item() {
		<#if data.toolType == "Pickaxe" || data.toolType == "Axe" || data.toolType == "Sword" || data.toolType == "Spade" || data.toolType == "Hoe">
		super(TOOL_MATERIAL);
		<#elseif data.toolType == "Shield">
		super();
		<#else>
		super();
		</#if>
		setUnlocalizedName("${registryname}");
		setRegistryName("${registryname}");
		<#if data.creativeTab?has_content && data.creativeTab != "NONE">
		setCreativeTab(${data.creativeTab});
		</#if>
		<#if data.toolType != "Shield" && data.toolType != "">
		maxStackSize = 1;
		</#if>
	}

	<#if data.repairItems?has_content && data.repairItems?size gt 0>
	@Override public boolean getIsRepairable(ItemStack toRepair, ItemStack repair) {
		<#list data.repairItems as repairItem>
		if (repair.getItem() == <@mcitem repairItem/>.getItem()) return true;
		</#list>
		return super.getIsRepairable(toRepair, repair);
	}
	</#if>
}
<#-- @formatter:on -->