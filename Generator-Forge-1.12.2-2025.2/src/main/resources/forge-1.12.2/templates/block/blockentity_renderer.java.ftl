<#--
 # MCreator (https://mcreator.net/)
 # Copyright (C) 2012-2020, Pylo
 # Copyright (C) 2020-2023, Pylo, opensource contributors
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
-->

<#-- @formatter:off -->
<#include "../utils/procedures.java.ftl">

package ${package}.client.renderer.block;

@SideOnly(Side.CLIENT)
public class ${name}Renderer extends net.minecraft.client.renderer.tileentity.TileEntitySpecialRenderer<${name}TileEntity> {

	private net.minecraft.client.model.Model model;

	public ${name}Renderer() {
		this.model = new net.minecraft.client.model.Model();
	}

	@Override
	public void render(${name}TileEntity tileEntity, double x, double y, double z, float partialTicks, int destroyStage, float alpha) {
		net.minecraft.client.renderer.GlStateManager.pushMatrix();
		net.minecraft.client.renderer.GlStateManager.translate(x, y, z);
		net.minecraft.client.renderer.GlStateManager.disableLighting();

		net.minecraft.util.ResourceLocation texture = new net.minecraft.util.ResourceLocation("${modid}", "textures/block/${data.texture}.png");
		net.minecraft.client.renderer.texture.TextureManager textureManager = net.minecraft.client.Minecraft.getMinecraft().getTextureManager();
		textureManager.bindTexture(texture);

		<#if data.rotationMode != 0>
		net.minecraft.util.EnumFacing facing = tileEntity.getBlockMetadata();
		<#if data.rotationMode == 1 || data.rotationMode == 3>
		switch(facing) {
			case NORTH: break;
			case EAST: net.minecraft.client.renderer.GlStateManager.rotate(90, 0, 1, 0); break;
			case SOUTH: net.minecraft.client.renderer.GlStateManager.rotate(180, 0, 1, 0); break;
			case WEST: net.minecraft.client.renderer.GlStateManager.rotate(270, 0, 1, 0); break;
		}
		<#elseif data.rotationMode == 2 || data.rotationMode == 4>
		switch(facing) {
			case NORTH: break;
			case SOUTH: net.minecraft.client.renderer.GlStateManager.rotate(180, 0, 1, 0); break;
			case EAST: net.minecraft.client.renderer.GlStateManager.rotate(90, 0, 1, 0); break;
			case WEST: net.minecraft.client.renderer.GlStateManager.rotate(270, 0, 1, 0); break;
			case UP: net.minecraft.client.renderer.GlStateManager.rotate(90, 1, 0, 0); break;
			case DOWN: net.minecraft.client.renderer.GlStateManager.rotate(270, 1, 0, 0); break;
		}
		</#if>
		</#if>

		net.minecraft.client.renderer.GlStateManager.popMatrix();
	}
}
<#-- @formatter:on -->