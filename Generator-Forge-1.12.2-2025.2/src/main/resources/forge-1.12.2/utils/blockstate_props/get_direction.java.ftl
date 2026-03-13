public static EnumFacing getDirectionFromBlockState(IBlockState blockState) {
	if (blockState.getBlock().getStateContainer().getProperty("facing") instanceof PropertyEnum && ((PropertyEnum)blockState.getBlock().getStateContainer().getProperty("facing")).getValueClass() == EnumFacing.class)
		return (EnumFacing) blockState.getValue((PropertyEnum) blockState.getBlock().getStateContainer().getProperty("facing"));
	if (blockState.getBlock().getStateContainer().getProperty("axis") instanceof PropertyEnum && ((PropertyEnum)blockState.getBlock().getStateContainer().getProperty("axis")).getValueClass() == EnumFacing.Axis.class)
		return EnumFacing.fromAxisAndDirection((EnumFacing.Axis) blockState.getValue((PropertyEnum) blockState.getBlock().getStateContainer().getProperty("axis")), EnumFacing.AxisDirection.POSITIVE);
	return EnumFacing.NORTH;
}
