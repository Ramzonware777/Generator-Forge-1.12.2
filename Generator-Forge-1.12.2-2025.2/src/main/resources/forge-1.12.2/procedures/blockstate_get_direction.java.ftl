<#include "mcitems.ftl">
(${mappedBlockToBlockStateCode(input$block)}.get(((PropertyDirection)${mappedBlockToBlockStateCode(input$block)}.getBlock().getStateContainer().getProperty(${input$property}))))
