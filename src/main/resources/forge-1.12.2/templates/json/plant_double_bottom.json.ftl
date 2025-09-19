{
  "parent": "block/${var_model}",
  "textures": {
    "cross": "${data.textureBottom().format("%s:blocks/%s")}",
    <#if data.particleTexture?has_content>
    "particle": "${data.particleTexture.format("%s:blocks/%s")}"
    <#else>
    "particle": "${data.textureBottom().format("%s:blocks/%s")}"
    </#if>
  }
}
