{
  "parent": "block/${var_model}",
  "textures": {
    "${var_txname}": "${data.texture.format("%s:blocks/%s")}",
    "particle": "${data.getParticleTexture().format("%s:blocks/%s")}"
  }
}
