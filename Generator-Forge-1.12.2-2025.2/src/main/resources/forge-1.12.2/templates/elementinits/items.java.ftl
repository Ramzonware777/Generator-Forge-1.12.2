<#--
 # MCreator note: This file will be REGENERATED on each build.
 # Adaptado para la API de Forge 1.12.2 - Corrección de paquetes y compatibilidad
 -->
package ${package}.init;

import net.minecraft.item.Item;
import net.minecraft.item.ItemBlock;
import net.minecraftforge.event.RegistryEvent;
import net.minecraftforge.fml.common.Mod;
import net.minecraftforge.fml.common.eventhandler.SubscribeEvent;
import net.minecraftforge.fml.common.registry.GameRegistry.ObjectHolder;

<#assign itemList = items>

@Mod.EventBusSubscriber(modid = "${modid}")
public class ${JavaModName}Items {

	<#-- 1. DECLARACIÓN DE VARIABLES -->
	<#list itemList as item>
		<#if item.getModElement().getTypeString() == "livingentity">
			<#continue> <#-- Omitimos entidades, sus huevos de regeneración se manejan en otro lado en 1.12.2 -->
		</#if>
		
		<#if item.getModElement().getTypeString() == "armor">
			<#if item.enableHelmet>
			@ObjectHolder("${modid}:${item.getModElement().getRegistryName()}_helmet")
			public static final Item ${item.getModElement().getRegistryNameUpper()}_HELMET = null;
			</#if>
			<#if item.enableBody>
			@ObjectHolder("${modid}:${item.getModElement().getRegistryName()}_chestplate")
			public static final Item ${item.getModElement().getRegistryNameUpper()}_CHESTPLATE = null;
			</#if>
			<#if item.enableLeggings>
			@ObjectHolder("${modid}:${item.getModElement().getRegistryName()}_leggings")
			public static final Item ${item.getModElement().getRegistryNameUpper()}_LEGGINGS = null;
			</#if>
			<#if item.enableBoots>
			@ObjectHolder("${modid}:${item.getModElement().getRegistryName()}_boots")
			public static final Item ${item.getModElement().getRegistryNameUpper()}_BOOTS = null;
			</#if>
		<#elseif item.getModElement().getTypeString() == "fluid" && item.generateBucket>
			@ObjectHolder("${modid}:${item.getModElement().getRegistryName()}_bucket")
			public static final Item ${item.getModElement().getRegistryNameUpper()}_BUCKET = null;
		<#else>
			@ObjectHolder("${modid}:${item.getModElement().getRegistryName()}")
			public static final Item ${item.getModElement().getRegistryNameUpper()} = null;
		</#if>
	</#list>

	<#-- 
	  Método vacío de compatibilidad. 
	  Evita el error "cannot find symbol method init()" en tu clase principal (TestMod.java).
	-->
	public static void init() {
	}

	<#-- 2. EVENTO DE REGISTRO REAL -->
	@SubscribeEvent
	public static void registerItems(RegistryEvent.Register<Item> event) {
		<#list itemList as item>
			<#if item.getModElement().getTypeString() == "livingentity">
				<#continue> <#-- Omitimos entidades -->
			</#if>
			
			<#if item.getModElement().getTypeString() == "armor">
				<#if item.enableHelmet>
				event.getRegistry().register(new ${package}.item.${item.getModElement().getName()}Item.Helmet().setRegistryName("${item.getModElement().getRegistryName()}_helmet").setUnlocalizedName("${item.getModElement().getRegistryName()}_helmet"));
				</#if>
				<#if item.enableBody>
				event.getRegistry().register(new ${package}.item.${item.getModElement().getName()}Item.Chestplate().setRegistryName("${item.getModElement().getRegistryName()}_chestplate").setUnlocalizedName("${item.getModElement().getRegistryName()}_chestplate"));
				</#if>
				<#if item.enableLeggings>
				event.getRegistry().register(new ${package}.item.${item.getModElement().getName()}Item.Leggings().setRegistryName("${item.getModElement().getRegistryName()}_leggings").setUnlocalizedName("${item.getModElement().getRegistryName()}_leggings"));
				</#if>
				<#if item.enableBoots>
				event.getRegistry().register(new ${package}.item.${item.getModElement().getName()}Item.Boots().setRegistryName("${item.getModElement().getRegistryName()}_boots").setUnlocalizedName("${item.getModElement().getRegistryName()}_boots"));
				</#if>
			<#elseif item.getModElement().getTypeString() == "block" || item.getModElement().getTypeString() == "plant">
				event.getRegistry().register(new ItemBlock(${JavaModName}Blocks.${item.getModElement().getRegistryNameUpper()}).setRegistryName("${item.getModElement().getRegistryName()}").setUnlocalizedName("${item.getModElement().getRegistryName()}"));
			<#elseif item.getModElement().getTypeString() == "fluid" && item.generateBucket>
				event.getRegistry().register(new ${package}.item.${item.getModElement().getName()}Item().setRegistryName("${item.getModElement().getRegistryName()}_bucket").setUnlocalizedName("${item.getModElement().getRegistryName()}_bucket"));
			<#else>
				<#-- Agregamos la ruta completa del paquete para que encuentre las clases de los ítems -->
				event.getRegistry().register(new ${package}.item.${item.getModElement().getName()}Item().setRegistryName("${item.getModElement().getRegistryName()}").setUnlocalizedName("${item.getModElement().getRegistryName()}"));
			</#if>
		</#list>
	}
}