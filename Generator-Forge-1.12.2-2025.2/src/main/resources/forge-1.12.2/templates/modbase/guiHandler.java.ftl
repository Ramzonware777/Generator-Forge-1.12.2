<#-- @formatter:off -->
package ${package};

import net.minecraftforge.fml.common.network.IGuiHandler;
import net.minecraft.entity.player.EntityPlayer;
import net.minecraft.world.World;
import javax.annotation.Nullable;

public class ${JavaModName}Elements {

	// ... existing code ...

	public static class GuiHandler implements IGuiHandler {
		@Override
		@Nullable
		public Object getServerGuiElement(int id, EntityPlayer player, World world, int x, int y, int z) {
			return null;
		}

		@Override
		@Nullable
		public Object getClientGuiElement(int id, EntityPlayer player, World world, int x, int y, int z) {
			return null;
		}
	}
}
<#-- @formatter:on -->