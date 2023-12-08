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
  <xsl:output method="xml" indent="yes" encoding="UTF-8" omit-xml-declaration="no"/>

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

<xsl:template match="//div1[@type='contents']//ref">
  <xsl:choose>
    <xsl:when test="starts-with(@xml:id, toc)">
      <a class="toc-link">
        <xsl:attribute name="href">
          <xsl:text>#</xsl:text>
          <xsl:value-of select="@target"/>
        </xsl:attribute>
      <xsl:value-of select="@n"/></a>
    </xsl:when>
    <xsl:otherwise>
      <xsl:apply-templates/>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>


<!-- copied from formatting.xsl - needs to be simplified; only addition is link id -->
<xsl:template match="//pb">
    <!-- grab the figure id from @facs, and if there is a .jpg, chop it off
          note: I previously also looked at xml:id for figure ID, but that's 
          incorrect -->
    <xsl:variable name="figure_id">
      <xsl:variable name="figure_id_full">
        <xsl:value-of select="normalize-space(@facs)"/>
      </xsl:variable>
      <xsl:choose>
        <xsl:when test="ends-with($figure_id_full, '.jpg') or ends-with($figure_id_full, '.jpeg')">
          <xsl:value-of select="substring-before($figure_id_full, '.jp')"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$figure_id_full"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <span class="hr">&#160;</span>
    <xsl:if test="$figure_id != ''">
      <span>
        <xsl:attribute name="class">
          <xsl:text>pageimage</xsl:text>
        </xsl:attribute>
        <a>
          <!-- add id to links - only difference from formatting.xsl -->
          <xsl:attribute name="id">
            <xsl:value-of select="@xml:id"/>
          </xsl:attribute>
          <!-- /difference -->
          <xsl:attribute name="href">
            <xsl:call-template name="url_builder">
              <xsl:with-param name="figure_id_local" select="$figure_id"/>
              <xsl:with-param name="image_size_local" select="$image_large"/>
              <xsl:with-param name="iiif_path_local" select="$collection"/>
            </xsl:call-template>
          </xsl:attribute>
          <xsl:attribute name="rel">
            <xsl:text>prettyPhoto[pp_gal]</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="title">
            <xsl:text>&lt;a href=&#34;</xsl:text>
            <xsl:call-template name="url_builder_escaped">
              <xsl:with-param name="figure_id_local" select="$figure_id"/>
              <xsl:with-param name="image_size_local" select="$image_large"/>
              <xsl:with-param name="iiif_path_local" select="$collection"/>
            </xsl:call-template>
            <xsl:text>" target="_blank" &gt;open image in new window&lt;/a&gt;</xsl:text>
          </xsl:attribute>

          <img>
            <xsl:attribute name="src">
              <xsl:call-template name="url_builder">
                <xsl:with-param name="figure_id_local" select="$figure_id"/>
                <xsl:with-param name="image_size_local" select="$image_thumb"/>
                <xsl:with-param name="iiif_path_local" select="$collection"/>
              </xsl:call-template>
            </xsl:attribute>
            <xsl:attribute name="class">
              <xsl:text>display&#160;</xsl:text>
            </xsl:attribute>
          </img>
        </a>
      </span>
    </xsl:if>
  </xsl:template>

</xsl:stylesheet>
