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
/*
 *	MCreator note: This file will be REGENERATED on each build.
 */
package ${package}.init;

public class ${JavaModName}Screens {

	<#list guis as gui>
	public static final int ${gui.getModElement().getRegistryNameUpper()}_ID = ${gui_index * 3};
	public static final int ${gui.getModElement().getRegistryNameUpper()}_ID_ITEM = ${gui_index * 3 + 1};
	public static final int ${gui.getModElement().getRegistryNameUpper()}_ID_ENTITY = ${gui_index * 3 + 2};
	</#list>

	public static void load(${JavaModName} mod) {
        NetworkRegistry.INSTANCE.registerGuiHandler(mod, new GuiHandler());
	}

	private static class GuiHandler implements IGuiHandler {
		@Override public Object getServerGuiElement(int id, EntityPlayer player, World world, int x, int y, int z) {
            <#list guis as gui>
				if (id == ${gui.getModElement().getRegistryNameUpper()}_ID)
					return new ${gui.getModElement().getName()}Menu.makeBlockGUI(player, x, y, z);
				else if (id == ${gui.getModElement().getRegistryNameUpper()}_ID_ITEM)
					return new ${gui.getModElement().getName()}Menu.makeItemGUI(player);
				else if (id == ${gui.getModElement().getRegistryNameUpper()}_ID_ENTITY)
					return new ${gui.getModElement().getName()}Menu.makeEntityGUI(player);
			    <#sep>else
			</#list>

			return null;
		}

		@Override public Object getClientGuiElement(int id, EntityPlayer player, World world, int x, int y, int z) {
            <#list guis as gui>
				if (id == ${gui.getModElement().getRegistryNameUpper()}_ID)
					return new ${gui.getModElement().getName()}Menu.makeBlockGUI(player, x, y, z);
				else if (id == ${gui.getModElement().getRegistryNameUpper()}_ID_ITEM)
					return new ${gui.getModElement().getName()}Menu.makeItemGUI(player);
				else if (id == ${gui.getModElement().getRegistryNameUpper()}_ID_ENTITY)
					return new ${gui.getModElement().getName()}Menu.makeEntityGUI(player);
			    <#sep>else
			</#list>

			return null;
		}
	}

	public interface ScreenAccessor {
		void updateMenuState(int elementType, String name, Object elementState);
	}
}
<#-- @formatter:on -->