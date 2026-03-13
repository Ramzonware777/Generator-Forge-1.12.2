<@addTemplate file="utils/world/entity_in_range.java.ftl"/>
<#assign entityClass = generator.map(field$entity!"Entity", "entities", 0)!"net.minecraft.entity.Entity">
(findEntityInWorldRange(world, ${entityClass}.class, ${input$x}, ${input$y}, ${input$z}, ${input$range}))
