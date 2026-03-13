<#include "mcitems.ftl">
/*@BlockState*/(${mappedBlockToBlockStateCode(input$block)}.getBlock().getStateContainer().getProperty(${input$property}) instanceof PropertyBool ?
	${mappedBlockToBlockStateCode(input$block)}.withProperty((PropertyBool)${mappedBlockToBlockStateCode(input$block)}.getBlock().getStateContainer().getProperty(${input$property}), ${input$value}) : ${mappedBlockToBlockStateCode(input$block)})
