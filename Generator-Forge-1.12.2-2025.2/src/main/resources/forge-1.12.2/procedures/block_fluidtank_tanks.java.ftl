<#include "mcelements.ftl">
<@addTemplate file="utils/fluidtank/block_fluidtank_tanks.java.ftl"/>
/*@int*/(getBlockTanks(${input$world}, ${toBlockPos(input$x,input$y,input$z)}, ${input$direction}))
