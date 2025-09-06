<#include "procedures.java.ftl">
	double x = arguments.getPosition().getX();
	double y = arguments.getPosition().getY();
	double z = arguments.getPosition().getZ();

	Entity entity = arguments.getCommandSenderEntity();
	if (entity == null && world instanceof WorldServer)
		entity = FakePlayerFactory.get((WorldServer) world, FakePlayerFactory.MINECRAFT);

    EnumFacing direction = EnumFacing.DOWN;
    if (entity != null)
    	direction = entity.getHorizontalFacing();

	World world = entity.world;

    <@procedureToCode name=procedure dependencies=dependencies/>
