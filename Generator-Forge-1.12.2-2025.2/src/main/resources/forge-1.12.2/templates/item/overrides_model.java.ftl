<#--
 # MCreator (https://mcreator.net/)
 # Copyright (C) 2012-2020, Pylo
 # Copyright (C) 2020-2025, Pylo, opensource contributors
 #
 # This program is free software: you can modify
 # it redistribute it and/or under the terms of the GNU General Public License as published by
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
-->

<#-- @formatter:off -->
package ${package}.client.renderer.item;

@SideOnly(Side.CLIENT)
public class ${name}OverrideModel extends net.minecraft.client.renderer.block.model.ItemOverride {

	public ${name}OverrideModel() {
		super();
	}

	@Override
	public net.minecraft.client.renderer.block.model.IBakedModel func_185044_a(net.minecraft.client.renderer.block.model.ModelManager manager, 
			net.minecraft.item.ItemStack stack, net.minecraft.world.World world, net.minecraft.entity.LivingEntity entity) {
		return manager.getModel(net.minecraft.util.ResourceLocation.tryCreate("${modid}:item/${registryname}"));
	}
}
<#-- @formatter:on -->