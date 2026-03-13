<#--
 # MCreator note: This file will be REGENERATED on each build.
 -->
package ${package};

import net.minecraft.init.Blocks;
import net.minecraft.init.Items;
import net.minecraft.item.Item;
import net.minecraft.block.Block;
import net.minecraft.world.biome.Biome;
import net.minecraft.potion.Potion;
import net.minecraft.entity.Entity;
import net.minecraft.util.SoundEvent;
import net.minecraftforge.fml.common.registry.EntityEntry;
import net.minecraftforge.fml.common.registry.GameRegistry;
import net.minecraftforge.event.RegistryEvent;
import net.minecraft.world.gen.feature.WorldGenerator;

import java.util.ArrayList;
import java.util.List;

public class ${JavaModName}Elements {

<#if w.hasElementsOfType("block")>
	public static List<Block> blocks = new ArrayList<>();
</#if>
<#if w.hasElementsOfType("item")>
	public static List<Item> items = new ArrayList<>();
</#if>
<#if w.hasElementsOfType("biome")>
	public static List<Biome> biomes = new ArrayList<>();
</#if>
<#if w.hasElementsOfType("livingentity")>
	public static List<EntityEntry> entities = new ArrayList<>();
</#if>
<#if w.hasElementsOfType("potioneffect")>
	public static List<Potion> potions = new ArrayList<>();
</#if>
<#if w.hasElementsOfType("sound")>
	public static List<SoundEvent> sounds = new ArrayList<>();
</#if>
<#if w.getGElementsOfType('recipe')?filter(e -> e.recipeType == 'Smelting' || e.recipeType == 'Brewing')?size != 0>
	public static List<net.minecraft.item.crafting.IRecipe> recipes = new ArrayList<>();
</#if>
<#if w.hasElementsOfType("loottable")>
	public static List<net.minecraft.util.ResourceLocation> lootTables = new ArrayList<>();
</#if>

	private final List<Element> elements = new ArrayList<>();

	public ${JavaModName}Elements() {
		<#list w.getAllElements() as element>
		elements.add(new ${element.getName()}());
		</#list>
	}

	public void preInit(net.minecraftforge.fml.common.event.FMLPreInitializationEvent event) {
		<#if w.hasElementsOfType("sound")>
		registerSounds(event);
		</#if>
	}

	public void init(net.minecraftforge.fml.common.event.FMLInitializationEvent event) {
	}

	public void serverLoad(net.minecraftforge.fml.common.event.FMLServerStartingEvent event) {
	}

	public void registerSounds(RegistryEvent.Register<SoundEvent> event) {
	}

	public List<Element> getElements() {
		return elements;
	}

<#if w.hasElementsOfType("block")>
	public List<Block> getBlocks() {
		return blocks;
	}
</#if>
<#if w.hasElementsOfType("item")>
	public List<Item> getItems() {
		return items;
	}
</#if>
<#if w.hasElementsOfType("biome")>
	public List<Biome> getBiomes() {
		return biomes;
	}
</#if>
<#if w.hasElementsOfType("livingentity")>
	public List<EntityEntry> getEntities() {
		return entities;
	}
</#if>
<#if w.hasElementsOfType("potioneffect")>
	public List<Potion> getPotions() {
		return potions;
	}
</#if>

	public static abstract class Element {
		public void preInit(net.minecraftforge.fml.common.event.FMLPreInitializationEvent event) {}
		public void init(net.minecraftforge.fml.common.event.FMLInitializationEvent event) {}
		public void serverLoad(net.minecraftforge.fml.common.event.FMLServerStartingEvent event) {}
		<#if w.hasElementsOfType("livingentity")>
		public void registerModels(net.minecraftforge.client.event.ModelRegistryEvent event) {}
		</#if>
	}

	public static class GuiHandler implements net.minecraftforge.fml.common.network.IGuiHandler {
		@Override
		public Object getServerGuiElement(int id, net.minecraft.entity.player.EntityPlayer player, net.minecraft.world.World world, int x, int y, int z) {
			return null;
		}

		@Override
		public Object getClientGuiElement(int id, net.minecraft.entity.player.EntityPlayer player, net.minecraft.world.World world, int x, int y, int z) {
			return null;
		}
	}
}