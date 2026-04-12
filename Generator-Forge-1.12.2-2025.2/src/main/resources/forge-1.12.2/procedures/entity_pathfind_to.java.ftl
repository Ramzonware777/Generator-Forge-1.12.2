if (${input$entity} instanceof net.minecraft.entity.EntityLiving) {
	((net.minecraft.entity.EntityLiving) ${input$entity}).getNavigator().tryMoveToXYZ(${input$x}, ${input$y}, ${input$z}, (double)${input$speed});
}
