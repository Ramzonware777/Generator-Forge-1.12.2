<#include "mcitems.ftl">
(${input$entity} instanceof EntityLivingBase ? ((EntityLivingBase)${input$entity}).getHeldItemMainhand() : ItemStack.EMPTY).isEmpty == false
