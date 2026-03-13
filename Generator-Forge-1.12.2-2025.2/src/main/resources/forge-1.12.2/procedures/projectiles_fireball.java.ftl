<#include "mcitems.ftl">
{
	EntityLargeFireball fireball = new EntityLargeFireball(${input$world}, ${input$shooter}, ${opt.toFloat(input$power)}, ${opt.toFloat(input$power)}, ${opt.toFloat(input$power)});
	fireball.shoot(${input$shooter}.getLook(1.0f).x, ${input$shooter}.getLook(1.0f).y, ${input$shooter}.getLook(1.0f).z, ${opt.toFloat(input$speed)}, 0);
	${input$world}.spawnEntity(fireball);
}
