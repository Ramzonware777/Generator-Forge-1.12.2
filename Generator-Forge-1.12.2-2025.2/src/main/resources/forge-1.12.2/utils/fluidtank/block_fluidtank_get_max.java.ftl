public static int getFluidTankCapacity(World world, BlockPos pos, int tank, EnumFacing direction) {
	TileEntity tileEntity = world.getTileEntity(pos);
	if (tileEntity != null) {
		IFluidHandler fluidHandler = tileEntity.getCapability(CapabilityFluidHandler.FLUID_HANDLER_CAPABILITY, direction);
		if (fluidHandler != null)
			return fluidHandler.getTankCapacity(tank);
	}
	return 0;
}
