<cfif isDefined("FORM.action")>
  <cfif #FORM.action# NEQ "process">
    <h1>Nothing to do.</h1>
    <cfabort>
  </cfif>

  <!--- MENUS --->
  <cfloop from="10" to="200" index="ctr">
    <cfquery name="sql">
          INSERT INTO menus (menu_code, menu_name, cat_id, cat_code)
          VALUES ('Item#ctr#', 'Item#ctr#', '10', 'CATEGORY' & ctr);
    </cfquery>
  </cfloop>

  <!--- CATEGORIES --->
  <cfloop from="1" to="100" index="ctr">
    <cfquery name="sql">
          INSERT INTO categories (cat_code, cat_name)
          VALUES ('CATEGORY#ctr#', 'CATEGORY#ctr#');
    </cfquery>
  </cfloop>

</cfif>
