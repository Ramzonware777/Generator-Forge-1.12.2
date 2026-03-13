<#include "mcelements.ftl">
<#-- @formatter:off -->
TileEntity tileEntity = ${input$world}.getTileEntity(${toBlockPos(input$x,input$y,input$z)});
if (tileEntity != null) {
	IFluidHandler fluidHandler = tileEntity.getCapability(CapabilityFluidHandler.FLUID_HANDLER_CAPABILITY, ${input$direction});
	if (fluidHandler != null)
		fluidHandler.drain(${opt.toInt(input$amount)}, false);
}
<#-- @formatter:on -->
