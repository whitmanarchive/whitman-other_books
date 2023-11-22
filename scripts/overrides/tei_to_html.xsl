<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:whitman="http://www.whitmanarchive.org/namespace"
  xpath-default-namespace="http://www.tei-c.org/ns/1.0" version="2.0"
  exclude-result-prefixes="xsl tei xs whitman">
  
  <!-- ==================================================================== -->
  <!--                             IMPORTS                                  -->
  <!-- ==================================================================== -->
  
  <xsl:import href="../.xslt-datura/tei_to_html/tei_to_html.xsl"/>
  <xsl:import href="../../../whitman-scripts/scripts/archive-wide/overrides.xsl"/>

  <!-- To override, copy this file into your collection's script directory
    and change the above paths to:
    "../../.xslt-datura/tei_to_html/lib/formatting.xsl"
 -->
  
  <!-- For display in TEI framework, have changed all namespace declarations to http://www.tei-c.org/ns/1.0. If different (e.g. Whitman), will need to change -->
  <xsl:output method="xml" indent="no" encoding="UTF-8" omit-xml-declaration="no"/>

  <xsl:variable name="top_metadata">
    <ul>
      <li>
        <!-- Following comes from legacy XSL-->
        <strong>Source: </strong>
          <xsl:choose>
              <xsl:when test="//bibl/descendant::title[@level='m']">
                  <xsl:choose>
                      <xsl:when test="count(//bibl/descendant::title[@level='m'])>1">
                          <em>
                              <xsl:value-of
                                  select="//sourceDesc//bibl//title[@level='m'][1]"/>
                          </em><xsl:text> and </xsl:text><em>
                              <xsl:value-of
                                  select="//sourceDesc//bibl//title[@level='m'][2]"/>
                          </em>
                          <xsl:text> (</xsl:text>
                          <xsl:value-of select="//sourceDesc//bibl//pubPlace[1]"/><xsl:text>; </xsl:text>
                          <xsl:value-of select="//sourceDesc//bibl//pubPlace[2]"/>
                          <xsl:if test="//sourceDesc//bibl//publisher"><xsl:text>: </xsl:text>
                              <xsl:value-of
                                  select="//sourceDesc//bibl//publisher[1]"/></xsl:if>
                          <xsl:if test="count(//sourceDesc//bibl//publisher)>1"><xsl:text>; </xsl:text>
                              <xsl:value-of
                                  select="//sourceDesc//bibl//publisher[2]"/></xsl:if>
                          <xsl:text>, </xsl:text><xsl:value-of select="//sourceDesc//bibl//date[@xml:id='dat1']"/><xsl:text>)</xsl:text>
                          <xsl:if test="//sourceDesc//bibl//biblScope[@type='pages']"><xsl:text>, </xsl:text>
                              <xsl:value-of select="//sourceDesc//bibl//biblScope[@type='pages']"/></xsl:if>
                          <xsl:text>. </xsl:text>
                          <xsl:if test="//sourceDesc//bibl//orgName"><xsl:apply-templates select="//sourceDesc//bibl//orgName"/>
                              <xsl:if test="not(//sourceDesc//bibl//idno)"><xsl:text>.</xsl:text></xsl:if>
                          </xsl:if>
                          <xsl:if test="//sourceDesc//bibl//idno"><xsl:text>, </xsl:text><xsl:apply-templates select="//sourceDesc//bibl//idno"/><xsl:text>.</xsl:text></xsl:if>
                      </xsl:when>
                      <xsl:otherwise>
                          <xsl:if test="//sourceDesc/bibl//editor"><xsl:value-of
                      select="//sourceDesc/bibl//editor[1]"/>
                      <xsl:if test="//sourceDesc/bibl//editor[2]"><xsl:text> and </xsl:text><xsl:value-of select="//sourceDesc/bibl//editor[2]"></xsl:value-of></xsl:if>
                      <xsl:text>, ed., </xsl:text></xsl:if>
                  <em>
                      <xsl:value-of select="//sourceDesc//bibl//title[@level='m']"/>
                  </em>
                  <xsl:text> (</xsl:text>
                  <xsl:value-of select="//sourceDesc//bibl//pubPlace"/>
                  <xsl:if test="//sourceDesc//bibl//publisher"><xsl:text>: </xsl:text>
                  <xsl:value-of select="//sourceDesc//bibl//publisher"/></xsl:if>
                  <xsl:text>, </xsl:text><xsl:value-of select="//sourceDesc//bibl//date"/><xsl:text>)</xsl:text>
                  <xsl:if test="//sourceDesc//bibl//biblScope[@type='pages']"><xsl:text>, </xsl:text>
                      <xsl:value-of select="//sourceDesc//bibl//biblScope[@type='pages']"/></xsl:if>
                  <xsl:text>. </xsl:text>
                          <xsl:if test="//sourceDesc//bibl//orgName"><xsl:apply-templates select="//sourceDesc//bibl//orgName"/>
                              <xsl:if test="not(//sourceDesc//bibl//idno)"><xsl:text>.</xsl:text></xsl:if>
                          </xsl:if>
                          <xsl:if test="//sourceDesc//bibl//idno"><xsl:text>, </xsl:text><xsl:apply-templates select="//sourceDesc//bibl//idno"/><xsl:text>.</xsl:text></xsl:if>
                      </xsl:otherwise></xsl:choose>
              </xsl:when>
              <xsl:when test="//bibl/descendant::title[@level='j']">
                  <em>
                      <xsl:value-of select="//sourceDesc//bibl//title[@level='j']"/>
                  </em>
                  <xsl:text> </xsl:text>
                  <xsl:value-of select="//sourceDesc//bibl//biblScope[@type='volume']"/>
                  <xsl:if test="//sourceDesc//bibl//biblScope[@type='issue']"><xsl:text>.</xsl:text><xsl:value-of select="//sourceDesc//bibl//biblScope[@type='issue']"/></xsl:if>
                  <xsl:text> </xsl:text>
                  <xsl:if test="//sourceDesc//bibl//title[@type='journal']"><xsl:text>(</xsl:text></xsl:if>
                  <xsl:value-of select="//sourceDesc//bibl//date"/>
                  <xsl:if test="//sourceDesc//bibl//title[@type='journal']"><xsl:text>)</xsl:text></xsl:if>
                  <xsl:if test="//sourceDesc//bibl//biblScope[@type='pages']"><xsl:text>, </xsl:text><xsl:value-of select="//sourceDesc//bibl//biblScope[@type='pages']"/></xsl:if>
                  <xsl:text>.</xsl:text>
              </xsl:when>
          </xsl:choose>
          
          <xsl:if test="//sourceDesc/bibl"><xsl:text> </xsl:text>
              <xsl:value-of select="/TEI/teiHeader/fileDesc/sourceDesc/bibl/note"/>
          </xsl:if>
      </li>

    </ul>
  </xsl:variable>
 
</xsl:stylesheet>
