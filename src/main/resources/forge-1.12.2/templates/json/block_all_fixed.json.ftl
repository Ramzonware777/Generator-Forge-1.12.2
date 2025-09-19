{
  "parent": "block/cube",
  "textures": {
    "down": "${data.texture.format("%s:blocks/%s")}",
    "up": "${data.textureTop().format("%s:blocks/%s")}",
    "north": "${data.textureFront().format("%s:blocks/%s")}",
    "east": "${data.textureLeft().format("%s:blocks/%s")}",
    "south": "${data.textureBack().format("%s:blocks/%s")}",
    "west": "${data.textureRight().format("%s:blocks/%s")}",
    "particle": "${data.getParticleTexture().format("%s:blocks/%s")}"
  }
}
