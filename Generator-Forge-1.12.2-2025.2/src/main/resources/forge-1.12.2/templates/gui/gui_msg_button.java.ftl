<#--
 # MCreator (https://mcreator.net/)
 # Copyright (C) 2012-2020, Pylo
 # Copyright (C) 2020-2025, Pylo, opensource contributors
 #
 # This program is free software: you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
 # the Free Software Foundation, either version 3 of the License, or
 # (at your option) any later version.
 #
 # This program is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
 # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 # GNU General Public License for more details.
 #
 # You should have received a copy of the GNU General Public License
 # along with this program.  If not, see <https://www.gnu.org/licenses/>.
 #
 # Additional permission for code generator templates (*.ftl files)
 #
 # As a special exception, you may create a larger work that contains part or
 # all of the MCreator code generator templates (*.ftl files) and distribute
 # that work under terms of your choice, so long as that work isn't itself a
 # template for code generation. Alternatively, if you modify or redistribute
 # the template itself, you may (at your option) remove this special exception,
 # which will cause the template and the resulting code generator output files
 # to be licensed under the GNU General Public License without this special
 # exception.
-->

<#-- @formatter:off -->
<#include "../procedures.java.ftl">
package ${package}.network;

public class ${name}ButtonMessage implements IMessage {

	private int buttonID, x, y, z;

	public ${name}ButtonMessage() {}

	public ${name}ButtonMessage(int buttonID, int x, int y, int z) {
		this.buttonID = buttonID;
		this.x = x;
		this.y = y;
		this.z = z;
	}

	@Override public void fromBytes(ByteBuf buffer) {
		this.buttonID = buffer.readInt();
		this.x = buffer.readInt();
		this.y = buffer.readInt();
		this.z = buffer.readInt();
	}

	@Override public void toBytes(ByteBuf buffer) {
		buffer.writeInt(this.buttonID);
		buffer.writeInt(this.x);
		buffer.writeInt(this.y);
		buffer.writeInt(this.z);
	}

	public static void handleButtonAction(EntityPlayer entity, int buttonID, int x, int y, int z) {
		World world = entity.world;

		// security measure to prevent arbitrary chunk generation
		if (!world.isBlockLoaded(new BlockPos(x, y, z)))
			return;

		<#assign btid = 0>
		<#list data.getComponentsOfType("Button") as component>
				<#if hasProcedure(component.onClick)>
					if (buttonID == ${btid}) {
						<@procedureOBJToCode component.onClick/>
					}
				</#if>
				<#assign btid +=1>
		</#list>
		<#list data.getComponentsOfType("ImageButton") as component>
				<#if hasProcedure(component.onClick)>
					if (buttonID == ${btid}) {
						<@procedureOBJToCode component.onClick/>
					}
				</#if>
				<#assign btid +=1>
		</#list>
	}

    public static class ${name}ButtonMessageHandler implements IMessageHandler<${name}ButtonMessage, IMessage> {
        @Override public IMessage onMessage(${name}ButtonMessage message, MessageContext context) {
            if(context.side == Side.SERVER)
                context.getServerHandler().player.getServerWorld().addScheduledTask(() -> handleButtonAction(context.getServerHandler().player, message.buttonID, message.x, message.y, message.z));

            return null;
        }
    }

	public static void registerMessage() {
		${JavaModName}.addNetworkMessage(${name}ButtonMessageHandler.class, ${name}ButtonMessage.class, Side.SERVER);
	}
}
<#-- @formatter:on -->