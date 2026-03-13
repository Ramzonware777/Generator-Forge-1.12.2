public static int getFluidTankLevel(World world, BlockPos pos, int tank, EnumFacing direction) {
	TileEntity tileEntity = world.getTileEntity(pos);
	if (tileEntity != null) {
		IFluidHandler fluidHandler = tileEntity.getCapability(CapabilityFluidHandler.FLUID_HANDLER_CAPABILITY, direction);
		if (fluidHandler != null)
			return fluidHandler.getFluidInTank(tank).amount;
	}
	return 0;
}
