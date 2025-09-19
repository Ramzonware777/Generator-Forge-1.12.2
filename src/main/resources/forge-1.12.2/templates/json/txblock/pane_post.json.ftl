{
    "parent": "block/template_glass_pane_post",
    "textures": {
        <#if data.particleTexture?has_content>"particle": "${data.particleTexture.format("%s:blocks/%s")}",</#if>
        "edge": "${data.textureTop().format("%s:blocks/%s")}",
        "pane": "${data.texture.format("%s:blocks/%s")}"
    }
}
