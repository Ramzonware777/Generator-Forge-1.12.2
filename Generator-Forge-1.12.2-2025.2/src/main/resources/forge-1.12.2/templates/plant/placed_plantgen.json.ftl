{
    "feature": "${modid}:${registryname}",
    "placement": [
        {
            "type": "count",
            "count": ${data.frequencyOnChunks}
        },
        {
            "type": "in_square"
        },
        {
            "type": "heightmap",
            "heightmap": "WORLD_SURFACE"
        },
        {
            "type": "biome"
        }
    ]
}