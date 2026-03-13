public static IBlockState blockStateWithDirection(IBlockState blockState, EnumFacing newValue) {
	if (blockState.getBlock().getStateContainer().getProperty("facing") instanceof PropertyEnum && blockState.getBlock().getStateContainer().getProperty("facing").getAllowedValues().contains(newValue))
		return blockState.withProperty((PropertyEnum) blockState.getBlock().getStateContainer().getProperty("facing"), newValue);
	if (blockState.getBlock().getStateContainer().getProperty("axis") instanceof PropertyEnum && blockState.getBlock().getStateContainer().getProperty("axis").getAllowedValues().contains(newValue.getAxis()))
		return blockState.withProperty((PropertyEnum) blockState.getBlock().getStateContainer().getProperty("axis"), newValue.getAxis());
	return blockState;
}
