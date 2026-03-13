<#include "mcelements.ftl">
<@addTemplate file="utils/fluidtank/block_fluidtank_check_drain.java.ftl"/>
/*@int*/(drainTankSimulate(${input$world}, ${toBlockPos(input$x,input$y,input$z)}, ${opt.toInt(input$amount)}, ${input$direction}))
