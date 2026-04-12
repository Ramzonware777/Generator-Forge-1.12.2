<#--
 # MCreator (https://mcreator.net/)
 # Copyright (C) 2012-2020, Pylo
 # Copyright (C) 2020-2024, Pylo, opensource contributors
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
<#include "../utils/procedures.java.ftl"

@SideOnly(Side.CLIENT)
public class ${name}FluidRenderer extends net.minecraft.client.renderer.texture.TextureMap {

	private static final net.minecraft.util.ResourceLocation STILL_TEXTURE = new net.minecraft.util.ResourceLocation("${modid}", "textures/fluid/${data.textureStill}.png");
	private static final net.minecraft.util.ResourceLocation FLOWING_TEXTURE = new net.minecraft.util.ResourceLocation("${modid}", "textures/fluid/${data.textureFlowing}.png");

	public ${name}FluidRenderer() {
		super("fluid");
	}

	public net.minecraft.util.ResourceLocation getStillTexture() {
		return STILL_TEXTURE;
	}

	public net.minecraft.util.ResourceLocation getFlowingTexture() {
		return FLOWING_TEXTURE;
	}
}
<#-- @formatter:on -->