public static net.minecraft.world.GameType getEntityGameType(Entity entity) {
	if (entity instanceof EntityPlayerMP) {
		return ((EntityPlayerMP) entity).interactionManager.getGameType();
	}
	return net.minecraft.world.GameType.NOT_SET;
}
