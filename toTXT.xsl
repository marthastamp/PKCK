<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text"
                encoding="UTF-8"/>


   <xsl:template match="text()">
        <xsl:if test="normalize-space(.)">
            <xsl:value-of select="concat(normalize-space(.), '')"/>
        </xsl:if>
        <xsl:apply-templates/>
    </xsl:template>

  <xsl:template match="/">
        <xsl:apply-templates/>
    </xsl:template>
    
    <xsl:template match="informacje/autorzy">
        <xsl:text>AUTORZY DOKUMENTU:&#xA;</xsl:text>
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="autor">
        <xsl:text>&#x9;[</xsl:text>
        <xsl:value-of select="./email" />
        <xsl:text>] </xsl:text>
        <xsl:value-of select="./dane" />
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>

      <xsl:template match="mecze">
        <xsl:text>&#xA;MECZE:&#xA;</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>

        <xsl:template match="mecz">
        <xsl:variable name="DataVAR" select="concat(substring(./dataMeczu,0,11), ' godz. ', substring(./dataMeczu,12,8))" />
        
        <xsl:value-of select="concat('&#x9;', 'Stadion:', '&#x9;', ./stadion, '&#xA;') " />
        <xsl:value-of select="concat('&#x9;', 'Data meczu.:', '&#x9;', $DataVAR, '&#xA;') " />
        <xsl:value-of select="concat('&#x9;', 'Cena za bilet ulgowy:', '&#x9;&#x9;', ./CenaZaBiletUlgowy, '&#xA;') " />
        <xsl:value-of select="concat('&#x9;', 'Cena za bilet normalny:', '&#x9;&#x9;', ./CenaZaBiletNormalny, '&#xA;') " />
        <xsl:text>&#x9;----------------------------------------------------------------------&#xA;</xsl:text>
    </xsl:template>


</xsl:stylesheet>