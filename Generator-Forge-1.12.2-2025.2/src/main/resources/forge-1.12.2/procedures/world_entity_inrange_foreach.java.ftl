{
	final double _centerX = ${input$x};
	final double _centerY = ${input$y};
	final double _centerZ = ${input$z};
	final double _range = ${input$range};

	java.util.List<net.minecraft.entity.Entity> _entfound = world.getEntitiesWithinAABB(net.minecraft.entity.Entity.class,
		new net.minecraft.util.math.AxisAlignedBB(_centerX - _range / 2d, _centerY - _range / 2d, _centerZ - _range / 2d, _centerX + _range / 2d, _centerY + _range / 2d, _centerZ + _range / 2d));
	_entfound.sort(java.util.Comparator.comparingDouble(_entcnd -> _entcnd.getDistanceSq(_centerX, _centerY, _centerZ)));
	for (net.minecraft.entity.Entity entityiterator : _entfound) {
		${statement$foreach}
	}
}
