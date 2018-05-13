<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    
 <xsl:output method="xml"
                version="1.0"
                encoding="UTF-8"
                media-type="text/xml"
                omit-xml-declaration="no"
                indent="yes"/>
                

              <!--   DEFINICJA KLUCZY -->
<xsl:key name="klubIdKEY" match="//liga_piłkarska/kluby/klub" use="@klubId"/>
<xsl:key name="stadionIdKEY" match="//liga_piłkarska/stadiony/stadion" use="@stadionId"/>

<xsl:template match="/">
		<xsl:element name="zadanie">
			<xsl:call-template name="informacje"/>
			<xsl:apply-templates select="zadanie/liga_piłkarska/mecze"/>
			<xsl:call-template name="Podsumowanie"/>
		</xsl:element>
	</xsl:template>    
    
<xsl:template match="kluby"/>
<xsl:template match="stadiony"/>   


<xsl:template match="//informacje" name="informacje">
		<xsl:copy-of select="//informacje"/>
	</xsl:template>    
			
<xsl:template match="zadanie/liga_piłkarska/mecze">
		<xsl:element name="mecze">
			<xsl:apply-templates select="mecz"/>
		</xsl:element>
	</xsl:template>


<xsl:template match="zadanie/liga_piłkarska/mecze/mecz">
		<xsl:element name="mecz">
			<xsl:variable name="klubVAR" select="key('klubIdKEY', @klubId)"/>
			<xsl:variable name="stadionVAR" select="key('stadionIdKEY', @stadionId)"/>
			<xsl:element name="stadion">
				<xsl:value-of select="concat($stadionVAR/nazwa, ' pojemność: ', $stadionVAR/pojemność)"/>
			</xsl:element>
			<xsl:element name="dataMeczu">
				<xsl:value-of select="data"/>
			</xsl:element>
			<xsl:element name="CenaZaBiletUlgowy">
						<xsl:value-of select="concat($stadionVAR/ulgowy, ' ',$stadionVAR/ulgowy/@waluta )"/>
			</xsl:element> 
			<xsl:element name="CenaZaBiletNormalny">
						<xsl:value-of select="concat($stadionVAR/ulgowy, ' ',$stadionVAR/normalny/@waluta )"/>
			</xsl:element> 
		</xsl:element>
</xsl:template>			

<xsl:template name="Podsumowanie">
	<xsl:element name="Podsumowanie">
		<xsl:element name="IlośćKlubów">
			<xsl:value-of select="count(//liga_piłkarska/kluby/klub)"/>
		</xsl:element>
		<xsl:element name="IlośćStadionów">
			<xsl:value-of select="count(//liga_piłkarska/kluby/klub/stadion)"/>
		</xsl:element>	
		<xsl:element name="NajmniejszyStadion">
			<xsl:value-of select="min(//liga_piłkarska/stadiony/stadion/pojemność)"/>
		</xsl:element>
		<xsl:element name="NajwiekszyStadion">
			<xsl:value-of select="max(//liga_piłkarska/stadiony/stadion/pojemność)"/>
		</xsl:element>
		<xsl:element name="NajtanszeBiletyUlgowe">
			<xsl:value-of select="format-number(min(//liga_piłkarska/stadiony/stadion/ulgowy), '.##')"/>
		</xsl:element>
		<xsl:element name="NajtanszeBiletyNormalne">
			<xsl:value-of select="format-number(min(//liga_piłkarska/stadiony/stadion/normalny), '.##')"/>
		</xsl:element>



		<Kluby_w_miastach>
			<xsl:element name="Manchester">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Manchester'])"/>
			</xsl:element>
			<xsl:element name="Londyn">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Londyn'])"/>
			</xsl:element>
			<xsl:element name="Liverpool">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Liverpool'])"/>
			</xsl:element>
			<xsl:element name="Southampton">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Southampton'])"/>
			</xsl:element>
			<xsl:element name="Bournemouth">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Bournemouth'])"/>
			</xsl:element>
			<xsl:element name="WestBromwich">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='West Bromwich'])"/>
			</xsl:element>
			<xsl:element name="Leicester">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Leicester'])"/>
			</xsl:element>
			<xsl:element name="Stoke-on-Trent">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Stoke-on-Trent'])"/>
			</xsl:element>
			<xsl:element name="Swansea">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Swansea'])"/>
			</xsl:element>
			<xsl:element name="Burnley">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Burnley'])"/>
			</xsl:element>
			<xsl:element name="Watford">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Watford'])"/>
			</xsl:element>
			<xsl:element name="Newcastle">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Newcastle'])"/>
			</xsl:element>
			<xsl:element name="Brighton">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Brighton'])"/>
			</xsl:element>
			<xsl:element name="Huddersfield">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub[miasto='Huddersfield'])"/>
			</xsl:element>
			<xsl:element name="CałkowitaIlośćMiast">
				<xsl:value-of select="count(//liga_piłkarska/kluby/klub/miasto)"/>
			</xsl:element>
		</Kluby_w_miastach>
		

		<xsl:variable name="PrzelicznikGBP" select="3.90"/>

		<xsl:element name="Przychod_z_biletów">
			
				<xsl:variable name="PrzychódUlgowyGBP" select="sum(//ulgowy[@waluta='GBP'])"/>
				<xsl:variable name="PrzychódNormalnyGBP" select="sum(//normalny[@waluta='GBP'])"/>
				<xsl:variable name="PrzychódUlgowyPLN" select="sum(//ulgowy[@waluta='PLN'])"/>
				<xsl:variable name="PrzychódNormalnyPLN" select="sum(//normalny[@waluta='PLN'])"/>
				<xsl:variable name="PrzychódNormalnyGBPnaPLN" select="sum(//normalny[@waluta='GBP']) * $PrzelicznikGBP"/>
				<xsl:variable name="PrzychódUlgowyGBPnaPLN" select="sum(//ulgowy[@waluta='GBP']) * $PrzelicznikGBP"/>
				<xsl:variable name="PrzychodCałkowityPLN" select="$PrzychódUlgowyPLN + $PrzychódNormalnyPLN + $PrzychódUlgowyGBPnaPLN + $PrzychódNormalnyGBPnaPLN"/>
				<xsl:variable name="PrzychodCałkowityGBP" select="$PrzychódUlgowyGBP + $PrzychódNormalnyGBP"/>

				<xsl:element name="PrzychódUlgowyPLN">
					<xsl:value-of select="format-number($PrzychódUlgowyPLN,'.##')"/>
					<xsl:text> zł</xsl:text>
				</xsl:element>
				<xsl:element name="PrzychódNormalnyPLN">
					<xsl:value-of select="format-number($PrzychódNormalnyPLN,'.##')"/>
					<xsl:text> zł</xsl:text>
				</xsl:element>
				<xsl:element name="PrzychódUlgowyGBP">
					<xsl:value-of select="format-number($PrzychódUlgowyGBP,'.##')"/>
					<xsl:text> £</xsl:text>
				</xsl:element>
					<xsl:element name="PrzychódNormalnyGBP">
					<xsl:value-of select="format-number($PrzychódNormalnyGBP,'.##')"/>
					<xsl:text> £</xsl:text>
				</xsl:element>
				<xsl:element name="PrzychódCalkowityWPLN">
					<xsl:value-of select="format-number($PrzychodCałkowityPLN,'.##')"/>
					<xsl:text> zł</xsl:text>
				</xsl:element>
				<xsl:element name="PrzychódCalkowityWGBP">
					<xsl:value-of select="format-number($PrzychodCałkowityGBP,'.##')"/>
					<xsl:text> £</xsl:text>
				</xsl:element>
				<xsl:element name="Podatek">
					<xsl:value-of select="format-number($PrzychodCałkowityPLN * 0.23,'.##')"/>
					<xsl:text> zł</xsl:text>
				</xsl:element>
				<xsl:element name="Dochód">
					<xsl:value-of select="format-number($PrzychodCałkowityPLN * 0.77,'.##')"/>
					<xsl:text> zł</xsl:text>
				</xsl:element>

		</xsl:element>

		<xsl:element name="DataWygenerowania">
			<xsl:value-of select="current-dateTime()"/>
		</xsl:element>

	</xsl:element>	
</xsl:template>   				    
					    
</xsl:stylesheet>