<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format">

    <xsl:output method="xml"
                encoding="utf-8"/>


<xsl:template match="/">
	<fo:root>
		<fo:layout-master-set>
		    <fo:simple-page-master master-name="LigaPilkarska"
		                           page-height="29,7cm"
		                           page-width="21cm" 
		                           margin-top="0.7cm" 
		                           margin-bottom="0.3cm" 
		                           margin-left="2.5cm" 
		                           margin-right="2.5cm">
		    <fo:region-body margin-top="2cm"/>
		    <fo:region-before extent="3cm" />
		    <fo:region-after extent="1.5cm" />
		    <fo:region-start extent="0.5cm" />
		    <fo:region-end extent="0.5cm" />
		    </fo:simple-page-master>
		</fo:layout-master-set>

	<fo:page-sequence master-reference="LigaPilkarska">
        <fo:static-content flow-name="xsl-region-before">
            <fo:block text-align="center" font-family="Times-Roman" font-size="20px" margin-bottom="5px">
                <fo:block font-weight="bold">
                    <xsl:text>Liga piłkarska - raport</xsl:text>
                </fo:block>
                <fo:block text-align="center" font-family="Segoe UI" font-size="8px">
                    <xsl:text>Data&#x20;wygenerowania:&#x20;</xsl:text>
                    <xsl:value-of select="substring(//zadanie/Podsumowanie/DataWygenerowania,1,10)"/>
                    <xsl:text>&#x20;o&#x20;godz.&#x20;</xsl:text>
                    <xsl:value-of select="substring(//zadanie/Podsumowanie/DataWygenerowania,12,5)"/>
                </fo:block>
            </fo:block>
        </fo:static-content>
        
        <fo:static-content flow-name="xsl-region-after">
            <fo:block text-align="center" font-family="Century Gothic" font-size="8px">
                <xsl:text>&#x20;Strona&#x20;</xsl:text>
                <fo:page-number />
                <xsl:text>&#x20;</xsl:text>
            </fo:block>
        </fo:static-content>
        
        <fo:flow flow-name="xsl-region-body"> 
            <xsl:apply-templates/> 
        </fo:flow>
    </fo:page-sequence>
	</fo:root>
</xsl:template>

    <xsl:template match="informacje/autorzy">
        <fo:block font-size="10px" text-align="left" font-family="Times-Roman" margin-top="2px">
            <xsl:text>Autorzy:</xsl:text>
            <xsl:apply-templates />
        </fo:block>
    </xsl:template>
    
    <xsl:template match="autor">
        <fo:block margin-left="0.5cm">
            <xsl:value-of select="./dane"/>
             <xsl:text>&#x20;</xsl:text>
            <xsl:value-of select="./email"/> 
        </fo:block>
    </xsl:template>


    <xsl:template match="mecze">
        <fo:block font-size="12px" text-align="left" font-family="Times-Roman">
            <fo:block font-size="14px" text-align="center" font-weight="bold" margin-bottom="10px">
                <xsl:text>Mecze</xsl:text>
            </fo:block>
            
            <fo:table border="solid black" width="100%" font-size="8px">
                <fo:table-header>
                    <fo:table-row>
                        <fo:table-cell border="solid black">
                            <fo:block font-weight="bold" text-align="center">
                                <xsl:text>Stadion i pojemność</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black">
                            <fo:block font-weight="bold" text-align="center">
                                <xsl:text>Data meczu</xsl:text> 
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black">
                            <fo:block font-weight="bold" text-align="center">
                                <xsl:text>Cena za bilet ulgowy</xsl:text>  
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black">
                            <fo:block font-weight="bold" text-align="center">
                                <xsl:text>Cena za bilet normalny</xsl:text> 
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
                
                <fo:table-body>
                    <xsl:for-each select="./mecz">
                        <xsl:sort select="./stadion"/>
                    
                        <xsl:variable name="DataVAR" 
                                      select="concat(substring(./dataMeczu,0,11), ' godz. ', substring(./dataMeczu,12,8))" />
                    
                        <fo:table-row>
                            <fo:table-cell border="solid black">
                                <fo:block text-align="center"> 
                                    <xsl:value-of select="./stadion" />
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid black">
                                <fo:block text-align="center">
                                    <xsl:value-of select="$DataVAR" />
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid black">
                                <fo:block text-align="center">
                                    <xsl:value-of select="./CenaZaBiletUlgowy" />
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid black">
                                <fo:block text-align="center">
                                    <xsl:value-of select="./CenaZaBiletNormalny" />
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </xsl:for-each>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>

 
    <xsl:template match="Podsumowanie">
        <fo:block font-size="12px" text-align="left" font-family="Times-Roman">
            <fo:block font-size="14px" text-align="center" font-weight="bold" margin-bottom="10px" margin-top="10px">
                <xsl:text>Podsumowanie</xsl:text>
            </fo:block>
            
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

     <xsl:template match="IlośćKlubów">
    
        <fo:block font-family="Times-Roman" margin="0 auto" width="100%" margin-top="10px" margin-bottom="1px">
            <fo:table width="50%" font-size="8px">
            
                <fo:table-header>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
                
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell border="none">
                            <fo:block text-align="center"> 
                                <xsl:text>Liczba&#x20;klubów</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center"> 
                                <xsl:value-of select="." />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>

     <xsl:template match="IlośćStadionów">
    
        <fo:block font-family="Times-Roman" margin-top="1px" margin-bottom="1px">
            <fo:table width="50%" font-size="8px">
            
                <fo:table-header>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
                
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell border="none">
                            <fo:block text-align="center"> 
                                <xsl:text>Liczba&#x20;stadionów</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center"> 
                                <xsl:value-of select="." />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>

    <xsl:template match="NajmniejszyStadion">
    
        <fo:block font-family="Times-Roman" margin-top="1px" margin-bottom="1px">
            <fo:table width="50%" font-size="8px">
            
                <fo:table-header>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
                
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell border="none">
                            <fo:block text-align="center"> 
                                <xsl:text>Najmniejszy&#x20;stadion</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center"> 
                                <xsl:value-of select="." />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>

     <xsl:template match="NajwiekszyStadion">
    
        <fo:block font-family="Times-Roman" margin-top="1px" margin-bottom="1px">
            <fo:table width="50%" font-size="8px">
            
                <fo:table-header>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
                
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell border="none">
                            <fo:block text-align="center"> 
                                <xsl:text>Najwiekszy&#x20;stadion</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center"> 
                                <xsl:value-of select="." />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>

 <xsl:template match="NajtanszeBiletyUlgowe">
    
        <fo:block font-family="Times-Roman" margin-top="1px" margin-bottom="1px">
            <fo:table width="50%" font-size="8px">
            
                <fo:table-header>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
                
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell border="none">
                            <fo:block text-align="center"> 
                                <xsl:text>Najtansze&#x20;bilety&#x20;ulgowe</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center"> 
                                <xsl:value-of select="." />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>

 <xsl:template match="NajtanszeBiletyNormalne">
    
        <fo:block font-family="Times-Roman" margin-top="1px" margin-bottom="1px">
            <fo:table width="50%" font-size="8px">
            
                <fo:table-header>
                    <fo:table-row>
                        <fo:table-cell>
                            <fo:block>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
                
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell border="none">
                            <fo:block text-align="center"> 
                                <xsl:text>Najtansze&#x20;bilety&#x20;normalne</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="none">
                            <fo:block text-align="center"> 
                                <xsl:value-of select="." />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>

     <xsl:template match="Kluby_w_miastach">
    
        <fo:block font-family="Times-Roman" margin-top="20px" margin-bottom="10px">
            <fo:table width="50%" font-size="8px">
            
                <fo:table-header>
                    <fo:table-row>
                        <fo:table-cell border="solid black">
                            <fo:block text-align="center" font-weight="bold">
                                <xsl:text>Nazwa miasta</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black">
                            <fo:block text-align="center" font-weight="bold">
                                <xsl:text>Liczba klubów</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
                
                <fo:table-body>
                
                    <xsl:for-each select="*">
                        <fo:table-row>
                            <fo:table-cell border="solid black">
                                <fo:block text-align="center"> 
                                    <xsl:value-of select="name(.)" />
                                </fo:block>
                            </fo:table-cell>
                            <fo:table-cell border="solid black">
                                <fo:block text-align="center"> 
                                    <xsl:value-of select="." />
                                </fo:block>
                            </fo:table-cell>
                        </fo:table-row>
                    </xsl:for-each>
                
                    
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>

     <xsl:template match="Przychod_z_biletów">
    
        <fo:block font-family="Times-Roman" margin-top="25px" margin-bottom="10px">
            <fo:table width="100%" font-size="8px">
            
                <fo:table-header>
                    <fo:table-row>
                        <fo:table-cell border="solid black">
                            <fo:block text-align="center" font-weight="bold">
                                <xsl:text>Przychod z biletow ulgowych (PLN)</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black">
                            <fo:block text-align="center" font-weight="bold">
                                <xsl:text>Przychod z biletow normalnych (PLN)</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black">
                            <fo:block text-align="center" font-weight="bold">
                                <xsl:text>Przychod z biletow ulgowych (GBP)</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black">
                            <fo:block text-align="center" font-weight="bold">
                                <xsl:text>Przychod z biletow normalnych (GBP)</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black">
                            <fo:block text-align="center" font-weight="bold">
                                <xsl:text>Przychod calkowity (PLN)</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black">
                            <fo:block text-align="center" font-weight="bold">
                                <xsl:text>Przychod calkowity (GBP)</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black">
                            <fo:block text-align="center" font-weight="bold">
                                <xsl:text>Podatek</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black">
                            <fo:block text-align="center" font-weight="bold">
                                <xsl:text>Dochod</xsl:text>
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                </fo:table-header>
                
                <fo:table-body>
                    <fo:table-row>
                        <fo:table-cell border="solid black">
                            <fo:block text-align="center"> 
                                <xsl:value-of select="./PrzychódUlgowyPLN" />
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black">
                            <fo:block text-align="center"> 
                                <xsl:value-of select="./PrzychódNormalnyPLN" />
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black">
                            <fo:block text-align="center"> 
                                <xsl:value-of select="./PrzychódUlgowyGBP" />
                            </fo:block>
                        </fo:table-cell>
                        <fo:table-cell border="solid black">
                            <fo:block text-align="center"> 
                                <xsl:value-of select="./PrzychódNormalnyGBP" />
                            </fo:block>
                        </fo:table-cell>
                          <fo:table-cell border="solid black">
                            <fo:block text-align="center"> 
                                <xsl:value-of select="./PrzychódCalkowityWPLN" />
                            </fo:block>
                        </fo:table-cell>
                          <fo:table-cell border="solid black">
                            <fo:block text-align="center"> 
                                <xsl:value-of select="./PrzychódCalkowityWGBP" />
                            </fo:block>
                        </fo:table-cell>
                           <fo:table-cell border="solid black">
                            <fo:block text-align="center"> 
                                <xsl:value-of select="./Podatek" />
                            </fo:block>
                        </fo:table-cell>
                           <fo:table-cell border="solid black">
                            <fo:block text-align="center"> 
                                <xsl:value-of select="./Dochód" />
                            </fo:block>
                        </fo:table-cell>
                    </fo:table-row>
                    
                </fo:table-body>
            </fo:table>
        </fo:block>
    </xsl:template>

        <xsl:template match="DataWygenerowania"/>

</xsl:stylesheet>