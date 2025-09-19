{
    "parent": "block/button_inventory",
    "textures": {
        <#if data.particleTexture?has_content>"particle": "${data.particleTexture.format("%s:blocks/%s")}",</#if>
        "texture": "${data.texture.format("%s:blocks/%s")}"
    }
}
