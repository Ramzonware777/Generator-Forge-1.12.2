<#--
 # MCreator (https://mcreator.net/)
 # Copyright (C) 2020 Pylo and contributors
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
 # 
 # Additional permission for code generator templates (*.ftl files)
 # 
 # As a special exception, you may create a larger work that contains part or 
 # all of the MCreator code generator templates (*.ftl files) and distribute 
 # that work under terms of your choice, so long as that work isn't itself a 
 # template for code generation. Alternatively, if you modify or redistribute 
 # the template itself, you may (at your option) remove this special exception, 
 # which will cause the template and the resulting code generator output files 
 # to be licensed under the GNU General Public License without this special 
 # exception.
-->

<#-- @formatter:off -->
<#include "../mcitems.ftl">
<#include "../procedures.java.ftl">
package ${package}.world.dimension;

import net.minecraftforge.common.DimensionManager;

import net.minecraft.entity.player.EntityPlayer;
import net.minecraft.entity.player.EntityPlayerMP;
import net.minecraft.util.math.BlockPos;
import net.minecraft.util.math.MathHelper;
import net.minecraft.util.math.Vec3d;
import net.minecraft.world.DimensionType;
import net.minecraft.world.WorldProvider;
import net.minecraft.world.gen.IChunkGenerator;

public class ${name}Dimension {

	// MCreator 2025.2 no expone un ID numerico estable para el mod element en FreeMarker.
	// Usamos 2 como candidato inicial y, si ya esta ocupado, hacemos fallback al siguiente ID libre.
	public static int DIMID = 2;
	public static DimensionType DTYPE;

	public static void registerDimension() {
		if (DimensionManager.isDimensionRegistered(DIMID)) {
			DIMID = DimensionManager.getNextFreeDimId();
			System.err.println("Dimension ID for dimension ${registryname} is already registered. Falling back to ID: " + DIMID);
		}

		DTYPE = DimensionType.register("${registryname}", "_${registryname}", DIMID, CustomDimension.class, true);
		DimensionManager.registerDimension(DIMID, DTYPE);
	}

	public static class CustomDimension extends WorldProvider {

		@Override
		protected void init() {
			this.biomeProvider = new BiomeProviderCustom(this.world.getSeed());
			this.nether = <#if data.worldGenType == "Nether like gen">true<#else>false</#if>;
			this.doesWaterVaporize = ${data.doesWaterVaporize!false};
			this.hasSkyLight = ${data.hasSkyLight!true};
		}

		<#if !(data.imitateOverworldBehaviour!true)>
		@Override
		public void calculateInitialWeather() {
		}

		@Override
		public void updateWeather() {
		}

		@Override
		public boolean canDoLightning(net.minecraft.world.chunk.Chunk chunk) {
			return false;
		}

		@Override
		public boolean canDoRainSnowIce(net.minecraft.world.chunk.Chunk chunk) {
			return false;
		}
		</#if>

		@Override
		public DimensionType getDimensionType() {
			return DTYPE;
		}

		@Override
		public Vec3d getFogColor(float celestialAngle, float partialTicks) {
			float f = MathHelper.clamp(MathHelper.cos(celestialAngle * ((float) Math.PI * 2F)) * 2F + 0.5F, 0.0F, 1.0F);
			float r = 0.7529412F;
			float g = 0.84705883F;
			float b = 1.0F;
			r = r * (f * 0.94F + 0.06F);
			g = g * (f * 0.94F + 0.06F);
			b = b * (f * 0.91F + 0.09F);
			return new Vec3d(r, g, b);
		}

		@Override
		public IChunkGenerator createChunkGenerator() {
			return new ChunkProviderModded(this.world);
		}

		@Override
		public boolean isSurfaceWorld() {
			return ${data.imitateOverworldBehaviour!true};
		}

		@Override
		public boolean canRespawnHere() {
			return ${data.canRespawnHere!false};
		}

		@Override
		public boolean doesXZShowFog(int x, int z) {
			return ${data.hasFog!false};
		}

		@Override
		public WorldSleepResult canSleepAt(EntityPlayer player, BlockPos pos) {
			return <#if data.bedWorks!true>WorldSleepResult.ALLOW<#else>WorldSleepResult.BED_EXPLODES</#if>;
		}

		<#if !(data.isDark!false)>
		@Override
		protected void generateLightBrightnessTable() {
			float f = 0.5f;
			for (int i = 0; i <= 15; ++i) {
				float f1 = 1 - (float) i / 15f;
				this.lightBrightnessTable[i] = (1 - f1) / (f1 * 3 + 1) * (1 - f) + f;
			}
		}
		</#if>

		<#if data.onPlayerEntersDimension?? && hasProcedure(data.onPlayerEntersDimension)>
		@Override
		public void onPlayerAdded(EntityPlayerMP entity) {
			double x = entity.posX;
			double y = entity.posY;
			double z = entity.posZ;
			<@procedureOBJToCode data.onPlayerEntersDimension/>
		}
		</#if>

		<#if data.onPlayerLeavesDimension?? && hasProcedure(data.onPlayerLeavesDimension)>
		@Override
		public void onPlayerRemoved(EntityPlayerMP entity) {
			double x = entity.posX;
			double y = entity.posY;
			double z = entity.posZ;
			<@procedureOBJToCode data.onPlayerLeavesDimension/>
		}
		</#if>
	}

	<#if data.worldGenType == "Normal world gen">
        	<#include "dimension/cp_normal.java.ftl">
    	<#elseif data.worldGenType == "Nether like gen">
        	<#include "dimension/cp_nether.java.ftl">
    	<#elseif data.worldGenType == "End like gen">
        	<#include "dimension/cp_end.java.ftl">
    	</#if>

	<#include "dimension/biomegen.java.ftl">
}
<#-- @formatter:on -->
