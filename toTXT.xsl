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
        <xsl:text>AUTORKI DOKUMENTU:&#xA;</xsl:text>
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
        <xsl:text>&#xA;</xsl:text>
        <xsl:text>Stadion&#x9;&#x9;&#x9;&#x9;&#x9;Data&#x9;&#x9;&#x9;&#x9; Cena ulgowy&#x9; Cena normalny&#xA;</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>



     <xsl:template match="Podsumowanie">
        <xsl:text>&#xA;PODSUMOWANIE:&#xA;</xsl:text>
        <xsl:apply-templates/>
    </xsl:template>

      <xsl:template match="IlośćKlubów">
        <xsl:value-of select="concat('&#x9;', 'LICZBA KLUBÓW:', '&#x9;&#x9;&#x9;', ., '&#xA;') " />
        <xsl:call-template name="Kreska"/>
    </xsl:template>
    <xsl:template match="IlośćStadionów">
        <xsl:value-of select="concat('&#x9;', 'LICZBA STADIONÓW:', '&#x9;&#x9;', ., '&#xA;') " />
        <xsl:call-template name="Kreska"/>
    </xsl:template>
    <xsl:template match="NajmniejszyStadion">
        <xsl:value-of select="concat('&#x9;', 'Najmniejszy stadion:', '&#x9;&#x9;', ., '&#xA;') " />
        <xsl:call-template name="Kreska"/>
    </xsl:template>
 	<xsl:template match="NajwiekszyStadion">
        <xsl:value-of select="concat('&#x9;', 'Najwiekszy stadion:', '&#x9;&#x9;', ., '&#xA;') " />
        <xsl:call-template name="Kreska"/>
    </xsl:template>
    <xsl:template match="NajtanszeBiletyUlgowe">
        <xsl:value-of select="concat('&#x9;', 'Najtańsze bilety ulgowe', '&#x9;&#x9;', ., ' zł', '&#xA;') " />
        <xsl:call-template name="Kreska"/>
    </xsl:template>
    <xsl:template match="NajtanszeBiletyNormalne">
        <xsl:value-of select="concat('&#x9;', 'Najtańsze bilety normalne:', '&#x9;', ., ' zł', '&#xA;') " />
        <xsl:call-template name="Kreska"/>
    </xsl:template>

    <xsl:template match="Kluby_w_miastach">
        <xsl:text>&#x9;Liczba klubów w miastach:&#xA;</xsl:text>
        <xsl:value-of select="concat('&#x9;&#x9;', 'Manchester:', '&#x9;', ./Manchester, '&#xA;') " />
      	<xsl:value-of select="concat('&#x9;&#x9;', 'Londyn:', '&#x9;&#x9;', ./Londyn, '&#xA;') " />
        <xsl:value-of select="concat('&#x9;&#x9;', 'Liverpool:', '&#x9;', ./Liverpool, '&#xA;') " />
        <xsl:value-of select="concat('&#x9;&#x9;', 'Southampton:', '&#x9;', ./Southampton, '&#xA;') " />
        <xsl:value-of select="concat('&#x9;&#x9;', 'Bournemouth:', '&#x9;', ./Bournemouth, '&#xA;') " />
        <xsl:value-of select="concat('&#x9;&#x9;', 'WestBromwich:', '&#x9;', ./WestBromwich, '&#xA;') " />
        <xsl:value-of select="concat('&#x9;&#x9;', 'Leicester:', '&#x9;', ./Leicester, '&#xA;') " />
        <xsl:value-of select="concat('&#x9;&#x9;', 'Stoke-on-Trent:', '&#x9;', ./Stoke-on-Trent, '&#xA;') " />
        <xsl:value-of select="concat('&#x9;&#x9;', 'Swansea:', '&#x9;', ./Swansea, '&#xA;') " />
     	<xsl:value-of select="concat('&#x9;&#x9;', 'Burnley:', '&#x9;', ./Burnley, '&#xA;') " />
      	<xsl:value-of select="concat('&#x9;&#x9;', 'Watford:', '&#x9;', ./Watford, '&#xA;') " />
       	<xsl:value-of select="concat('&#x9;&#x9;', 'Brighton:', '&#x9;', ./Brighton, '&#xA;') " />
        <xsl:value-of select="concat('&#x9;&#x9;', 'Huddersfield:', '&#x9;', ./Huddersfield, '&#xA;') " />
        <xsl:value-of select="concat('&#x9;&#x9;', 'Newcastle:', '&#x9;', ./Newcastle, '&#xA;') " />
        <xsl:call-template name="Kreska"/>
        <xsl:value-of select="concat('&#x9;&#x9;', 'Liczba miast:', '&#x9;', ./CałkowitaIlośćMiast, '&#xA;') " />
        <xsl:call-template name="Kreska"/>
    </xsl:template>

        <xsl:template match="Przychod_z_biletów">
	        <xsl:text>&#x9;PRZYCHÓD Z BILETÓW:&#xA;</xsl:text>
	        <xsl:value-of select="concat('&#x9;&#x9;', 'Przychód z ulgowych (PLN):', '&#x9;&#x9;', ./PrzychódUlgowyPLN, '&#xA;') " />
	        <xsl:value-of select="concat('&#x9;&#x9;', 'Przychód z normalnych (PLN):', '&#x9;&#x9;', ./PrzychódNormalnyPLN, '&#xA;') " />
	        <xsl:value-of select="concat('&#x9;&#x9;', 'Przychód z ulgowych (GBP):', '&#x9;&#x9;', ./PrzychódUlgowyGBP, '&#xA;') " />
 	        <xsl:value-of select="concat('&#x9;&#x9;', 'Przychód z normalnych (GBP) :', '&#x9;&#x9;', ./PrzychódNormalnyGBP, '&#xA;') " />
	        <xsl:value-of select="concat('&#x9;&#x9;', 'Przychód całkowity (PLN):', '&#x9;&#x9;', ./PrzychódCalkowityWPLN, '&#xA;') " />
	        <xsl:value-of select="concat('&#x9;&#x9;', 'Przychód całkowity (GBP):', '&#x9;&#x9;', ./PrzychódCalkowityWGBP, '&#xA;') " />
	        <xsl:value-of select="concat('&#x9;&#x9;', 'Podatek:', '&#x9;&#x9;&#x9;&#x9;', ./Podatek,'&#xA;') " />
	        <xsl:value-of select="concat('&#x9;&#x9;', 'Dochód:', '&#x9;&#x9;&#x9;&#x9;&#x9;', ./Dochód, '&#xA;') " />  
	        <xsl:call-template name="Kreska"/>
   		</xsl:template>

		 <xsl:template match="DataWygenerowania">
	        <xsl:text>&#x9;DATA WYGENEROWANIA RAPORTU:&#x9;</xsl:text>
	        <xsl:value-of select="substring(.,0,11)" />
	        <xsl:text>  godz. </xsl:text>
	        <xsl:value-of select="substring(.,12,8)" />
   		 </xsl:template>

     <xsl:template name="Kreska">
        <xsl:text>&#x9;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;</xsl:text>
        <xsl:text>&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;</xsl:text>
        <xsl:text>&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;</xsl:text>
        <xsl:text>&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;</xsl:text>
        <xsl:text>&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;</xsl:text>
        <xsl:text>&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xAF;&#xA;</xsl:text>
    </xsl:template>

    	<xsl:template match="mecz">

    	<xsl:variable name="DataVAR" select="concat(substring(./dataMeczu,0,11), ' godz. ', substring(./dataMeczu,12,8),'&#x9;&#x9;&#x9;')" />	
    	<xsl:variable name="stadion" select="concat(./stadion,'                    ')"/>
    	<xsl:variable name="ulgowy" select="concat(./CenaZaBiletUlgowy,'                       ')"/>
		<xsl:value-of select="substring($stadion,0,41)" />
		<xsl:value-of select="concat(substring($DataVAR,0,26),'&#x9;')" />
		<xsl:value-of select="substring($ulgowy,0,14)" />
		<xsl:value-of select="concat('&#x9;',./CenaZaBiletNormalny,'&#xA;')" />
	</xsl:template>

</xsl:stylesheet>