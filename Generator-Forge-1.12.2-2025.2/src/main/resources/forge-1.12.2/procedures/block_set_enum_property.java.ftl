{
	String _value = ${input$value};
	BlockPos _pos = new BlockPos((int)${input$x},(int)${input$y},(int)${input$z});
	IBlockState _bs = world.getBlockState(_pos);
	if (_bs.getBlock().getStateContainer().getProperty(${input$property}) instanceof PropertyEnum _enumProp && _enumProp.getAllowedValues().contains(_enumProp.getValue(_value).orElse(null)))
		world.setBlockState(_pos, _bs.withProperty(_enumProp, _enumProp.getValue(_value).orElse(null)), 3);
}
