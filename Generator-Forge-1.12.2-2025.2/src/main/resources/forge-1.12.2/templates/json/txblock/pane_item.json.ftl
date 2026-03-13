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
  "parent": "item/generated",
  "textures": {
    "layer0": "${data.texture.format("%s:blocks/%s")}"
  }
}
</#if>
<#-- @formatter:on -->
