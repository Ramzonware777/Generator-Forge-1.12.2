<#include "mcelements.ftl">
<#include "mcitems.ftl">
<@addTemplate file="utils/fluidtank/block_fluidtank_check_fill.java.ftl"/>
/*@int*/(fillTankSimulate(${input$world}, ${toBlockPos(input$x,input$y,input$z)}, ${opt.toInt(input$amount)}, ${input$direction}, ${generator.map(field$fluid, "fluids")}))
