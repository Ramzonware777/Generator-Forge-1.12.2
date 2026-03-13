{
	BlockPos _pos = new BlockPos((int)${input$x},(int)${input$y},(int)${input$z});
	IBlockState _bs = world.getBlockState(_pos);
	if (_bs.getBlock().getStateContainer().getProperty(${input$property}) instanceof PropertyBool _booleanProp)
		world.setBlockState(_pos, _bs.withProperty(_booleanProp, ${input$value}), 3);
}
