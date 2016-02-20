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

	<section class="weather">
		<xsl:apply-templates select="response/hourly_forecast"/>
	</section>
    </body>
  </html>
</xsl:template>



<xsl:template name="temperature">
	<p class="temp"><xsl:value-of select="temp/metric"/>°<span class="feel"><xsl:value-of select="feelslike/metric"/>°</span></p>	
</xsl:template>

<xsl:template match="temp">
<!--	<p>Température <xsl:value-of select="metric"/>°</p>-->
</xsl:template>
<xsl:template match="feelslike">
<!--	<p>Température ressentie : <xsl:value-of select="metric"/>°</p>-->
</xsl:template>



<xsl:template match="FCTTIME">
	<p>
		<!--<xsl:value-of select="hour"/>:<xsl:value-of select="min"/>:<xsl:value-of select="sec"/> le <xsl:value-of select="mday"/>/<xsl:value-of select="mon_padded"/>-->	<xsl:value-of select="hour"/> h
	</p>
</xsl:template>

<xsl:template match="pop">
	<p class="precip"><xsl:value-of select="."/>%</p>
</xsl:template>

<xsl:template match="forecast">
	<article>
		<xsl:apply-templates select="FCTTIME"/>
		<article>
			<xsl:call-template name="temperature"/>
			<xsl:apply-templates/>
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

<xsl:template match="humidity">
	<p class="humid"> <xsl:value-of select="."/>%</p>
</xsl:template>

<xsl:template match="snow">
	<xsl:if test="metric &gt; 0">
	<p>Neige : <xsl:value-of select="metric"/>%</p>
	</xsl:if>
</xsl:template>

<xsl:template match="mslp">
	<p class="pression"><xsl:value-of select="metric"/></p>
</xsl:template>

<xsl:template match="icon|english|wx|fctcode|sky|heatindex|dewpoint|qpf"/>

<xsl:template match="uvi"/><!-- indice d'uv-->
<xsl:template match="condition"/><!-- -->
<xsl:template match="wspd|windchill|wdir" /><!-- vent -->
</xsl:stylesheet>
