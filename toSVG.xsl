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
        
    <svg:svg width="800" height="390" font-family="Verdana">
        <svg:desc>Informacje dotyczące Ligii Piłkarskiej</svg:desc>
        <svg:title>Liga piłkarska - raport </svg:title>
    
        <svg:defs>
            <svg:linearGradient id="gradient">
                <svg:stop offset="0%" style="stop-color: #c4e1b5;"/>

            </svg:linearGradient>
        </svg:defs>

        <svg:rect x="0" y="0" width="800" height="390" fill="url(#gradient)" stroke="white" stroke-width="8"/> 

        <svg:text x="430" y="55" font-size="28" fill="black" font-weight="bold" text-anchor="middle">
                Liga Piłkarska - raport
        </svg:text>

  <!--       <xsl:call-template name="Przyciski" /> -->

        <style>
            g.button:hover
            {
                opacity: 0.5;
            }

            rect.wykres_tlo:hover
            {
                fill: #575757;
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
        <svg:rect x="15" y="165" width="90" height="45" fill="#184f0b" stroke="white"/>
        <svg:text x="30" y="195" fill="white" font-size="16" >Autorzy</svg:text>
    </svg:g>
    
    <svg:g id="podpis" visibility="hidden">
        <svg:rect x="60" y="330" width="690" height="30" fill="#184f0b" stroke="black"/>
        <svg:text x="400" y="350" font-size="16" fill="white" text-anchor="middle" >
            <xsl:apply-templates/>
        </svg:text>
    </svg:g>
</xsl:template>

    
<xsl:template match="autor">
    <xsl:variable name="autor" select="concat('(', ./email, ') ', ./dane)"/>
    <xsl:value-of select="$autor"/>
</xsl:template>

<!--  <xsl:template name="Przyciski">
    <a xlink:href="biblioteka_output.xhtml" target="_blank"> 
        <svg:g class="button" cursor="pointer">
            <svg:rect x="15" y="15" width="100" height="60" fill="#C4C4C4" stroke="black"/>
            <svg:text x="38" y="40" fill="white" font-size="16">Raport</svg:text>
            <svg:text x="38" y="60" fill="white" font-size="16">XHTML</svg:text>
        </svg:g>
    </a>

    <a xlink:href="biblioteka_output.pdf" target="_blank"> 
        <svg:g class="button" cursor="pointer">
            <svg:rect x="15" y="90" width="100" height="60" fill="#C4C4C4" stroke="black"/>
            <svg:text x="38" y="115" fill="white" font-size="16">Raport</svg:text>
            <svg:text x="38" y="135" fill="white" font-size="16">PDF</svg:text>
        </svg:g>
    </a>

    <a xlink:href="biblioteka_output.xml" target="_blank"> 
        <svg:g class="button" cursor="pointer">
            <svg:rect x="15" y="240" width="100" height="60" fill="#C4C4C4" stroke="black"/>
            <svg:text x="38" y="265" fill="white" font-size="16">Raport</svg:text>
            <svg:text x="38" y="285" fill="white" font-size="16">XML</svg:text>
        </svg:g>
    </a>

    <a xlink:href="biblioteka_output.txt" target="_blank"> 
        <svg:g class="button" cursor="pointer">
            <svg:rect x="15" y="315" width="100" height="60" fill="#C4C4C4" stroke="black"/>
            <svg:text x="38" y="335" fill="white" font-size="16">Raport</svg:text>
            <svg:text x="38" y="355" fill="white" font-size="16">TXT</svg:text>
        </svg:g>
    </a>
</xsl:template> -->

</xsl:stylesheet>