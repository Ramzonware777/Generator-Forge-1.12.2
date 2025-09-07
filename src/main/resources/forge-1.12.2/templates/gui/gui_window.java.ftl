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
package ${package}.client.gui;

<#assign textFields = data.getComponentsOfType("TextField")>
<#assign checkboxes = data.getComponentsOfType("Checkbox")>
<#assign buttons = data.getComponentsOfType("Button")>
<#assign imageButtons = data.getComponentsOfType("ImageButton")>
<#assign tooltips = data.getComponentsOfType("Tooltip")>

<#compress>
public class ${name}Screen extends GuiContainer implements ${JavaModName}Screens.ScreenAccessor {

	private final World world;
	private final int x, y, z;
	private final EntityPlayer entity;

	private boolean menuStateUpdateActive = false;

	<#list textFields as component>
	GuiTextField ${component.getName()};
	</#list>

	<#list checkboxes as component>
	GuiCheckBox ${component.getName()};
	</#list>

	<#list buttons as component>
	GuiButton ${component.getName()};
	</#list>

	<#list imageButtons as component>
	GuiButtonImage ${component.getName()};
	</#list>

	public ${name}Screen(InventoryPlayer inv, PacketBuffer extraData) {
		this(new ${name}Menu(inv, extraData));
	}

	public ${name}Screen(${name}Menu container) {
		super(container);
		this.world = container.world;
		this.x = container.x;
		this.y = container.y;
		this.z = container.z;
		this.entity = container.entity;
		this.xSize = ${data.width};
		this.ySize = ${data.height};
	}

	@Override public void updateMenuState(int elementType, String name, Object elementState) {
		menuStateUpdateActive = true;

		<#if textFields?has_content>
		if (elementType == 0 && elementState instanceof String) {
			<#list textFields as component>
				<#if !component?is_first>else</#if> if (name.equals("${component.getName()}"))
					${component.getName()}.setText((String) elementState);
			</#list>
		}
		</#if>

		<#-- updateMenuState is not implemented for checkboxes, as there is no procedure block to set checkbox state currently -->

		menuStateUpdateActive = false;
	}

	<#if data.doesPauseGame>
	@Override public boolean doesGuiPauseGame() {
		return true;
	}
	</#if>

	<#if data.renderBgLayer>
	private static final ResourceLocation texture = new ResourceLocation("${modid}:textures/screens/${registryname}.png");
	</#if>

	@Override public void drawScreen(int mouseX, int mouseY, float partialTicks) {
		this.drawDefaultBackground();
		super.drawScreen(mouseX, mouseY, partialTicks);

		<#list textFields as component>
		${component.getName()}.drawTextBox();
		</#list>

		<#compress>
		<#list data.getComponentsOfType("EntityModel") as component>
			<#assign followMouse = component.followMouseMovement>
			<#assign x = component.gx(data.width)>
			<#assign y = component.gy(data.height)>
			if (<@procedureOBJToConditionCode component.entityModel/> instanceof EntityLivingBase) {
				<#if hasProcedure(component.displayCondition)>
					if (<@procedureOBJToConditionCode component.displayCondition/>)
				</#if>
				GuiInventory.drawEntityOnScreen(this.guiLeft + ${x + 10}, this.guiTop + ${y + 20}, ${component.scale},
					${component.rotationX / 20.0}f <#if followMouse> + (float) Math.atan((this.guiLeft + ${x + 10} - mouseX) / 40.0)</#if>,
					<#if followMouse>(float) Math.atan((this.guiTop + ${y + 21 - 50} - mouseY) / 40.0)<#else>0</#if>, (EntityLivingBase) <@procedureOBJToConditionCode component.entityModel/>);
			}
		</#list>
		</#compress>

		<#if tooltips?has_content>
		boolean customTooltipShown = false;
		</#if>
		<#list tooltips as component>
			<#assign x = component.gx(data.width)>
			<#assign y = component.gy(data.height)>
			<#if hasProcedure(component.displayCondition)>
				if (<@procedureOBJToConditionCode component.displayCondition/>)
			</#if>
				if (mouseX > guiLeft + ${x} && mouseX < guiLeft + ${x + component.width} && mouseY > guiTop + ${y} && mouseY < guiTop + ${y + component.height}) {
					<#if hasProcedure(component.text)>
					String hoverText = <@procedureOBJToStringCode component.text/>;
					if (hoverText != null) {
						this.drawHoveringText(Arrays.stream(hoverText.split("\n")).collect(Collectors.toList()), mouseX, mouseY);
					}
					<#else>
						this.drawHoveringText(new TextComponentTranslation("gui.${modid}.${registryname}.${component.getName()}").getFormattedText(), mouseX, mouseY);
					</#if>
					customTooltipShown = true;
				}
		</#list>

		<#if tooltips?has_content>
		if (!customTooltipShown)
		</#if>
		this.renderHoveredToolTip(mouseX, mouseY);
	}

	@Override protected void drawGuiContainerBackgroundLayer(float partialTicks, int mouseX, int mouseY) {
		GlStateManager.color(1, 1, 1, 1);
		GlStateManager.enableBlend();
		GlStateManager.tryBlendFuncSeparate(GlStateManager.SourceFactor.SRC_ALPHA, GlStateManager.DestFactor.ONE_MINUS_SRC_ALPHA, GlStateManager.SourceFactor.ONE, GlStateManager.DestFactor.ZERO);

		<#if data.renderBgLayer>
			Minecraft.getMinecraft().getTextureManager().bindTexture(texture);
			this.drawModalRectWithCustomSizedTexture(this.guiLeft, this.guiTop, 0, 0, this.xSize, this.ySize, this.xSize, this.ySize);
		</#if>

		<#list data.getComponentsOfType("Image") as component>
			<#if hasProcedure(component.displayCondition)>if (<@procedureOBJToConditionCode component.displayCondition/>) {</#if>
				Minecraft.getMinecraft().getTextureManager().bindTexture(new ResourceLocation("${modid}:textures/screens/${component.image}"));
					this.drawModalRectWithCustomSizedTexture(this.guiLeft + ${component.gx(data.width)}, this.guiTop + ${component.gy(data.height)}, 0, 0,
					${component.getWidth(w.getWorkspace())}, ${component.getHeight(w.getWorkspace())},
					${component.getWidth(w.getWorkspace())}, ${component.getHeight(w.getWorkspace())});
			<#if hasProcedure(component.displayCondition)>}</#if>
		</#list>

		<#list data.getComponentsOfType("Sprite") as component>
			<#if hasProcedure(component.displayCondition)>if (<@procedureOBJToConditionCode component.displayCondition/>) {</#if>
				Minecraft.getMinecraft().getTextureManager().bindTexture(new ResourceLocation("${modid}:textures/screens/${component.sprite}"));
					this.drawModalRectWithCustomSizedTexture(this.guiLeft + ${component.gx(data.width)}, this.guiTop + ${component.gy(data.height)},
					<#if (component.getTextureWidth(w.getWorkspace()) > component.getTextureHeight(w.getWorkspace()))>
						<@getSpriteByIndex component "width"/>, 0
					<#else>
						0, <@getSpriteByIndex component "height"/>
					</#if>,
					${component.getWidth(w.getWorkspace())}, ${component.getHeight(w.getWorkspace())},
					${component.getTextureWidth(w.getWorkspace())}, ${component.getTextureHeight(w.getWorkspace())});
			<#if hasProcedure(component.displayCondition)>}</#if>
		</#list>

		GlStateManager.disableBlend();
	}

	@Override protected void keyTyped(char typedChar, int keyCode) throws IOException {
		if (keyCode == 1) {
			this.mc.player.closeScreen();
			return;
		}

		<#list textFields as component>
			if(${component.getName()}.isFocused()) {
				${component.getName()}.textboxKeyTyped(typedChar, keyCode);
			    return;
			}
		</#list>

		super.keyTyped(typedChar, keyCode);
	}

	<#if textFields?has_content>
	@Override public void onResize(Minecraft minecraft, int width, int height) {
		<#list textFields as component>
		String ${component.getName()}Value = ${component.getName()}.getText();
		</#list>
		super.onResize(minecraft, width, height);
		<#list textFields as component>
		${component.getName()}.setText(${component.getName()}Value);
		</#list>
	}
	</#if>

	@Override protected void drawGuiContainerForegroundLayer(int mouseX, int mouseY) {
		<#list data.getComponentsOfType("Label") as component>
			<#if hasProcedure(component.displayCondition)>
				if (<@procedureOBJToConditionCode component.displayCondition/>)
			</#if>
			this.fontRenderer.drawStringWithShadow(
				<#if hasProcedure(component.text)><@procedureOBJToStringCode component.text/><#else>new TextComponentTranslation("gui.${modid}.${registryname}.${component.getName()}").getFormattedText()</#if>,
				${component.gx(data.width)}, ${component.gy(data.height)}, ${component.color.getRGB()});
		</#list>
	}

	@Override public void initGui() {
		super.initGui();

		<#assign tfid = 0>

		<#list textFields as component>
			${component.getName()} = new GuiTextField(${component_index}, this.fontRenderer, this.guiLeft + ${component.gx(data.width) + 1}, this.guiTop + ${component.gy(data.height) + 1},
			${component.width - 2}, ${component.height - 2})<#if component.placeholder?has_content> {
				    @Override ${mcc.getMethod("net.minecraft.client.gui.GuiTextField", "drawTextBox")
				        .replace("if (flag1)", "if (!flag2) this.fontRenderer.drawStringWithShadow(new TextComponentTranslation(\"gui." + modid + "." + registryname + "." + component.getName() + "\").getFormattedText(), (float)(k1 - 1), (float)i1, -8355712); if (flag1)")}
			}</#if>;
			${component.getName()}.setMaxStringLength(8192);
			${component.getName()}.setGuiResponder(new GuiPageButtonList.GuiResponder() {

			@Override public void setEntryValue(int id, String content) {
				if (!menuStateUpdateActive)
					((${JavaModName}Menus.MenuAccessor) inventorySlots).sendMenuStateUpdate(entity, 0, "${component.getName()}", content, false);
            }

			@Override public void setEntryValue(int id, boolean content) {
            }

			@Override public void setEntryValue(int id, float content) {
            }
			});
		</#list>

		<#assign btid = 0>

		<#list buttons as component>
			${component.getName()} = new GuiButton(${btid},
				this.guiLeft + ${component.gx(data.width)}, this.guiTop + ${component.gy(data.height)},
				${component.width}, ${component.height},
				new TextComponentTranslation("gui.${modid}.${registryname}.${component.getName()}").getFormattedText())
				    <#if component.isUndecorated || hasProcedure(component.onClick)>{
				    <@buttonOnClick component/>

				    <#if component.isUndecorated>
                    @Override public void drawButton(Minecraft mc, int mouseX, int mouseY, float partialTick) {
                        String text = this.isMouseOver() ? (TextFormatting.UNDERLINE + ${component.getName()}.displayString) : ${component.getName()}.displayString;
                        drawString(fontRenderer, text, ${component.getName()}.x, ${component.getName()}.y, 16777215 | MathHelper.ceil(1.0F * 255.0F) << 24);
                    }</#if>
                }</#if>;

			this.addButton(${component.getName()});

			<#assign btid +=1>
		</#list>

		<#list imageButtons as component>
			${component.getName()} = new GuiButtonImage(${btid},
				this.guiLeft + ${component.gx(data.width)}, this.guiTop + ${component.gy(data.height)},
				${component.getWidth(w.getWorkspace())}, ${component.getHeight(w.getWorkspace())},
				0, 0, ${component.getHeight(w.getWorkspace())},
				new ResourceLocation("${modid}:textures/screens/atlas/${component.getName()}.png")) {<#if hasProcedure(component.onClick)>
				    <@buttonOnClick component/></#if>

				    @Override ${mcc.getMethod("net.minecraft.client.gui.GuiButtonImage", "drawButton", "Minecraft", "int", "int", "float")
				        .replace("drawTexturedModalRect(this.x, this.y, i, j, this.width, this.height)", "drawModalRectWithCustomSizedTexture(this.x, this.y, i, j, this.width, this.height," + component.getWidth(w.getWorkspace()) + ", " + (component.getHeight(w.getWorkspace()) * 2) + ")")}
                };

			this.addButton(${component.getName()});

			<#assign btid +=1>
		</#list>

		<#list checkboxes as component>
			<#if hasProcedure(component.isCheckedProcedure)>boolean ${component.getName()}Selected = <@procedureOBJToConditionCode component.isCheckedProcedure/>;</#if>
			${component.getName()} = new GuiCheckBox(${btid}, this.guiLeft + ${component.gx(data.width)}, this.guiTop + ${component.gy(data.height)},
				new TextComponentTranslation("gui.${modid}.${registryname}.${component.getName()}").getFormattedText(),
				<#if hasProcedure(component.isCheckedProcedure)>${component.getName()}Selected<#else>false</#if>) {
				    @Override public boolean mousePressed(Minecraft minecraft, int mouseX, int mouseY) {
				        if (!menuStateUpdateActive)
				            ((${JavaModName}Menus.MenuAccessor) inventorySlots).sendMenuStateUpdate(entity, 1, "${component.getName()}", this.isChecked(), false);

				        return super.mousePressed(minecraft, mouseX, mouseY);
				    }
			};
			<#if hasProcedure(component.isCheckedProcedure)>
				if (${component.getName()}Selected)
					((${JavaModName}Menus.MenuAccessor) inventorySlots).sendMenuStateUpdate(entity, 1, "${component.getName()}", true, false);
			</#if>

			this.addButton(${component.getName()});

			<#assign btid +=1>
		</#list>
	}

	<#if buttons?filter(component -> hasProcedure(component.displayCondition))?size != 0 || imageButtons?filter(component -> hasProcedure(component.displayCondition))?size != 0 || textFields?has_content>
	@Override public void updateScreen() {
		super.updateScreen();

		<#list textFields as component>
			${component.getName()}.updateCursorCounter();
		</#list>
		<#list buttons as component>
			<#if hasProcedure(component.displayCondition)>
				this.${component.getName()}.visible = <@procedureOBJToConditionCode component.displayCondition/>;
			</#if>
		</#list>
		<#list imageButtons as component>
			<#if hasProcedure(component.displayCondition)>
				this.${component.getName()}.visible = <@procedureOBJToConditionCode component.displayCondition/>;
			</#if>
		</#list>
	}
	</#if>

}
</#compress>

<#macro buttonOnClick component>
<#if hasProcedure(component.onClick)>
public boolean mousePressed(Minecraft mc, int mouseX, int mouseY) {
		int x = ${name}Screen.this.x; <#-- #5582 - x and y provided by buttons are in-GUI, not in-world coordinates -->
		int y = ${name}Screen.this.y;
		if (<@procedureOBJToConditionCode component.displayCondition/>) {
			${JavaModName}.PACKET_HANDLER.sendToServer(new ${name}ButtonMessage(${btid}, x, y, z));
			${name}ButtonMessage.handleButtonAction(entity, ${btid}, x, y, z);
		}

    return super.mousePressed(mc, mouseX, mouseY);
}
</#if>
</#macro>

<#macro getSpriteByIndex component dim>
	<#if hasProcedure(component.spriteIndex)>
		MathHelper.clamp((int) <@procedureOBJToNumberCode component.spriteIndex/> *
			<#if dim == "width">
				${component.getWidth(w.getWorkspace())}
			<#else>
				${component.getHeight(w.getWorkspace())}
			</#if>,
			0,
			<#if dim == "width">
				${component.getTextureWidth(w.getWorkspace()) - component.getWidth(w.getWorkspace())}
			<#else>
				${component.getTextureHeight(w.getWorkspace()) - component.getHeight(w.getWorkspace())}
			</#if>
		)
	<#else>
		<#if dim == "width">
			${component.getWidth(w.getWorkspace()) * component.spriteIndex.getFixedValue()}
		<#else>
			${component.getHeight(w.getWorkspace()) * component.spriteIndex.getFixedValue()}
		</#if>
	</#if>
</#macro>
<#-- @formatter:on -->