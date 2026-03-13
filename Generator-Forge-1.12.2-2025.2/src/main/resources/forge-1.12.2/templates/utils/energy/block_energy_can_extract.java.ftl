public static boolean canExtractEnergy(World world, BlockPos pos, EnumFacing direction) {
	TileEntity tileEntity = world.getTileEntity(pos);
	if (tileEntity != null) {
		IEnergyStorage energyStorage = tileEntity.getCapability(CapabilityEnergy.ENERGY, direction);
		if (energyStorage != null)
			return energyStorage.canExtract();
	}
	return false;
}
