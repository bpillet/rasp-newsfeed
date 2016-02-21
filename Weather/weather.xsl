<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema">
    
<xsl:template match="/">
  <html>
    <head>
       <meta charset="utf-8"/>
       <meta http-equiv="refresh" content="60" />
       <link rel="stylesheet" media="screen and (min-width: 400px) and (max-width: 1000024px)" href="./style.css" type="text/css" />
       
        <title>Météo</title>
       
    </head>
    <body>  

	<section id="weather">
		<div id="timeline"/>
		<xsl:apply-templates select="response/hourly_forecast"/>
	</section>
    </body>
  </html>
</xsl:template>


<xsl:template match="forecast">
	<article>
		<xsl:apply-templates select="FCTTIME"/>
		<article>
			<xsl:call-template name="temperature"/>
			<xsl:apply-templates select="./*[not(self::FCTTIME)]"/>
			<xsl:call-template name="vent"/>
		</article>
	</article>
</xsl:template>

<xsl:template match="icon_url">
	<img>
		<xsl:attribute name="src">
    		<xsl:value-of select="." />
  		</xsl:attribute>
	</img>
</xsl:template>

<xsl:template name="temperature">
	<xsl:variable name="temp" select="temp/metric"/>
	<xsl:variable name="feel" select="feelslike/metric"/>
	<p class="temp"><xsl:value-of select="number($temp)"/>°<span class="feel"><xsl:value-of select="number($feel)"/>°</span></p>	
</xsl:template>

<xsl:template match="FCTTIME">
	<p>
		<!--<xsl:value-of select="hour"/>:<xsl:value-of select="min"/>:<xsl:value-of select="sec"/> le <xsl:value-of select="mday"/>/<xsl:value-of select="mon_padded"/>-->	<xsl:value-of select="hour"/> h
	</p>
</xsl:template>

<xsl:template match="pop">
	<p class="precip"><xsl:value-of select="."/>%</p>
</xsl:template>

<xsl:template match="humidity">
	<p class="humid"> <xsl:value-of select="."/>%</p>
</xsl:template>

<xsl:template match="snow">
	<xsl:if test="metric &gt; 0">
		<p class="neige"><xsl:value-of select="metric"/>%</p>
	</xsl:if>
</xsl:template>

<xsl:template name="vent">
	<xsl:variable name="vitesse" select="wspd/metric"/>
	<xsl:variable name="angle" select="wdir/degrees"/>
	<xsl:element name="p">
		<xsl:attribute name="style">
			font-size: <xsl:value-of select=".8 + $vitesse*0.07"/>em;
		</xsl:attribute>
		<xsl:element name="span">
			<xsl:attribute name="class">vent</xsl:attribute>
			<xsl:attribute name="style">
				-webkit-transform: rotate(<xsl:value-of select="$angle"/>deg);
  				-moz-transform: rotate(<xsl:value-of select="$angle"/>deg);
  				-ms-transform: rotate(<xsl:value-of select="$angle"/>deg);
  				-o-transform: rotate(<xsl:value-of select="$angle"/>deg);
  				transform: rotate(<xsl:value-of select="$angle"/>deg);
			</xsl:attribute>
			&#61617;
		</xsl:element>
		<xsl:value-of select="wspd/metric"/>
	</xsl:element>
</xsl:template>
<xsl:template match="wspd|windchill|wdir" /><!-- vent -->

<!-- NULL -->

<xsl:template match="mslp">
<!--	<p class="pression"><xsl:value-of select="metric"/></p>-->
</xsl:template>

<xsl:template match="temp">
<!--	<p>Température <xsl:value-of select="metric"/>°</p>-->
</xsl:template>
<xsl:template match="feelslike">
<!--	<p>Température ressentie : <xsl:value-of select="metric"/>°</p>-->
</xsl:template>

<xsl:template match="icon|english|wx|fctcode|sky|heatindex|dewpoint|qpf"/>

<xsl:template match="uvi"/><!-- indice d'uv-->
<xsl:template match="condition"/><!-- nom de l'état du ciel -->
</xsl:stylesheet>
