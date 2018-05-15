<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns="http://www.w3.org/1999/xhtml">
    
    <xsl:output method="xml"
                version="1.0"
                encoding="utf-8"
                doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" 
                doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" 
                indent="yes"/>

    <xsl:template match="/">
        <html>
            <xsl:copy-of select="document('')/xsl:stylesheet/namespace::*[not(local-name() = 'xsl')]"/>
            <xsl:attribute name="xml:lang">pl</xsl:attribute>
            <xsl:attribute name="lang">pl</xsl:attribute>
            <head>
               <xsl:call-template name="Metadane"/>
            </head>          
            <body>
                <h1>Zadanie 3</h1>    
                <xsl:call-template name="Zadanie"/>
                <xsl:apply-templates />             
            </body>
        </html>
    </xsl:template>


<xsl:template name="Metadane">
    <xsl:element name="meta">
        <xsl:attribute name="name">
            <xsl:text>description</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="content">
            <xsl:text>Dane dotyczące ligi piłarskiej</xsl:text>
        </xsl:attribute>
    </xsl:element>
    <xsl:element name="meta">
        <xsl:attribute name="name">
            <xsl:text>author</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="content">
            <xsl:text>Martyna Jasiak, Marta Stempel</xsl:text>
        </xsl:attribute>
    </xsl:element>
    <xsl:element name="meta">
        <xsl:attribute name="http-equiv">
            <xsl:text>content-type</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="content">
            <xsl:text>text/html;charset=UTF-8</xsl:text>
        </xsl:attribute>
    </xsl:element>
    <xsl:element name="title">
        <xsl:text>liga_pilkarska_xhtml</xsl:text>
    </xsl:element>
    <xsl:element name="link">
        <xsl:attribute name="rel">
            <xsl:text>stylesheet</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="type">
            <xsl:text>text/css</xsl:text>
        </xsl:attribute>
        <xsl:attribute name="href">
            <xsl:text>style.css</xsl:text>
        </xsl:attribute>
    </xsl:element>
</xsl:template>


    <xsl:template name="Zadanie">
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

    <xsl:template match="autor">
        <xsl:element name="div">
            <xsl:attribute name="class">autor</xsl:attribute>
            <xsl:text>Imię i nazwisko: </xsl:text>
            <xsl:value-of select="./dane" />
            <xsl:text> email: </xsl:text>
            <xsl:value-of select="./email" />
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
        <fieldset>
            <xsl:element name="a">
                <xsl:attribute name="class">DoGóry</xsl:attribute>
                <xsl:attribute name="href">#Linki</xsl:attribute>
                <xsl:text>Do góry</xsl:text>
            </xsl:element>
        </fieldset>
    </xsl:template>

 
 <xsl:template match="mecze">
        <xsl:element name="div">
            <xsl:attribute name="class">mecze</xsl:attribute>
            
            <xsl:element name="a">
                <xsl:attribute name="name">Raport</xsl:attribute>
            </xsl:element>
            
             <xsl:text>RAPORT:</xsl:text>

            <xsl:element name="table">
                
                <xsl:element name="tr">
                    <xsl:element name="th">
                        <xsl:text>Stadion i pojemność</xsl:text>
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
        
      <!--   <xsl:call-template name="DoGóry"/> -->
        
    </xsl:template>

    <xsl:template match="Podsumowanie">
        <xsl:element name="div">
            <xsl:attribute name="class">Podsumowanie</xsl:attribute>
            
            <xsl:element name="a">
                <xsl:attribute name="name">Podsumowanie</xsl:attribute>
            </xsl:element>
            
            <xsl:text>PODSUMOWANIE:</xsl:text>
            <xsl:apply-templates/>
        </xsl:element>
        
     <!--    <xsl:call-template name="DoGóry"/> -->
        
    </xsl:template>


     <xsl:template match="IlośćKlubów">
        <xsl:element name="div">
            <xsl:attribute name="class">IlośćKlubów</xsl:attribute>
            
            <xsl:element name="table">
                <xsl:attribute name="width">100%</xsl:attribute>

                <xsl:element name="tr">
                    <xsl:element name="td">
                        <xsl:text>Ilość Klubów</xsl:text>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:element>
                
            </xsl:element>
            
        </xsl:element>
    </xsl:template>

     <xsl:template match="NajmniejszyStadion">
        <xsl:element name="div">
            <xsl:attribute name="class">NajmniejszyStadion</xsl:attribute>
            
            <xsl:element name="table">
                <xsl:attribute name="width">100%</xsl:attribute>

                <xsl:element name="tr">
                    <xsl:element name="td">
                        <xsl:text>Najmniejszy Stadion</xsl:text>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:element>
                
            </xsl:element>
            
        </xsl:element>
    </xsl:template>

     <xsl:template match="NajwiekszyStadion">
        <xsl:element name="div">
            <xsl:attribute name="class">NajwiekszyStadion</xsl:attribute>
            
            <xsl:element name="table">
                <xsl:attribute name="width">100%</xsl:attribute>

                <xsl:element name="tr">
                    <xsl:element name="td">
                        <xsl:text>Najwiekszy Stadion</xsl:text>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:element>
                
            </xsl:element>
            
        </xsl:element>
    </xsl:template>

         <xsl:template match="NajtanszeBiletyUlgowe">
        <xsl:element name="div">
            <xsl:attribute name="class">NajtanszeBiletyUlgowe</xsl:attribute>
            
            <xsl:element name="table">
                <xsl:attribute name="width">100%</xsl:attribute>

                <xsl:element name="tr">
                    <xsl:element name="td">
                        <xsl:text>Najtansze bilety ulgowe</xsl:text>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:element>
                
            </xsl:element>
            
        </xsl:element>
    </xsl:template>

         <xsl:template match="NajtanszeBiletyNormalne">
        <xsl:element name="div">
            <xsl:attribute name="class">NajtanszeBiletyNormalne</xsl:attribute>
            
            <xsl:element name="table">
                <xsl:attribute name="width">100%</xsl:attribute>

                <xsl:element name="tr">
                    <xsl:element name="td">
                        <xsl:text>Najtansze bilety normalne</xsl:text>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:element>
                
            </xsl:element>
            
        </xsl:element>
    </xsl:template>

    <xsl:template match="IlośćStadionów">
        <xsl:element name="div">
            <xsl:attribute name="class">IlośćStadionów</xsl:attribute>
            
            <xsl:element name="table">
                <xsl:attribute name="width">100%</xsl:attribute>

                <xsl:element name="tr">
                    <xsl:element name="td">
                        <xsl:text>Ilość Stadionów</xsl:text>
                    </xsl:element>
                    <xsl:element name="td">
                        <xsl:value-of select="."/>
                    </xsl:element>
                </xsl:element>
                
            </xsl:element>
            
        </xsl:element>
    </xsl:template>

 <xsl:template match="Kluby_w_miastach">
        <xsl:element name="div">
            <xsl:attribute name="class">Kluby_w_miastach</xsl:attribute>
            
            <xsl:element name="table">
                <xsl:attribute name="width">100%</xsl:attribute>
                
                <xsl:element name="tr">
                    <xsl:element name="th">
                        <xsl:text>Miasto</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>Ilość klubów</xsl:text>
                    </xsl:element>
                </xsl:element>
                
                <xsl:for-each select="*">
                    <xsl:element name="tr">
                        <xsl:element name="td">
                            <xsl:value-of select="name(.)"/>
                        </xsl:element>
                        <xsl:element name="td">
                            <xsl:value-of select="."/>
                        </xsl:element>
                    </xsl:element>
                </xsl:for-each>
                
                
            </xsl:element>
            
        </xsl:element>
    </xsl:template>


      <xsl:template match="Przychod_z_biletów">
        <xsl:element name="div">
            <xsl:attribute name="class">Przychod_z_biletów</xsl:attribute>
            
            <xsl:element name="table">
                <xsl:attribute name="width">100%</xsl:attribute>
                
                <xsl:element name="tr">
                    <xsl:element name="th">
                        <xsl:text>Przychód całkowity w PLN</xsl:text>
                    </xsl:element>
                    <xsl:element name="th">
                        <xsl:text>Przychód całkowity w GBP</xsl:text>
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


    <xsl:template match="DataWygenerowania">
        <xsl:element name="div">
            <xsl:attribute name="class">DataWygenerowania</xsl:attribute>
            
            <xsl:variable name="DataVAR" 
                          select="concat(substring(.,0,11), ' godz. ', substring(.,12,8))" />
            
            <xsl:text>Data wygenerowania:&#x9;</xsl:text>
            <xsl:value-of select="$DataVAR"/>
        </xsl:element>
    </xsl:template>



 </xsl:stylesheet>   