<#-- @formatter:off -->
package ${package};

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import net.minecraftforge.fml.relauncher.Side;
import net.minecraftforge.fml.common.network.simpleimpl.SimpleNetworkWrapper;
import net.minecraftforge.fml.common.network.simpleimpl.IMessageHandler;
import net.minecraftforge.fml.common.network.simpleimpl.IMessage;
import net.minecraftforge.fml.common.network.NetworkRegistry;
import net.minecraftforge.fml.common.eventhandler.SubscribeEvent;
import net.minecraftforge.fml.common.event.FMLServerStartingEvent;
import net.minecraftforge.fml.common.event.FMLPreInitializationEvent;
import net.minecraftforge.fml.common.event.FMLPostInitializationEvent;
import net.minecraftforge.fml.common.event.FMLInitializationEvent;
import net.minecraftforge.fml.common.SidedProxy;
import net.minecraftforge.fml.common.Mod;
import net.minecraftforge.fml.common.thread.SidedThreadGroups;
import net.minecraftforge.fml.common.gameevent.TickEvent;
import net.minecraftforge.fluids.FluidRegistry;
import net.minecraftforge.common.MinecraftForge;

import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.List;
import java.util.AbstractMap;
import java.util.Collection;
import java.util.ArrayList;

@Mod(modid = ${JavaModName}.MODID, version = ${JavaModName}.VERSION)
public class ${JavaModName} {
	public static final String MODID = "${modid}";
	public static final String VERSION = "${settings.getCleanVersion()}";
	public static final Logger LOGGER = LogManager.getLogger(${JavaModName}.class);
	public static SimpleNetworkWrapper PACKET_HANDLER;
	@SidedProxy(clientSide = "${package}.network.${JavaModName}ClientProxy", serverSide = "${package}.network.${JavaModName}CommonProxy")
	public static ${JavaModName}CommonProxy proxy;
	@Mod.Instance(MODID)
	public static ${JavaModName} instance;

	@Mod.EventHandler
	public void preInit(FMLPreInitializationEvent event) {
		MinecraftForge.EVENT_BUS.register(this);
		PACKET_HANDLER = NetworkRegistry.INSTANCE.newSimpleChannel(MODID);
		<#if w.hasVariables()>${JavaModName}Variables.init();</#if>
		<#if w.getGElementsOfType('procedure')?filter(e -> e.procedurexml?contains('player_left_click_air') || e.procedurexml?contains('player_right_click_empty_hand'))?size != 0>${JavaModName}Procedures.load();</#if>
		<#if w.hasElementsOfType("keybind")>${JavaModName}KeyMappings.load();</#if>
		<#if w.hasElementsOfType("gui")>
		${JavaModName}Menus.load();
		${JavaModName}Screens.load(this);
		</#if>
		<#if w.hasElementsOfType("dimension")>
		<#list w.getGElementsOfType("dimension") as dimension>
		${package}.world.dimension.${dimension.getModElement().getName()}Dimension.registerDimension();
		</#list>
		</#if>

		proxy.preInit(event);
	}

	@Mod.EventHandler
	public void init(FMLInitializationEvent event) {
		<#if w.getGElementsOfType("block")?size != 0>${JavaModName}Blocks.init();</#if>
		<#if w.getGElementsOfType("item")?size != 0 || w.getGElementsOfType("tool")?size != 0>${JavaModName}Items.init();</#if>
		<#if w.hasElementsOfType("fluid")>${JavaModName}Fluids.init();</#if>
		<#if w.hasElementsOfType("plant")>${JavaModName}Plants.init();</#if>
		<#if w.hasElementsOfType("biome")>${JavaModName}Biomes.init();</#if>
		<#if w.hasElementsOfType("livingentity")>${JavaModName}Entities.init();</#if>
		<#if w.hasElementsOfType("livingentity")>${JavaModName}EntityRenderers.registerRenderers();</#if>
		<#if w.hasElementsOfType("feature")>${JavaModName}Features.init();</#if>
		<#if w.getGElementsOfType('recipe')?filter(e -> e.recipeType == 'Smelting' || e.recipeType == 'Brewing')?size != 0>${JavaModName}Recipes.load();</#if>
		<#if w.hasElementsOfType("loottable")>${JavaModName}Loottables.load();</#if>
		<#if w.hasElementsOfType("keybind")>${JavaModName}KeyMappings.registerKeyBindings();</#if>
		<#if w.getGElementsOfType('itemextension')?filter(e -> e.hasDispenseBehavior)?size != 0>${JavaModName}ItemExtensions.load();</#if>
		<#if w.hasElementsOfType("villagertrade")>${JavaModName}Trades.load();</#if>

		proxy.init(event);
	}

	@Mod.EventHandler
	public void postInit(FMLPostInitializationEvent event) {
		proxy.postInit(event);
	}

	@Mod.EventHandler
	public void serverLoad(FMLServerStartingEvent event) {
		proxy.serverLoad(event);
	}

	static {
		FluidRegistry.enableUniversalBucket();
	}
	private static int messageID = 0;

	public static <T extends IMessage, V extends IMessage> void addNetworkMessage(Class<? extends IMessageHandler<T, V>> messageHandler, Class<T> requestMessageType, Side... sides) {
		for (Side side : sides)
			PACKET_HANDLER.registerMessage(messageHandler, requestMessageType, messageID, side);
		messageID++;
	}

	private static final Collection<AbstractMap.SimpleEntry<Runnable, Integer>> workQueue = new ConcurrentLinkedQueue<>();

	public static void queueServerWork(int tick, Runnable action) {
		if (Thread.currentThread().getThreadGroup() == SidedThreadGroups.SERVER)
			workQueue.add(new AbstractMap.SimpleEntry<>(action, tick));
	}

	@SubscribeEvent
	public void tick(TickEvent.ServerTickEvent event) {
		if (event.phase == TickEvent.Phase.END) {
			List<AbstractMap.SimpleEntry<Runnable, Integer>> actions = new ArrayList<>();
			workQueue.forEach(work -> {
				work.setValue(work.getValue() - 1);
				if (work.getValue() == 0)
					actions.add(work);
			});
			actions.forEach(e -> e.getKey().run());
			workQueue.removeAll(actions);
		}
	}
}
<#-- @formatter:on -->
