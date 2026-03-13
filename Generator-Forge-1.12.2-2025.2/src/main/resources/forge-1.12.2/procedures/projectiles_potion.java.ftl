<#include "mcitems.ftl">
{
	EntityPotion potion = new EntityPotion(${input$world}, ${input$shooter}, new ItemStack(Items.POTION));
	potion.shoot(${input$shooter}.getLook(1.0f).x, ${input$shooter}.getLook(1.0f).y, ${input$shooter}.getLook(1.0f).z, ${opt.toFloat(input$speed)}, 1);
	${input$world}.spawnEntity(potion);
}
