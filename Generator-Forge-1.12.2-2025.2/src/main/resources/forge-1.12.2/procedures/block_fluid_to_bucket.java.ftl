<#include "mcitems.ftl">
/*@ItemStack*/(${mappedBlockToBlock(input$block)}.getBlock() instanceof BlockDynamicLiquid ? new ItemStack(net.minecraft.init.Items.BUCKET) : ItemStack.EMPTY)
