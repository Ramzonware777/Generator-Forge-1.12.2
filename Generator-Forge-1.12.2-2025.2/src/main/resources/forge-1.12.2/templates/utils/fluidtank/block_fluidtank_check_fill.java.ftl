public static int fillTankSimulate(World world, BlockPos pos, int amount, EnumFacing direction, Fluid fluid) {
	TileEntity tileEntity = world.getTileEntity(pos);
	if (tileEntity != null) {
		IFluidHandler fluidHandler = tileEntity.getCapability(CapabilityFluidHandler.FLUID_HANDLER_CAPABILITY, direction);
		if (fluidHandler != null)
			return fluidHandler.fill(new FluidStack(fluid, amount), true);
	}
	return 0;
}
