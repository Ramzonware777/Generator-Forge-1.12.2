{
  "type": "minecraft:generic",
  "config": {
    "structure": {
      "pool": "${modid}:${field$structure}",
      <#if field$random_rotation == "TRUE">"rotation": true,</#if>
      <#if field$random_mirror == "TRUE">"mirror": true,</#if>
      "ignoreEntities": false,
      "groundAnchorDrop": 0,
      "offset": {
        "x": ${field$x!0},
        "y": ${field$y!0},
        "z": ${field$z!0}
      }
    },
    "biome": "minecraft:plains",
    "chance": ${field$chance!50}
  }
}