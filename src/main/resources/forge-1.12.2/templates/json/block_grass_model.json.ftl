{
  "parent": "block/grass_block",
  "textures": {
    "bottom": "${data.texture.format("%s:blocks/%s")}",
    "top": "${data.textureTop().format("%s:blocks/%s")}",
    "side": "${data.textureFront().format("%s:blocks/%s")}",
    "overlay": "${data.textureLeft().format("%s:blocks/%s")}",
    "particle": "${data.getParticleTexture().format("%s:blocks/%s")}"
  }
}
