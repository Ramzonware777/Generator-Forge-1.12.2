<#assign spawnBiomes = w.filterBrokenReferences(data.restrictionBiomes)>
{
  "biomes": [
    <#if spawnBiomes?size == 1>
    "${spawnBiomes?first}"
    <#elseif spawnBiomes?size gt 1>
    <#list spawnBiomes as spawnBiome>"${spawnBiome}"<#sep>,</#list>
    </#if>
  ],
  "feature": "${modid}:${registryname}",
  "generationstep": "${generator.map(data.generationStep, "generationsteps")}"
}