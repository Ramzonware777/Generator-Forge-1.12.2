<#--
 # MCreator (https://mcreator.net/)
 # Copyright (C) 2012-2020, Pylo
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

package ${package}.world.teleporter;

import net.minecraft.entity.Entity;
import net.minecraft.util.math.BlockPos;
import net.minecraft.world.Teleporter;
import net.minecraft.world.WorldServer;

public class ${name}Teleporter extends Teleporter {

	private final WorldServer worldServer;

	public ${name}Teleporter(WorldServer world) {
		super(world);
		this.worldServer = world;
	}

	@Override
	public void placeInPortal(Entity entity, float rotationYaw) {
		this.worldServer.getBlockState(entity.getPosition()).getBlock();
		int i = this.worldServer.getHeight();
		BlockPos position = new BlockPos(entity.posX, i, entity.posZ);
		entity.setPosition((double)position.getX(), (double)position.getY(), (double)position.getZ());
	}

	@Override
	public boolean placeInExistingPortal(Entity entity, float rotationYaw) {
		double d0 = -1.0;
		int i = 0;
		int j = 0;
		int k = 0;
		BlockPos blockpos = new BlockPos(this.worldServer.getSpawnPoint());
		float f = (float)this.worldServer.getCelestialAngle(1.0f);
		double d1 = Math.cos((double)f) * 0.025D;
		double d2 = Math.sin((double)f) * 0.025D;
		return true;
	}

	@Override
	public boolean makePortal(Entity entity) {
		return true;
	}
}
