<?xml version="1.0"?>
<#import "root://activities/common/kotlin_macros.ftl" as kt>
<recipe>
    <#include "../common/recipe_manifest.xml.ftl" />
    <@kt.addAllKotlinDependencies />

<!-- <#if generateLayout>
    <#include "../common/recipe_simple.xml.ftl" />
    <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
</#if> -->

    <instantiate from="root/src/app_package/CommonListActivity.${ktOrJavaExt}.ftl"
                   to="${escapeXmlAttribute(srcOut)}/${activityClass}.${ktOrJavaExt}" />

    <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.${ktOrJavaExt}" />
    
	<instantiate from="root/src/app_package/CommonAdapter.${ktOrJavaExt}.ftl"                       
		to="${escapeXmlAttribute(srcOut)}/${modelName?cap_first}Adapter.${ktOrJavaExt}" />
    <instantiate from="root/src/app_package/CommonModel.${ktOrJavaExt}.ftl"                       
        to="${escapeXmlAttribute(srcOut)}/${modelName?cap_first}Model.${ktOrJavaExt}" />
    <instantiate from="root/src/app_package/CommonListViewModel.${ktOrJavaExt}.ftl"                       
        to="${escapeXmlAttribute(srcOut)}/${modelName?cap_first}ListViewModel.${ktOrJavaExt}" />
	
    <open file="${escapeXmlAttribute(srcOut)}/${modelName?cap_first}Adapter.${ktOrJavaExt}" />

    <#if generateLayout>
    <instantiate from="root/res/layout/layout_list.xml.ftl"                       
        to="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml" />
    
    <instantiate from="root/res/layout/item_common.xml.ftl"                       
        to="${escapeXmlAttribute(resOut)}/layout/item_${modelName}.xml" />
    
    <open file="${escapeXmlAttribute(resOut)}/layout/item_${modelName}.xml" />
    </#if>
</recipe>
