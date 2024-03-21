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
 
  <!-- ref - copied from overrides.xsl -->
  <xsl:template match="ref">
    <xsl:choose>
      <!-- When target starts with #, assume it is an in page link (anchor) -->
      <xsl:when test="starts-with(@target, '#')">
        <xsl:variable name="n" select="@target"/>
        <xsl:text> </xsl:text>
        <a>
          <xsl:attribute name="id">
            <xsl:text>ref</xsl:text>
            <xsl:value-of select="@target"/>
          </xsl:attribute>
          <xsl:attribute name="class">
            <xsl:text>inlinenote</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="href">
            <xsl:value-of select="@target"/>
          </xsl:attribute>
          <xsl:apply-templates/>
        </a>
        <xsl:text> </xsl:text>
      </xsl:when>
      <!-- when marked as link, treat as an external link -->
      <xsl:when test="@type = 'link'">
        <a href="{@target}">
          <xsl:apply-templates/>
        </a>
      </xsl:when>
      <!-- when it starts with http, external link -->
      <xsl:when test="(starts-with(@target, 'http://') or starts-with(@target, 'https://')) and not(starts-with(@target, 'http://whitmanarchive.org'))">
        <a href="{@target}">
          <xsl:apply-templates/>
        </a>
      </xsl:when>
      <!-- if the above are not true, it is assumed to be an internal to the site link -->
      <xsl:when test="@type = 'sitelink'">
        <a>
          <xsl:attribute name="href">
            <xsl:choose>
              <xsl:when test="ends-with(@target,'.html')">
                <xsl:value-of select="substring-before(@target,'.html')"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="@target"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <xsl:attribute name="class"><xsl:text>internal_link</xsl:text></xsl:attribute>
          
          <xsl:apply-templates/>
        </a>
      </xsl:when>
      <!-- addition for other-books -->
      <xsl:when test="starts-with(@target, 'leaf')">
          <a>
            <xsl:attribute name="id">
              <xsl:value-of select="@xml:id"/>
            </xsl:attribute>
            <xsl:attribute name="class">
              <xsl:text>inlinenote</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="href">
              <xsl:text>#</xsl:text>
              <xsl:value-of select="@target"/>
            </xsl:attribute>
            <xsl:value-of select="@n"/>
            <xsl:apply-templates/>
          </a>
        <xsl:text> </xsl:text>
      </xsl:when>
      <!-- / addition for other-books -->
      <!-- when marked as link, treat as an external link -->
      <xsl:when test="@type = 'link'">
        <a href="{@target}">
          <xsl:apply-templates/>
        </a>
      </xsl:when>
      <xsl:when test="/TEI/@xml:id = 'ppp.01875'">
        <sup>
          <a>
            <xsl:attribute name="href">
              <xsl:text>#footn</xsl:text>
              <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:attribute name="id">
              <xsl:text>bodyn</xsl:text>
              <xsl:value-of select="@n"/>
            </xsl:attribute>
            <xsl:value-of select="@n"/>
          </a>
        </sup>
      </xsl:when>
      <xsl:otherwise>
        <a>
          <xsl:attribute name="href">
            <xsl:choose>
              <xsl:when test="ends-with(@target,'.html')">
                <xsl:choose>
                  <!-- this should hit on internal links that will now be at the /item/ level -->
                  <xsl:when test="starts-with(@target,'http://whitmanarchive.org')">
                    <xsl:value-of select="substring-before(tokenize(@target, '/')[last()],'.html')"/>
                  </xsl:when>
                  <xsl:otherwise><xsl:value-of select="substring-before(@target,'.html')"/></xsl:otherwise>
                </xsl:choose>
                
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="@target"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:attribute>
          <xsl:attribute name="class"><xsl:text>internal_link</xsl:text></xsl:attribute>
          
          <xsl:apply-templates/>
        </a>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template> 
  
  <xsl:template match="/TEI[@xml:id='ppp.01875']//note"><!-- don't show notes inline for this file --></xsl:template>
  <xsl:template match="/TEI[@xml:id='ppp.01875']//note//pb" priority="1">wwwww<!-- don't show PB's in the notes for this file --></xsl:template>
 
  <!-- numbered footnotes with id on number instead of back link -->
  <!-- copied from overrides.xsl, which was overwritten from datura to remove div.main_content -->
  <xsl:template match="text">
      <xsl:apply-templates/>
    
       <xsl:if test="//note[@place = 'foot']">
        <div class="footnotes">
          <div class="h3">Notes:</div>
          <xsl:text> </xsl:text>
          <xsl:for-each select="//note[@place = 'foot']">
            <p>
              <span class="notenumber">
                <!-- moved footnote id here -->
                <xsl:attribute name="id">
                  <xsl:text>foot</xsl:text>
                  <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
                <!-- /moved footnote -->
                <xsl:value-of select="substring(@xml:id, 2)"/>.
              </span>
              <xsl:text> </xsl:text>
              <xsl:apply-templates/>
              <xsl:text> </xsl:text>
              <a>
                <xsl:attribute name="href">
                  <xsl:text>#</xsl:text>
                  <xsl:text>body</xsl:text>
                  <xsl:value-of select="@xml:id"/>
                </xsl:attribute>
                <!-- moved footnote id from here to notenumber -->
                <xsl:text>[back]</xsl:text>
              </a>
            </p>
          </xsl:for-each>
        </div>
      </xsl:if>
  </xsl:template>
  
  <xsl:template match="pb" priority="2">
    <!-- grab the figure id from @facs after tokenizing, and if there is a .jpg, chop it off
          note: I previously also looked at xml:id for figure ID, but that's 
          incorrect -->
    
    <xsl:variable name="pb_xmlid">
      <xsl:value-of select="@xml:id"/>
    </xsl:variable>
    <xsl:variable name="pb_n">
      <xsl:value-of select="@n"/>
    </xsl:variable>
    
    <xsl:for-each select="tokenize(@facs, ' ')">
      <xsl:variable name="figure_id">
        <xsl:variable name="figure_id_full">
          <xsl:value-of select="normalize-space(.)"/>
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
      
      <span class="hr">&#160;
        <!-- if pb/@xml:id begins with "leaf" add language that looks like leaf 1 recto, leaf 1 verso, leaf 2 recto, etc -->
        <!-- changing rule to check format of xml:id - it does not work across the board. may need to generalize more  -->
        <xsl:if test="starts-with($pb_xmlid,'leaf') and string-length($pb_xmlid) &gt;= 8">
          <xsl:variable name="id" select="$pb_xmlid"/>
          <xsl:variable name="page"><xsl:value-of select="xs:decimal(substring(substring-after($pb_xmlid,'leaf'),1,3))"/></xsl:variable>
          <xsl:variable name="last_character" select="substring($pb_xmlid,8,8)"/>
          <xsl:variable name="rectoverso">
            <xsl:choose>
              <xsl:when test="$last_character = 'r'">recto</xsl:when>
              <xsl:when test="$last_character = 'v'">verso</xsl:when>
            </xsl:choose>
          </xsl:variable>
          <xsl:text>[ begin page </xsl:text>
          <xsl:value-of select="$pb_n"/>
          <xsl:text> ]</xsl:text>
        </xsl:if>
      </span>
      <xsl:if test="$figure_id != ''">
        <span>
          <xsl:attribute name="class">
            <xsl:text>pageimage</xsl:text>
          </xsl:attribute>
          <a>
            <!-- add id to links -->
            <xsl:attribute name="id">
              <xsl:value-of select="$pb_xmlid"/>
            </xsl:attribute>
            <!-- /add id to links -->
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
        <span class="page_image_description"><xsl:value-of select="."/></span>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
 
</xsl:stylesheet>
