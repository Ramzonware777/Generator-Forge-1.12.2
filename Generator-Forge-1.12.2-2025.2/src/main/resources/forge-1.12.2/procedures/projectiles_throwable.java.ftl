<#include "mcitems.ftl">
{
	EntitySnowball snowball = new EntitySnowball(${input$world});
	snowball.setPosition(${input$shooter}.posX, ${input$shooter}.posY + ${input$shooter}.getEyeHeight(), ${input$shooter}.posZ);
	snowball.shoot(${input$shooter}.getLook(1.0f).x, ${input$shooter}.getLook(1.0f).y, ${input$shooter}.getLook(1.0f).z, ${opt.toFloat(input$speed)}, 1);
	${input$world}.spawnEntity(snowball);
}
