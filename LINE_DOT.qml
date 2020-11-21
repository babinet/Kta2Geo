<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis labelsEnabled="0" simplifyDrawingTol="1" hasScaleBasedVisibilityFlag="0" simplifyAlgorithm="0" simplifyMaxScale="1" readOnly="0" styleCategories="AllStyleCategories" maxScale="0" simplifyLocal="1" version="3.16.0-Hannover" simplifyDrawingHints="1" minScale="100000000">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <temporal startField="" accumulate="0" fixedDuration="0" enabled="0" endExpression="" durationField="" mode="0" endField="" startExpression="" durationUnit="min">
    <fixedRange>
      <start></start>
      <end></end>
    </fixedRange>
  </temporal>
  <renderer-v2 enableorderby="0" type="singleSymbol" symbollevels="0" forceraster="0">
    <symbols>
      <symbol force_rhr="0" name="0" type="line" alpha="1" clip_to_extent="1">
        <layer class="SimpleLine" pass="0" enabled="1" locked="0">
          <prop v="0" k="align_dash_pattern"/>
          <prop v="round" k="capstyle"/>
          <prop v="0.66;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MM" k="customdash_unit"/>
          <prop v="0" k="dash_pattern_offset"/>
          <prop v="3x:0,0,0,0,0,0" k="dash_pattern_offset_map_unit_scale"/>
          <prop v="MM" k="dash_pattern_offset_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="round" k="joinstyle"/>
          <prop v="0,0,0,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="0.66" k="line_width"/>
          <prop v="MM" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="tweak_dash_pattern_on_corners"/>
          <prop v="1" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <customproperties>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer attributeLegend="1" diagramType="Histogram">
    <DiagramCategory lineSizeScale="3x:0,0,0,0,0,0" showAxis="1" maxScaleDenominator="1e+08" labelPlacementMethod="XHeight" spacing="5" height="15" lineSizeType="MM" spacingUnit="MM" opacity="1" penWidth="0" sizeScale="3x:0,0,0,0,0,0" diagramOrientation="Up" spacingUnitScale="3x:0,0,0,0,0,0" scaleBasedVisibility="0" backgroundAlpha="255" enabled="0" sizeType="MM" minimumSize="0" scaleDependency="Area" backgroundColor="#ffffff" barWidth="5" penAlpha="255" rotationOffset="270" direction="0" minScaleDenominator="0" penColor="#000000" width="15">
      <fontProperties description=".AppleSystemUIFont,13,-1,5,50,0,0,0,0,0" style=""/>
      <attribute label="" field="" color="#000000"/>
      <axisSymbol>
        <symbol force_rhr="0" name="" type="line" alpha="1" clip_to_extent="1">
          <layer class="SimpleLine" pass="0" enabled="1" locked="0">
            <prop v="0" k="align_dash_pattern"/>
            <prop v="square" k="capstyle"/>
            <prop v="5;2" k="customdash"/>
            <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
            <prop v="MM" k="customdash_unit"/>
            <prop v="0" k="dash_pattern_offset"/>
            <prop v="3x:0,0,0,0,0,0" k="dash_pattern_offset_map_unit_scale"/>
            <prop v="MM" k="dash_pattern_offset_unit"/>
            <prop v="0" k="draw_inside_polygon"/>
            <prop v="bevel" k="joinstyle"/>
            <prop v="35,35,35,255" k="line_color"/>
            <prop v="solid" k="line_style"/>
            <prop v="0.26" k="line_width"/>
            <prop v="MM" k="line_width_unit"/>
            <prop v="0" k="offset"/>
            <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
            <prop v="MM" k="offset_unit"/>
            <prop v="0" k="ring_filter"/>
            <prop v="0" k="tweak_dash_pattern_on_corners"/>
            <prop v="0" k="use_custom_dash"/>
            <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
            <data_defined_properties>
              <Option type="Map">
                <Option name="name" type="QString" value=""/>
                <Option name="properties"/>
                <Option name="type" type="QString" value="collection"/>
              </Option>
            </data_defined_properties>
          </layer>
        </symbol>
      </axisSymbol>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings showAll="1" priority="0" placement="2" dist="0" obstacle="0" linePlacementFlags="18" zIndex="0">
    <properties>
      <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <legend type="default-vector"/>
  <referencedLayers/>
  <fieldConfiguration>
    <field configurationFlags="None" name="OldNum">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="Post1962">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="NouvNum">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="CentroidX">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field configurationFlags="None" name="CentroidY">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" name="" field="OldNum"/>
    <alias index="1" name="" field="Post1962"/>
    <alias index="2" name="" field="NouvNum"/>
    <alias index="3" name="" field="CentroidX"/>
    <alias index="4" name="" field="CentroidY"/>
  </aliases>
  <defaults>
    <default expression="" applyOnUpdate="0" field="OldNum"/>
    <default expression="" applyOnUpdate="0" field="Post1962"/>
    <default expression="" applyOnUpdate="0" field="NouvNum"/>
    <default expression="" applyOnUpdate="0" field="CentroidX"/>
    <default expression="" applyOnUpdate="0" field="CentroidY"/>
  </defaults>
  <constraints>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="OldNum" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="Post1962" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="NouvNum" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="CentroidX" unique_strength="0"/>
    <constraint constraints="0" notnull_strength="0" exp_strength="0" field="CentroidY" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="OldNum"/>
    <constraint exp="" desc="" field="Post1962"/>
    <constraint exp="" desc="" field="NouvNum"/>
    <constraint exp="" desc="" field="CentroidX"/>
    <constraint exp="" desc="" field="CentroidY"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortOrder="0" sortExpression="">
    <columns>
      <column width="-1" name="OldNum" hidden="0" type="field"/>
      <column width="-1" name="Post1962" hidden="0" type="field"/>
      <column width="-1" name="NouvNum" hidden="0" type="field"/>
      <column width="-1" name="CentroidX" hidden="0" type="field"/>
      <column width="-1" name="CentroidY" hidden="0" type="field"/>
      <column width="-1" hidden="1" type="actions"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1"></editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
Les formulaires QGIS peuvent avoir une fonction Python qui sera appelée à l'ouverture du formulaire.

Utilisez cette fonction pour ajouter plus de fonctionnalités à vos formulaires.

Entrez le nom de la fonction dans le champ "Fonction d'initialisation Python".
Voici un exemple à suivre:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
    geom = feature.geometry()
    control = dialog.findChild(QWidget, "MyLineEdit")

]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field editable="1" name="CentroidX"/>
    <field editable="1" name="CentroidY"/>
    <field editable="1" name="NouvNum"/>
    <field editable="1" name="OldNum"/>
    <field editable="1" name="Post1962"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="CentroidX"/>
    <field labelOnTop="0" name="CentroidY"/>
    <field labelOnTop="0" name="NouvNum"/>
    <field labelOnTop="0" name="OldNum"/>
    <field labelOnTop="0" name="Post1962"/>
  </labelOnTop>
  <dataDefinedFieldProperties/>
  <widgets/>
  <previewExpression>"CentroidX"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
