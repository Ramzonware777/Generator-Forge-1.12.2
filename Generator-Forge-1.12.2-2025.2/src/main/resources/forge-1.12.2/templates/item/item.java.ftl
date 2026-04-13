<#-- @formatter:off -->
<#include "../utils/procedures.java.ftl">
<#include "../utils/mcitems.ftl">
<#include "../utils/triggers.java.ftl">

package ${package}.item;

import net.minecraft.item.Item;
import net.minecraft.entity.player.EntityPlayer;
import net.minecraft.util.ActionResult;
import net.minecraft.util.EnumActionResult;
import net.minecraft.util.EnumHand;
import net.minecraft.world.World;

public class ${name}Item extends Item {

	public ${name}Item() {
		this.setUnlocalizedName("${modid}.${registryname}");
		<#if data.damageCount != 0>
		this.maxStackSize = 1;
		this.setMaxDamage(${data.damageCount});
		<#else>
		this.maxStackSize = ${data.stackSize!64};
		</#if>
		<#if data.creativeTab?has_content && data.creativeTab != "NONE">
		this.setCreativeTab(${data.creativeTab});
		</#if>
	}
	<#if hasProcedure(data.onRightClickedInAir)>

	@Override
	public ActionResult<net.minecraft.item.ItemStack> onItemRightClick(World world, EntityPlayer player, EnumHand hand) {
		net.minecraft.item.ItemStack itemstack = player.getHeldItem(hand);
		int x = (int) player.posX;
		int y = (int) player.posY;
		int z = (int) player.posZ;
		<@procedureCode data.onRightClickedInAir, {
			"x": "x", "y": "y", "z": "z",
			"world": "world", "entity": "player", "itemstack": "itemstack"
		}/>
		return new ActionResult<>(EnumActionResult.PASS, itemstack);
	}
	</#if>
}
<#-- @formatter:on -->