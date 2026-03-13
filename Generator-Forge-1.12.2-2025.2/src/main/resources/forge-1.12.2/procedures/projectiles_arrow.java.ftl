<#include "mcitems.ftl">
{
	EntityArrow arrow = new EntityArrow(${input$world}, ${input$shooter});
	arrow.shoot(${input$shooter}.getLook(1.0f).x, ${input$shooter}.getLook(1.0f).y, ${input$shooter}.getLook(1.0f).z, ${opt.toFloat(input$speed)}, ${opt.toFloat(input$damage)});
	${input$world}.spawnEntity(arrow);
}
