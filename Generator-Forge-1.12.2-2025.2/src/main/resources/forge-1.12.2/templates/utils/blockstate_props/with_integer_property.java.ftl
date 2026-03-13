public static IBlockState blockStateWithInt(IBlockState blockState, String property, int newValue) {
	Property<?> prop = blockState.getBlock().getStateContainer().getProperty(property);
	return prop instanceof PropertyInteger ip && prop.getAllowedValues().contains(newValue) ? blockState.withProperty(ip, newValue) : blockState;
}
