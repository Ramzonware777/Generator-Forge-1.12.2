<#include "mcitems.ftl">
(${mappedBlockToBlockStateCode(input$block)}.get(((PropertyBool)${mappedBlockToBlockStateCode(input$block)}.getBlock().getStateContainer().getProperty(${input$property}))))
