

$(document).ready(function () {

    //alert("here beginning");
    //get Window Location
    var windlowLocation = window.location.href.split('/');
    //Get BaseURL Info
    var baseUrl = windlowLocation[0] + '//' + windlowLocation[2] + '/' + windlowLocation[3];

    //var baseUrlColl = windlowLocation[0] + '//' + windlowLocation[2] + '/' + windlowLocation[3] + '/' + windlowLocation[4];
    //alert(baseUrl);
    //alert(baseUrlColl);

    //Create Ajax Source - For CRM Company
    var _ajaxSource = baseUrl + "/Company/AjaxHandler";
    //For Collections
    var _ajaxSourceColl = baseUrl + "/Home/AjaxHandler";
                
    //alert(_ajaxSourceColl);
    if ($("#myCompanyTable").length != 0) {
        var oTable = $('#myCompanyTable').dataTable({
            "bServerSide": true,
            "sAjaxSource": _ajaxSource,
            "bProcessing": true,
            "aoColumns": [
                            {
                                "sName": "COMPANIESID",
                                "bSearchable": false,
                                "bSortable": false,
                                "fnRender": function (oObj) {
                                    return '<a href=\"Company/Details/' + oObj.aData[0] + '\">View</a>';
                                }
                            },
                            { "sName": "COMPANYNAME" },
                            { "sName": "POCLastName" },
                            { "sName": "POCFirstName" },
                            { "sName": "CITY" },
                            { "sName": "Country" }
            ]
        });

    }
    

    //Used for Collections - myCollectionsTable
    if ($("#myCollectionsTable").length != 0) {
        var oCollTable = $('#myCollectionsTable').dataTable({
            "bServerSide": true,
            "sAjaxSource": _ajaxSourceColl,
            "bProcessing": true,
            "aoColumns": [
                            {
                                "sName": "ACCOUNT",
                                "bSearchable": false,
                                "bSortable": false,
                                "fnRender": function (oObj) {
                                    return '<a href=\"Home/Details/' + oObj.aData[0] + '\">View</a>';
                                }
                            },
                            { "sName": "ACCOUNT" },
                            { "sName": "PortfolioName" },
                            { "sName": "PortfolioOwner" },
                            { "sName": "NAME" },
                            { "sName": "LAST_PAY_DATE" },
                            { "sName": "LAST_PAY_AMT" },
                            { "sName": "DaysSinceLastPay" },
                            { "sName": "Balance" },
                            { "sName": "AccruedInterest" },
                            { "sName": "TotalInterest" },
                            { "sName": "ADDRESS1" },
                            { "sName": "CITY" },
                            { "sName": "STATE" },
                            { "sName": "ZIP_CODE" },
                            { "sName": "WorkStatusDescription" },
                            { "sName": "WorkGroup" }
            ]
        });
    }
    
    //Use for State DDL
    $(function () {
        if ($("#stateList").length != 0) {
            //alert("I am here");
            $.getJSON("DPS/GetStateList", null, function (data) {

                //alert(data.length);

                // clear dropdown 
                $("#stateList").html("");
                //add data
                for (var i = 0; i < data.length; i++) {
                    //alert("process started");
                    var item = data[i];
                    //alert(item);
                    $("#stateList").append(
                          $("<option></option>").val(item.Value).html(item.Text)
                    );
                }
            });
        }
    });
    

    //Use for TransCodes DDL 
    $(function () {
        if ($("#transCodesList").length != 0) {
            //alert("I am here inside");
            $.getJSON("DPS/GetTransCodeList", null, function (data) {

                //alert(data.length);

                // clear dropdown 
                $("#transCodesList").html("");
                //add data
                for (var i = 0; i < data.length; i++) {
                    //alert("process started");
                    var item = data[i];
                    //alert(item);
                    $("#transCodesList").append(
                          $("<option></option>").val(item.Value).html(item.Text)
                    );
                }
            });
        }
    });

    //Use for TransSources DDL  
    $(function () {
        if ($("#transSourcesList").length != 0) {
            //alert("I am here inside");
            $.getJSON("DPS/GetTransSourceList", null, function (data) {

                //alert(data.length);

                // clear dropdown 
                $("#transSourcesList").html("");
                //add data
                for (var i = 0; i < data.length; i++) {
                    //alert("process started");
                    var item = data[i];
                    //alert(item);
                    $("#transSourcesList").append(
                          $("<option></option>").val(item.Value).html(item.Text)
                    );
                }
            });
        }
    });
    //Use for PmtTypes DDL  
    $(function () {
        if ($("#pmtTypesList").length != 0) {
            //alert("I am here inside");
            $.getJSON("DPS/GetPmtTypesList", null, function (data) {

                //alert(data.length);

                // clear dropdown 
                $("#pmtTypesList").html("");
                //add data
                for (var i = 0; i < data.length; i++) {
                    //alert("process started");
                    var item = data[i];
                    //alert(item);
                    $("#pmtTypesList").append(
                          $("<option></option>").val(item.Value).html(item.Text)
                    );
                }
            });
        }
    });

    //Use for Portfolio DDL  
    $(function () {
        if ($("#portfoliosList").length != 0) {
            //alert("I am here inside");
            $.getJSON("DPS/GetPortfoliosList", null, function (data) {

                //alert(data.length);

                // clear dropdown 
                $("#portfoliosList").html("");
                //add data
                for (var i = 0; i < data.length; i++) {
                    //alert("process started");
                    var item = data[i];
                    //alert(item);
                    $("#portfoliosList").append(
                          $("<option></option>").val(item.Value).html(item.Text)
                    );
                }
            });
        }
    });
    
    //Use for Responsibilites DDL  
    $(function () {
        if ($("#responsibilitiesList").length != 0) {
            //alert("I am here inside");
            $.getJSON("DPS/GetResponsibilitesList", null, function (data) {

                //alert(data.length);

                // clear dropdown 
                $("#responsibilitiesList").html("");
                //add data
                for (var i = 0; i < data.length; i++) {
                    //alert("process started");
                    var item = data[i];
                    //alert(item);
                    $("#responsibilitiesList").append(
                          $("<option></option>").val(item.Value).html(item.Text)
                    );
                }
            });
        }
    });


    



});

