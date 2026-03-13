{
    "parent": "block/door_bottom_rh",
    "textures": {
        <#if data.particleTexture?has_content>"particle": "${data.particleTexture.format("%s:blocks/%s")}",</#if>
        "bottom": "${data.texture.format("%s:blocks/%s")}",
        "top": "${data.textureTop().format("%s:blocks/%s")}"
    }
}
