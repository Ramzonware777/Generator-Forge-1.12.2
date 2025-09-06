<#assign entity = generator.map(field$entity, "entities", 0)!"null">
(<#if entity != "null">new ${entity}(world)<#else>null</#if>)
