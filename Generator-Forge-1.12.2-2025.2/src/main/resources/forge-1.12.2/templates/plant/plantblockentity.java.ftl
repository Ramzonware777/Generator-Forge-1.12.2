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
package ${package}.block.entity;

public class ${name}TileEntity extends net.minecraft.tileentity.TileEntity {

	public ${name}TileEntity() {
		super();
	}

	@Override
	public net.minecraft.util.math.BlockPos getPos() {
		return this.pos;
	}

	@Override
	public net.minecraft.nbt.NBTTagCompound getUpdateTag() {
		return this.writeToNBT(new net.minecraft.nbt.NBTTagCompound());
	}
}
<#-- @formatter:on -->