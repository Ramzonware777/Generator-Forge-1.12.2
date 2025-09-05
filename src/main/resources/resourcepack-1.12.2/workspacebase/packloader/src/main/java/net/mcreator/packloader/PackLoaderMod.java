package net.mcreator.packloader;

import net.minecraft.client.Minecraft;
import net.minecraft.client.resources.ClientResourcePackInfo;
import net.minecraftforge.api.distmarker.Dist;
import net.minecraftforge.eventbus.api.SubscribeEvent;
import net.minecraftforge.fml.common.Mod;
import net.minecraftforge.fml.event.lifecycle.FMLClientSetupEvent;
import net.minecraftforge.fml.loading.FMLPaths;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

@Mod(modid = PackLoaderMod.MODID, clientSideOnly = true)
public class PackLoaderMod {

    public static final String MODID = "packloader";

    @Mod.EventBusSubscriber(modid = MODID, value = Side.CLIENT)
    public static class ClientModEvents {
        @SubscribeEvent
        public static void onClientSetup(FMLPreInitializationEvent event) {
            /*List<String> resourcePacks = new ArrayList<>();
            Path resourcePacksPath = FMLPaths.getOrCreateGameRelativePath(Paths.get("resourcepacks"), "resourcepacks");
            if (resourcePacksPath.toFile().exists()) {
                File[] files = resourcePacksPath.toFile().listFiles();
                if (files != null) {
                    for (File file : files) {
                        resourcePacks.add(file.getName());
                    }
                }
            }

            boolean anyChanged = false;
            Collection<ResourcePackRepository.Entry> selectedPacks = new LinkedList<>(Minecraft.getMinecraft().getResourcePackRepository().getRepositoryEntries());
            Collection<ResourcePackRepository.Entry> allPacks = Minecraft.getMinecraft().getResourcePackRepository().getRepositoryEntriesAll();
            for (ClientResourcePackInfo pack : allPacks) {
                for (String resourcePack : resourcePacks) {
                    if (pack.getResourcePackName().contains(resourcePack)) {
                        anyChanged = true;
                        selectedPacks.add(pack);
                    }
                }
            }

            if (anyChanged) {
                Minecraft.getMinecraft().getResourcePackRepository().setSelected(selectedPacks);
                Minecraft.getMinecraft().gameSettings.loadResourcePacks(Minecraft.getMinecraft().getResourcePackRepository());
            }*/
        }
    }
}