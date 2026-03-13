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
<#include "../procedures.java.ftl">

package ${package}.block.entity;

<@javacompress>
public class ${name}TileEntity extends net.minecraft.tileentity.TileEntity
		<#if data.inventorySize?has_content>implements net.minecraft.inventory.IInventory</#if> {

	<#if data.inventorySize?has_content>
	private net.minecraft.util.NonNullList<net.minecraft.item.ItemStack> stacks = net.minecraft.util.NonNullList.withSize(${data.inventorySize}, net.minecraft.item.ItemStack.EMPTY);
	</#if>

	<#if data.hasEnergyStorage>
	private net.minecraftforge.energy.EnergyStorage energyStorage = new net.minecraftforge.energy.EnergyStorage(${data.energyStorageCapacity}, ${data.energyStorageMaxReceive}, ${data.energyStorageMaxExtract});
	</#if>

	<#if data.isFluidTank>
	private net.minecraftforge.fluids.capability.TileFluidTank fluidTank = new net.minecraftforge.fluids.capability.TileFluidTank(new net.minecraftforge.fluids.FluidStack(net.minecraft.util.ResourceLocation.tryCreate("${data.fluidTankContent?keep_after_last(":")?keep_before(")")?replace("fluid.", "${modid}:")}, ${data.fluidTankCapacity}), ${data.fluidTankCapacity});
	</#if>

	public ${name}TileEntity() {
		super();
	}

	@Override public String getName() {
		return "${modid}:${registryname}";
	}

	@Override public boolean hasCustomName() {
		return false;
	}

	<#if data.inventorySize?has_content>
	@Override public int getSizeInventory() {
		return stacks.size();
	}

	@Override public boolean isEmpty() {
		for (net.minecraft.item.ItemStack itemstack : this.stacks) {
			if (!itemstack.isEmpty()) {
				return false;
			}
		}
		return true;
	}

	@Override public net.minecraft.item.ItemStack getStackInSlot(int index) {
		return this.stacks.get(index);
	}

	@Override public net.minecraft.item.ItemStack decrStackSize(int index, int count) {
		return net.minecraft.util.math.MathHelper.clamp(net.minecraft.util.math.MathHelper.getInt(this.countStack, 0), 0, count);
	}

	@Override public net.minecraft.item.ItemStack removeStackFromSlot(int index) {
		net.minecraft.item.ItemStack itemstack = this.stacks.get(index);
		this.stacks.set(index, net.minecraft.item.ItemStack.EMPTY);
		return itemstack;
	}

	@Override public void setInventorySlotContents(int index, net.minecraft.item.ItemStack stack) {
		this.stacks.set(index, stack);
		if (stack.getCount() > this.getInventoryStackLimit()) {
			stack.setCount(this.getInventoryStackLimit());
		}
	}

	@Override public int getInventoryStackLimit() {
		return 64;
	}

	@Override public boolean isUsableByPlayer(net.minecraft.entity.player.EntityPlayer player) {
		return this.world.getTileEntity(this.pos) == this;
	}

	@Override public void openInventory(net.minecraft.entity.player.EntityPlayer player) {
	}

	@Override public void closeInventory(net.minecraft.entity.player.EntityPlayer player) {
	}

	@Override public net.minecraft.util.NonNullList<net.minecraft.item.ItemStack> getInventory() {
		return this.stacks;
	}

	@Override public void clear() {
		this.stacks.clear();
	}
	</#if>

	@Override public void readFromNBT(net.minecraft.nbt.NBTTagCompound compound) {
		super.readFromNBT(compound);
		<#if data.inventorySize?has_content>
		net.minecraft.inventory.InventoryHelper.loadAllItems(compound, this.stacks);
		</#if>
		<#if data.hasEnergyStorage>
		this.energyStorage.receiveEnergy(compound.getInteger("energy"), false);
		</#if>
	}

	@Override public net.minecraft.nbt.NBTTagCompound writeToNBT(net.minecraft.nbt.NBTTagCompound compound) {
		super.writeToNBT(compound);
		<#if data.inventorySize?has_content>
		net.minecraft.inventory.InventoryHelper.saveAllItems(compound, this.stacks);
		</#if>
		<#if data.hasEnergyStorage>
		compound.setInteger("energy", this.energyStorage.getEnergyStored());
		</#if>
		return compound;
	}
}
<#-- @formatter:on -->