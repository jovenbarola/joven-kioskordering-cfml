<cfif isDefined("URL.action")>
    <cfset action = #UCASE(URL.action)#>

    <cfif #action# EQ "MENUS">
        <cfquery name="qryresult">
            SELECT * FROM menus 
            <cfif isDefined("URL.menu_code")>
                WHERE menu_code = <cfqueryparam cfsqltype="cf_sql_varchar" value="#URL.menu_code#">
            <cfelseif isDefined("URL.cat_code")>
                WHERE cat_code = <cfqueryparam cfsqltype="cf_sql_varchar" value="#URL.cat_code#">
            </cfif> 
            LIMIT 0, 100
        </cfquery>

    <cfelseif #action# EQ "CATEGORIES">
        <cfquery name="qryresult">
            SELECT * FROM categories
            <cfif isDefined("URL.cat_code")>
                WHERE cat_code = <cfqueryparam cfsqltype="cf_sql_varchar" value="#URL.cat_code#">
            </cfif>
        </cfquery>

    <cfelseif #action# EQ "PRICES">
        <cfquery name="qryresult">
            SELECT * FROM prices
            <cfif isDefined("URL.menu_code")>
                WHERE menu_code = <cfqueryparam cfsqltype="cf_sql_varchar" value="#URL.menu_code#">
            </cfif>
        </cfquery>

    </cfif>
</cfif>

<cfheader name="Content-type" value="application/json" />
<cfif isDefined("qryresult")>
    <cfoutput>#serializeJSON(qryresult, "struct")#</cfoutput>
<cfelse>
    <cfoutput>[]</cfoutput>
</cfif>