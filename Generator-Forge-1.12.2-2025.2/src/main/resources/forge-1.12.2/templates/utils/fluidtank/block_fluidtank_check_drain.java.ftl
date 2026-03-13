public static int drainTankSimulate(World world, BlockPos pos, int amount, EnumFacing direction) {
	TileEntity tileEntity = world.getTileEntity(pos);
	if (tileEntity != null) {
		IFluidHandler fluidHandler = tileEntity.getCapability(CapabilityFluidHandler.FLUID_HANDLER_CAPABILITY, direction);
		if (fluidHandler != null)
			return fluidHandler.drain(amount, true).amount;
	}
	return 0;
}
