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
<#include "../utils/procedures.java.ftl">
package ${package}.network;

public class MenuStateUpdateMessage implements IMessage {
    private int elementType;
    private String name;
    private Object elementState;

    public MenuStateUpdateMessage() {}

    public MenuStateUpdateMessage(int elementType, String name, Object elementState) {
        this.elementType = elementType;
        this.name = name;
        this.elementState = elementState;
    }

    @Override public void fromBytes(ByteBuf buffer) {
		this.elementType = buffer.readInt();
		this.name = ByteBufUtils.readUTF8String(buffer);
		Object elementState = null;
		if (elementType == 0) {
			elementState = ByteBufUtils.readUTF8String(buffer);
		} else if (elementType == 1) {
			elementState = buffer.readBoolean();
		}
        this.elementState = elementState;
	}

    @Override public void toBytes(ByteBuf buffer) {
		buffer.writeInt(this.elementType);
		ByteBufUtils.writeUTF8String(buffer, this.name);
		if (this.elementType == 0) {
			ByteBufUtils.writeUTF8String(buffer, (String) this.elementState);
		} else if (this.elementType == 1) {
			buffer.writeBoolean((boolean) this.elementState);
		}
	}

    public static class MenuStateUpdateMessageHandler implements IMessageHandler<MenuStateUpdateMessage, IMessage> {
        @Override public IMessage onMessage(MenuStateUpdateMessage message, MessageContext context) {
            <#-- Security measure to prevent accepting too big strings -->
            if (message.name.length() > 256 || message.elementState instanceof String && ((String) message.elementState).length() > 8192)
                return null;

			if (context.side == Side.SERVER)
				context.getServerHandler().player.getServerWorld().addScheduledTask(() -> onMessage(message, context.getServerHandler().player, true));
			else
				Minecraft.getMinecraft().addScheduledTask(() -> onMessage(message, Minecraft.getMinecraft().player, false));

            return null;
        }

        private static void onMessage(MenuStateUpdateMessage message, EntityPlayer player, boolean isServer) {
            if (player.openContainer instanceof ${JavaModName}Menus.MenuAccessor) {
                ((${JavaModName}Menus.MenuAccessor) player.openContainer).getMenuState().put(message.elementType + ":" + message.name, message.elementState);
                if (!isServer && Minecraft.getMinecraft().currentScreen instanceof ${JavaModName}Screens.ScreenAccessor) {
                    ((${JavaModName}Screens.ScreenAccessor) Minecraft.getMinecraft().currentScreen).updateMenuState(message.elementType, message.name, message.elementState);
                }
            }
        }
    }

    public static void registerMessage() {
		${JavaModName}.addNetworkMessage(MenuStateUpdateMessageHandler.class, MenuStateUpdateMessage.class, Side.CLIENT, Side.SERVER);
	}
}
<#-- @formatter:on -->