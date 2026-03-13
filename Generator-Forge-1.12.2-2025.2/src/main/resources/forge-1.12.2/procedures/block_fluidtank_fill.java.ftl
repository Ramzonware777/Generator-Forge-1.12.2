<#include "mcelements.ftl">
<#include "mcitems.ftl"
<#-- @formatter:off -->
TileEntity tileEntity = ${input$world}.getTileEntity(${toBlockPos(input$x,input$y,input$z)});
if (tileEntity != null) {
	IFluidHandler fluidHandler = tileEntity.getCapability(CapabilityFluidHandler.FLUID_HANDLER_CAPABILITY, ${input$direction});
	if (fluidHandler != null)
		fluidHandler.fill(new FluidStack(${generator.map(field$fluid, "fluids")}, ${opt.toInt(input$amount)}), false);
}
<#-- @formatter:on -->
