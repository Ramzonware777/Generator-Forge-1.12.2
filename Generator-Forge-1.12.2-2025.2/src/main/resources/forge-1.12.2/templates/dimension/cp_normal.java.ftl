	public static class ChunkProviderModded extends net.minecraft.world.gen.ChunkGeneratorOverworld {
		public ChunkProviderModded(net.minecraft.world.World world) {
			super(world, world.getSeed(), true, world.getWorldInfo().getGeneratorOptions());
		}
	}

