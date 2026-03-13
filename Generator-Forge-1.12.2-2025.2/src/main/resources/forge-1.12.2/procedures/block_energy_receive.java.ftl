<#include "mcelements.ftl">
<#-- @formatter:off -->
TileEntity tileEntity = ${input$world}.getTileEntity(${toBlockPos(input$x,input$y,input$z)});
if (tileEntity != null) {
	IEnergyStorage energyStorage = tileEntity.getCapability(CapabilityEnergy.ENERGY, ${input$direction});
	if (energyStorage != null)
		energyStorage.receiveEnergy(${opt.toInt(input$amount)}, false);
}
<#-- @formatter:on -->
