public static net.minecraft.entity.Entity findEntityInWorldRange(net.minecraft.world.World world, Class<? extends net.minecraft.entity.Entity> clazz, double x, double y, double z, double range) {
	return world.getEntitiesWithinAABB(clazz,
		new net.minecraft.util.math.AxisAlignedBB(x - range / 2d, y - range / 2d, z - range / 2d, x + range / 2d, y + range / 2d, z + range / 2d)).stream()
		.sorted(java.util.Comparator.comparingDouble(e -> e.getDistanceSq(x, y, z))).findFirst().orElse(null);
}
