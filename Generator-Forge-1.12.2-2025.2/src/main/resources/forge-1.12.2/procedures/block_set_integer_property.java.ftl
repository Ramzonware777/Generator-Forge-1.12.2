{
	int _value = ${opt.toInt(input$value)};
	BlockPos _pos = new BlockPos((int)${input$x},(int)${input$y},(int)${input$z});
	IBlockState _bs = world.getBlockState(_pos);
	if (_bs.getBlock().getStateContainer().getProperty(${input$property}) instanceof PropertyInteger _integerProp && _integerProp.getAllowedValues().contains(_value))
		world.setBlockState(_pos, _bs.withProperty(_integerProp, _value), 3);
}
