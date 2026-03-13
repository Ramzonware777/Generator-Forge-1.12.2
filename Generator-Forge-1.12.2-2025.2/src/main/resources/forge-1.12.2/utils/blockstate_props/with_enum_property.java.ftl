public static IBlockState blockStateWithEnum(IBlockState blockState, String property, String newValue) {
	Property<?> prop = blockState.getBlock().getStateContainer().getProperty(property);
	return prop instanceof PropertyEnum ep && ep.getAllowedValues().contains(ep.getValue(newValue).orElse(null)) ? blockState.withProperty(ep, ep.getValue(newValue).orElse(null)) : blockState;
}
