" xslhelper.vim
" 
" Version 1.1
" 09/2005 by Andrew Savikas (andrews@oreilly.com)
" xslhelper.vim
" 

"==================================
" KEYS         MAKES
"==================================
",an     <xsl:attribute name="">
"        </xsl:attribute>
"
""""""""""""""""""""""""""""""""""""
",as     <xsl:apply-templates select=""/>
"
""""""""""""""""""""""""""""""""""""
",at     <xsl:apply-templates/>        
"
""""""""""""""""""""""""""""""""""""
",cp     <xsl:copy>
"          
"        </xsl:copy>
"
""""""""""""""""""""""""""""""""""""
",co     <xsl:copy-of select="">
"        </xsl:copy>
"      
""""""""""""""""""""""""""""""""""""
",ce     <xsl:choose>
"  
"        </xsl:choose>
"       
""""""""""""""""""""""""""""""""""""
",ch     <xsl:choose>
"          <xsl:when test="">
"          </xsl:when>
"          <xsl:otherwise>
"            
"          </xsl:otherwise>
"        </xsl:choose>
"
""""""""""""""""""""""""""""""""""""
",ct     <xsl:call-template select="">
"        </xsl:call-template>
"
""""""""""""""""""""""""""""""""""""
",en     <xsl:element name="">
"        </xsl:element>
"        
""""""""""""""""""""""""""""""""""""
",fe     <xsl:for-each select="">
"        </xsl:for-each>
"
""""""""""""""""""""""""""""""""""""
",if     <xsl:if test="">
"        </xsl:if>
"
""""""""""""""""""""""""""""""""""""
",msg    <xsl:message>
"          
"        </xsl:message>
"        
""""""""""""""""""""""""""""""""""""
",ow     <xsl:otherwise>
"  
"        </xsl:otherwise>
"
""""""""""""""""""""""""""""""""""""
",sty    <?xml version="1.0"?>
"        <xsl:stylesheet
"        version="1.0"
"        xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
"          
"        </xsl:stylesheet>
"
""""""""""""""""""""""""""""""""""""
",te     <xsl:template match=""/>
"
""""""""""""""""""""""""""""""""""""
",tm     <xsl:template match="">
"        </xsl:template>
"       
""""""""""""""""""""""""""""""""""""
",tn     <xsl:template name="">
"        </xsl:template>
"
""""""""""""""""""""""""""""""""""""
",tt     <xsl:text></xsl:text>
"
""""""""""""""""""""""""""""""""""""
",vn     <xsl:variable name="" select=""/>
"
""""""""""""""""""""""""""""""""""""
",vo     <xsl:value-of select=""/>
"
""""""""""""""""""""""""""""""""""""
",wh     <xsl:when test="">
"        </xsl:when>
"
""""""""""""""""""""""""""""""""""""
",wp     <xsl:with-param name="" select=""/>        
"
""""""""""""""""""""""""""""""""""""

imap ,tm <xsl:template match=""<esc>moa>><esc>'of"a
imap ,tn <xsl:template name=""<esc>moa>><esc>'of"a
imap ,te <xsl:template match=""/><esc>F"i
imap ,ct <xsl:call-template name=""<esc>moa>><esc>'of"a
imap ,at <xsl:apply-templates/>
imap ,as <xsl:apply-templates select=""/><esc>F"i
imap ,vn <xsl:variable name="" select=""/><esc>^f"a
imap ,vo <xsl:value-of select=""/><esc>F"i
imap ,kn <xsl:key name="" match="" use=""/><esc>^f"a
imap ,if <xsl:if test=""<esc>moa>><esc>'of"a
imap ,wh <xsl:when test=""<esc>moa>><esc>'of"a
imap ,ow <xsl:otherwise>>
imap ,ce <xsl:choose>>
imap ,ch ,ce,ow<esc>kO,wh
imap ,fe <xsl:for-each select=""<esc>moa>><esc>'of"a
imap ,en <xsl:element name=""<esc>moa>><esc>'of"a
imap ,an <xsl:attribute name=""<esc>moa>><esc>'of"a
imap ,wp <xsl:with-param name="" select=""/><esc>^f"a
imap ,pn <xsl:param name="" select=""/><esc>^f"a
imap ,tt <xsl:text<esc>moa>><esc>'of"a
imap ,cp <xsl:copy<esc>moa>><esc>'of"a
imap ,co <xsl:copy-of select=""/><esc>^f"a
imap ,msg <xsl:message<esc>moa>><esc>'of"a
imap ,sty <?xml version="1.0"?><CR><xsl:stylesheet<CR>version="1.0"<CR>xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><esc>moli<CR><esc>'oo
imap ,cm <!--   --><esc>b2hi
imap ,fn <fn:function name="">><xsl:param name=""/><CR><fn:result select=""/><CR><esc>kkkf"a
imap ,na <esc>2f"a
imap ,ca <esc>la<space>
imap ,aa <esc>la<Space>
imap ,rs <fn:result select=""/><esc>2hi
