public static int extractEnergySimulate(World world, BlockPos pos, int amount, EnumFacing direction) {
	TileEntity tileEntity = world.getTileEntity(pos);
	if (tileEntity != null) {
		IEnergyStorage energyStorage = tileEntity.getCapability(CapabilityEnergy.ENERGY, direction);
		if (energyStorage != null)
			return energyStorage.extractEnergy(amount, true);
	}
	return 0;
}
