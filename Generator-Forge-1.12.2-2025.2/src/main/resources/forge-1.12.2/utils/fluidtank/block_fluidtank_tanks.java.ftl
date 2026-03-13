public static int getBlockTanks(World world, BlockPos pos, EnumFacing direction) {
	TileEntity tileEntity = world.getTileEntity(pos);
	if (tileEntity != null) {
		IFluidHandler fluidHandler = tileEntity.getCapability(CapabilityFluidHandler.FLUID_HANDLER_CAPABILITY, direction);
		if (fluidHandler != null)
			return fluidHandler.getTanks();
	}
	return 0;
}
