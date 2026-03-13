<#include "mcelements.ftl">
<@addTemplate file="utils/fluidtank/block_fluidtank_get.java.ftl"/>
/*@int*/(getFluidTankLevel(${input$world}, ${toBlockPos(input$x,input$y,input$z)}, ${opt.toInt(input$tank)}, ${input$direction}))
