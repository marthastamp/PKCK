<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="xml"
                version="1.0"
                encoding="utf-8"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" 
                doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" 
                indent="yes"/>

    <xsl:template match="/">
        <html>
            <!-- <xsl:copy-of select="document('')/xsl:stylesheet/namespace::*[not(local-name() = 'xsl')]"/> -->
            <xsl:attribute name="xml:lang">pl</xsl:attribute>
            <xsl:attribute name="lang">pl</xsl:attribute>
            <head>
                <!-- <xsl:call-template name="Metadane"/> -->
                <title>Liga Piłkarska</title>
            </head>          
            <body>
            	<h1>Initial Commit</h1>    
            	<xsl:call-template name="Proba"/>
               	<xsl:apply-templates />             
            </body>
        </html>
    </xsl:template>

    <xsl:template name="Proba">
        <xsl:element name="div">
            <xsl:attribute name="class">Linki</xsl:attribute>
            
            <xsl:element name="a">
                <xsl:attribute name="name">Linki</xsl:attribute>
            </xsl:element>
            
            <xsl:element name="a">
                <xsl:attribute name="href">#AutorzyPliku</xsl:attribute>
                <xsl:text>AUTORZY</xsl:text>
            </xsl:element>
            
            <xsl:text>&#x20;-&#x20;</xsl:text>
            
            <xsl:element name="a">
                <xsl:attribute name="href">#Raport</xsl:attribute>
                <xsl:text>RAPORT</xsl:text>
            </xsl:element>
            
            <xsl:text>&#x20;-&#x20;</xsl:text>
            
            <xsl:element name="a">
                <xsl:attribute name="href">#Podsumowanie</xsl:attribute>
                <xsl:text>PODSUMOWANIE</xsl:text>
            </xsl:element>
            
        </xsl:element>
    </xsl:template> 

       <xsl:template match="informacje">
        <xsl:element name="div">
            <xsl:attribute name="class">informacje</xsl:attribute>
            
            <xsl:element name="a">
                <xsl:attribute name="name">informacje</xsl:attribute>
            </xsl:element>
            
            <xsl:text>AUTORZY:</xsl:text>
            <xsl:apply-templates />
        </xsl:element>
        
        <xsl:call-template name="DoGóry"/>
        
    </xsl:template>

    <xsl:template name="DoGóry">
        <xsl:element name="a">
            <xsl:attribute name="class">DoGóry</xsl:attribute>
            <xsl:attribute name="href">#Linki</xsl:attribute>
            <xsl:text>Do góry</xsl:text>
        </xsl:element>
    </xsl:template>


      <xsl:template match="Przychod_z_biletów">
        <xsl:element name="div">
            <xsl:attribute name="class">Przychod_z_biletów</xsl:attribute>
            
            <xsl:element name="table">
                <xsl:attribute name="width">50%</xsl:attribute>
                
                <xsl:element name="tr">
                    <xsl:element name="th">
                        <xsl:text>PrzychódCalkowityWPLN</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>PrzychódCalkowityWGBP</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>Podatek</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>Dochód</xsl:text>
                    </xsl:element>
                </xsl:element>
                
                <xsl:element name="tr">
                    <xsl:element name="td">
                        <xsl:value-of select="./PrzychódCalkowityWPLN"/>
                    </xsl:element>
                     <xsl:element name="td">
                        <xsl:value-of select="./PrzychódCalkowityWGBP"/>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="./Podatek"/>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="./Dochód"/>
                    </xsl:element>
                </xsl:element>
                
            </xsl:element>
            
        </xsl:element>
    </xsl:template>


 <xsl:template match="mecze">
        <xsl:element name="div">
            <xsl:attribute name="class">mecze</xsl:attribute>
            
            <xsl:element name="a">
                <xsl:attribute name="name">Raport</xsl:attribute>
            </xsl:element>
            
            <xsl:element name="table">
                
                <xsl:element name="tr">
                    <xsl:element name="th">
                        <xsl:text>Stadion</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>DataMeczu</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>CenaZaBiletUlgowy</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>CenaZaBiletNormalny</xsl:text>
                    </xsl:element>
                </xsl:element>
                
                <xsl:for-each select="./mecz">
                    <xsl:sort select="./stadion"/>
                    
                    <xsl:variable name="DataVAR" 
                                  select="concat(substring(./dataMeczu,0,11), ' godz. ', substring(./dataMeczu,12,8))" />
                    
                    <xsl:element name="tr">
                        <xsl:element name="td">
                            <xsl:value-of select="./stadion"/>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:value-of select="$DataVAR"/>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:value-of select="./CenaZaBiletUlgowy"/>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:value-of select="./CenaZaBiletNormalny"/>
                        </xsl:element>
                    </xsl:element>

                </xsl:for-each>
                   
            </xsl:element>
            
        </xsl:element>
        
        <xsl:call-template name="DoGóry"/>
        
    </xsl:template>


 </xsl:stylesheet>   