<#-- @formatter:off -->
<#include "../utils/mcitems.ftl">
<#include "../utils/procedures.java.ftl">
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

	public static int DIMID = 2;
	public static DimensionType DTYPE;

	public static void registerDimension() {
		if (DimensionManager.isDimensionRegistered(DIMID)) {
			DIMID = DimensionManager.getNextFreeDimId();
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
		@Override public void calculateInitialWeather() {}
		@Override public void updateWeather() {}
		@Override public boolean canDoLightning(net.minecraft.world.chunk.Chunk chunk) { return false; }
		@Override public boolean canDoRainSnowIce(net.minecraft.world.chunk.Chunk chunk) { return false; }
		</#if>

		@Override
		public DimensionType getDimensionType() {
			return DTYPE;
		}

		@Override
		public Vec3d getFogColor(float celestialAngle, float partialTicks) {
			float f = MathHelper.clamp(MathHelper.cos(celestialAngle * ((float) Math.PI * 2F)) * 2F + 0.5F, 0.0F, 1.0F);
			float r = 0.7529412F * (f * 0.94F + 0.06F);
			float g = 0.84705883F * (f * 0.94F + 0.06F);
			float b = 1.0F * (f * 0.91F + 0.09F);
			return new Vec3d(r, g, b);
		}

		@Override
		public IChunkGenerator createChunkGenerator() {
			return new ChunkProviderModded(this.world);
		}

		@Override public boolean isSurfaceWorld() { return ${data.imitateOverworldBehaviour!true}; }
		@Override public boolean canRespawnHere() { return ${data.canRespawnHere!false}; }
		@Override public boolean doesXZShowFog(int x, int z) { return ${data.hasFog!false}; }

		@Override
		public boolean isSleepingIgnored(EntityPlayer player) {
			return <#if !(data.bedWorks!true)>true<#else>false</#if>;
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
		<#include "cp_normal.java.ftl">
	<#elseif data.worldGenType == "Nether like gen">
		<#include "cp_nether.java.ftl">
	<#elseif data.worldGenType == "End like gen">
		<#include "cp_end.java.ftl">
	</#if>

	<#include "biomegen.java.ftl">
}
<#-- @formatter:on -->
