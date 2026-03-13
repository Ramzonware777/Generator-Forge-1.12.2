<#-- @formatter:off -->
<#if data.itemTexture?has_content>
{
  "parent": "item/generated",
  "textures": {
    "layer0": "${data.itemTexture.format("%s:items/%s")}"
  }
}
<#else>
{
  "parent": "${modid}:block/${registryname}_inventory"
}
</#if>
<#-- @formatter:on -->
