﻿

$(document).ready(function () {

    //get Window Location
    var windlowLocation = window.location.href.split('/');
    //Get BaseURL Info
    var baseUrl = windlowLocation[0] + '//' + windlowLocation[2] + '/' + windlowLocation[3];
    //alert(baseUrl);
    //Create Ajax Source
    var _ajaxSource = baseUrl + "/Company/AjaxHandler";

    var _ajaxSourceColl = baseUrl + "/Home/AjaxHandler";

            
    //alert(_ajaxSourceColl);

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

    //Used for Collections - myCollectionsTable
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
       

});
