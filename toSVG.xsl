<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:svg="http://www.w3.org/2000/svg" 
                xmlns="http://www.w3.org/2000/svg" 
                xmlns:xlink="http://www.w3.org/1999/xlink">
    
    <xsl:output method="xml" 
                media-type="image/svg" 
                encoding="utf-8" 
                indent="yes"
                doctype-public="-//W3C//DTD SVG 1.1//EN"
                doctype-system="http://www.w3.org/TR/2001/REC-SVG-20010904/DTD/svg10.dtd"/>


<xsl:template match="/">
        
    <svg:svg width="850" height="450" font-family="Verdana">
        <svg:desc>Informacje dotyczące Ligii Piłkarskiej</svg:desc>
        <svg:title>Liga piłkarska - raport </svg:title>
    
        <svg:defs>
            <svg:linearGradient id="gradient">
                <svg:stop offset="0%" style="stop-color: #c4e1b5;"/>

            </svg:linearGradient>
        </svg:defs>

        <svg:rect x="0" y="0" width="1350" height="450" fill="url(#gradient)" stroke="white" stroke-width="8"/> 

        <svg:text x="425" y="55" font-size="28" fill="black" font-weight="bold" text-anchor="middle">
                Liga Piłkarska - raport
        </svg:text>

        <xsl:call-template name="Przyciski" /> 

        <style>
            g.button:hover
            {
                opacity: 0.7;
            }

            rect.wykres_tlo:hover
            {
                fill: #f2f2f2;
            }
        </style>

        <script type="text/javascript"> 
            <![CDATA[
            function onClickAutorzyPliku(evt) {
                var element = document.getElementById("podpis");
                var atrybut = element.getAttribute("visibility");

                if(atrybut === "visible"){
                    element.setAttribute("visibility", "hidden");
                }else{
                    element.setAttribute("visibility", "visible");
                }

            }]]>
        </script>

        <script type="text/javascript"> 
            <![CDATA[
            function onMouseOverWykres(evt) {
                document.getElementById("figure").setAttribute("visibility", "visible");
            }]]>
        </script>

        <script type="text/javascript">
            <![CDATA[
            function onMouseOutWykres(evt) {
                document.getElementById("figure").setAttribute("visibility", "hidden");
            }]]>
        </script>

        <xsl:apply-templates/>
    </svg:svg>  
</xsl:template>
    

<xsl:template match="informacje">
    <svg:g id="autorzy_pliku" class="button" width="90" height="45" onclick="onClickAutorzyPliku(evt)" cursor="pointer">
        <svg:rect rx="20" ry="20" x="15" y="190" width="90" height="45" fill="#184f0b" stroke="white"/>
        <svg:text x="30" y="215" fill="white" font-size="16" >Autorzy</svg:text>
    </svg:g>
    
    <svg:g id="podpis" visibility="hidden">
        <svg:rect rx="20" ry="20" x="125" y="400" width="690" height="30" fill="#184f0b" stroke="white"/>
        <svg:text x="470" y="420" font-size="16" fill="white" text-anchor="middle" >
            <xsl:apply-templates/>
        </svg:text>
    </svg:g>
</xsl:template>

    
<xsl:template match="autor">
    <xsl:variable name="autor" select="concat('(', ./email, ') ', ./dane)"/>
    <xsl:value-of select="$autor"/>
</xsl:template>

<xsl:template match="Kluby_w_miastach">
    <svg:g id="rect"  onmouseover="onMouseOverWykres(evt)" onmouseout="onMouseOutWykres(evt)">
        <svg:rect class="wykres_tlo" x="130" y="90" height="250" width="600" fill="#FFFFFF" stroke="black"/>
        <svg:text x="425" y="130" font-size="16" fill="green" font-weight="bold" text-anchor="middle">
            Liczba klubów w danym mieście
        </svg:text>
    </svg:g>

    <svg:text x="140" y="320" font-size="11" fill="#003366" font-weight="bold">Manchester</svg:text>
    <svg:text x="230" y="320" font-size="11" fill="#003366" font-weight="bold">Londyn</svg:text>
    <svg:text x="305" y="320" font-size="11" fill="#003366" font-weight="bold">Liverpool</svg:text>
    <svg:text x="385" y="320" font-size="11" fill="#003366" font-weight="bold">Leicester</svg:text>
    <svg:text x="465" y="320" font-size="11" fill="#003366" font-weight="bold">Swansea</svg:text>
    <svg:text x="550" y="320" font-size="11" fill="#003366" font-weight="bold">Burnley</svg:text>
    <svg:text x="613" y="320" font-size="11" fill="#003366" font-weight="bold">Liczba miast</svg:text>


    <svg:g id="figure" visibility="hidden">
        
        <xsl:for-each select="*">
            <xsl:variable name="x_pozycja" select="170 + (79 * (position() - 1))"/>
            <xsl:variable name="y_pozycja" select="290 - (. * 7.5)"/>
            
            <xsl:element name="svg:text">
                <xsl:attribute name="x">
                    <xsl:value-of select="$x_pozycja"/>
                </xsl:attribute>
                <xsl:attribute name="y">
                    <xsl:value-of select="$y_pozycja"/>
                </xsl:attribute>
                <xsl:attribute name="fill">#003366</xsl:attribute>
                <xsl:attribute name="font-size">11</xsl:attribute>
                <xsl:attribute name="font-weight">bold</xsl:attribute>
                <xsl:value-of select="."/>
            </xsl:element>
            
            <svg:g visibility="visible">
                <xsl:element name="svg:rect">
                    <xsl:attribute name="fill">#4d004d</xsl:attribute>
                    <xsl:attribute name="x">
                        <xsl:value-of select="$x_pozycja - 5"/>
                    </xsl:attribute>
                    <xsl:attribute name="width">25</xsl:attribute>

                    <svg:animate attributeName="y" from="300" to="{300 - . * 7.5}" dur="3s" fill="freeze"/>
                    <svg:animate attributeName="height" from="1" to="{. * 7.5}" dur="3s" fill="freeze"/>
                </xsl:element>
            </svg:g>
            
        </xsl:for-each>
        
    </svg:g>
</xsl:template>


<xsl:template name="Przyciski">
    <a xlink:href="C:/Users/Martyna/Desktop/Studia/SEMVI/PKCK/zad1/PKCK/XHTML_output.xhtml" target="_blank"> 
        <svg:g class="button" cursor="pointer">
            <svg:rect rx="20" ry="20" x="15" y="15" width="100" height="45" fill="#184f0b" stroke="white"/>
            <svg:text x="38" y="40" fill="white" font-size="16">XHTML</svg:text>
        </svg:g>
    </a>

    <a xlink:href="PDF_output.pdf" target="_blank"> 
        <svg:g class="button" cursor="pointer">
            <svg:rect rx="20" ry="20" x="15" y="90" width="100" height="45" fill="#184f0b" stroke="white"/>
            <svg:text x="45" y="115" fill="white" font-size="16">PDF</svg:text>
        </svg:g>
    </a>

    <a xlink:href="XMLoutput.xml" target="_blank"> 
        <svg:g class="button" cursor="pointer">
            <svg:rect rx="20" ry="20" x="15" y="315" width="100" height="45" fill="#184f0b" stroke="white"/>
            <svg:text x="45" y="340" fill="white" font-size="16">XML</svg:text>
        </svg:g>
    </a>

    <a xlink:href="TXT_output.txt" target="_blank"> 
        <svg:g class="button" cursor="pointer">
            <svg:rect rx="20" ry="20" x="15" y="390" width="100" height="45" fill="#184f0b" stroke="white"/>
            <svg:text x="45" y="420" fill="white" font-size="16">TXT</svg:text>
        </svg:g>
    </a>
</xsl:template> 

</xsl:stylesheet>