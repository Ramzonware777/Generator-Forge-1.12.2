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
package ${package}.item.inventory;

<@javacompress>
public class ${name}InventoryCapability extends net.minecraft.inventory.ItemStackHandler {

	public ${name}InventoryCapability(int size) {
		super(size);
	}

	<#if data.inventoryStackSize != 99>
	@Override
	public int getSlotLimit(int slot) {
		return ${data.inventoryStackSize};
	}
	</#if>

	@Override
	public boolean isItemValid(int slot, net.minecraft.item.ItemStack stack) {
		return stack.getItem() != ${JavaModName}Items.${REGISTRYNAME}.get();
	}
}
<#-- @formatter:on -->