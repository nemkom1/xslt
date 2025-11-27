<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:key name="byTeacher" match="course" use="teachers/teacher"/>
    <xsl:key name="byKeyword" match="course" use="keywords/keyword"/>

    <xsl:template match="/courses">
        <html>
        <head>
            <meta charset="UTF-8"/>
            <title>Список курсов</title>
        </head>
        <body>
            <h1>Наши курсы</h1>

            <h2>Курсы, которые ведёт Борисов И.О.</h2>
            <ul>
                <xsl:for-each select="key('byTeacher','Борисов И.О.')">
                    <li><xsl:value-of select="title"/></li>
                </xsl:for-each>
            </ul>

            <h2>Курсы с ключевым словом XML</h2>
            <ul>
                <xsl:for-each select="key('byKeyword','XML')">
                    <li><xsl:value-of select="title"/></li>
                </xsl:for-each>
            </ul>

            <h2>Курсы Борисова И.О., где есть XSLT</h2>
            <ul>
                <xsl:for-each select="key('byTeacher','Борисов И.О.')[keywords/keyword='XSLT']">
                    <li><xsl:value-of select="title"/></li>
                </xsl:for-each>
            </ul>

        </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
