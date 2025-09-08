package net.mcreator.packloader;

import net.minecraftforge.fml.relauncher.Side;
import net.minecraftforge.fml.common.eventhandler.SubscribeEvent;
import net.minecraftforge.fml.common.event.FMLPreInitializationEvent;
import net.minecraftforge.fml.common.Mod;


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