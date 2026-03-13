	public static class BiomeProviderCustom extends net.minecraft.world.biome.BiomeProviderSingle {
		public BiomeProviderCustom(long seed) {
			super(
				<#if data.worldGenType == "Nether like gen">
					net.minecraft.init.Biomes.HELL
				<#elseif data.worldGenType == "End like gen">
					net.minecraft.init.Biomes.SKY
				<#else>
					net.minecraft.init.Biomes.PLAINS
				</#if>
			);
		}
	}

