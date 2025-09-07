<#include "procedures.java.ftl">
@Mod.EventBusSubscriber({Side.CLIENT}) public class ${name}Procedure {
	@SubscribeEvent public static void onRightClick(PlayerInteractEvent.RightClickEmpty event) {
		<#assign dependenciesCode><#compress>
			<@procedureDependenciesCode dependencies, {
				"x": "event.getPos().getX()",
				"y": "event.getPos().getY()",
				"z": "event.getPos().getZ()",
				"world": "event.getWorld()",
				"entity": "event.getEntityPlayer()"
			}/>
		</#compress></#assign>
		<#-- fix #5491, event is fired for both hands always, so we can filter by either -->
		if (event.getHand() != EnumHand.MAIN_HAND) return;
		${JavaModName}.PACKET_HANDLER.sendToServer(new ${name}Message());
		execute(${dependenciesCode});
	}

	public static class ${name}Message implements IMessage {
		public ${name}Message() {}

		@Override public void toBytes(ByteBuf buffer) {}

		@Override public void fromBytes(ByteBuf buffer) {}
    }

	public static class ${name}MessageHandler implements IMessageHandler<${name}Message, IMessage> {
		@Override public IMessage onMessage(${name}Message message, MessageContext context) {
            if(context.side == Side.CLIENT) {
                Minecraft.getMinecraft().addScheduledTask(() -> {
				if (!Minecraft.getMinecraft().player.world.isBlockLoaded(Minecraft.getMinecraft().player.getPosition()))
					return;
				<#assign dependenciesCode><#compress>
					<@procedureDependenciesCode dependencies, {
						"x": "Minecraft.getMinecraft().player.posX",
						"y": "Minecraft.getMinecraft().player.posY",
						"z": "Minecraft.getMinecraft().player.posZ",
						"world": "Minecraft.getMinecraft().player.world",
						"entity": "Minecraft.getMinecraft().player"
					}/>
				</#compress></#assign>
				execute(${dependenciesCode});
			});
		    } else {
                context.getServerHandler().player.getServerWorld().addScheduledTask(() -> {
				if (!context.getServerHandler().player.world.isBlockLoaded(context.getServerHandler().player.getPosition()))
					return;
				<#assign dependenciesCode><#compress>
					<@procedureDependenciesCode dependencies, {
						"x": "context.getServerHandler().player.posX",
						"y": "context.getServerHandler().player.posY",
						"z": "context.getServerHandler().player.posZ",
						"world": "context.getServerHandler().player.world",
						"entity": "context.getServerHandler().player"
					}/>
				</#compress></#assign>
				execute(${dependenciesCode});
			});
		    }

		    return null;
		}
	}

	public static void registerMessage() {
		${JavaModName}.addNetworkMessage(${name}MessageHandler.class, ${name}Message.class, Side.CLIENT, Side.SERVER);
	}