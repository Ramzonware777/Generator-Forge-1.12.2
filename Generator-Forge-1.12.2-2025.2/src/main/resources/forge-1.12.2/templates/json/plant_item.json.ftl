{
  "parent": "item/generated",
  "textures": {
    <#if data.itemTexture?has_content>
    "layer0": "${data.itemTexture.format("%s:items/%s")}"
    <#else>
    "layer0": "${data.texture.format("%s:blocks/%s")}"
    </#if>
  }
}