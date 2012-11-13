
$(document).ready(function () {

    var oTable = $('#myCompanyTable').dataTable({
        "bServerSide": true,
        "sAjaxSource": "CRM/Company/AjaxHandler",
        "bProcessing": true,
        "aoColumns": [
                        {
                            "sName": "COMPANIESID",
                            "bSearchable": false,
                            "bSortable": false,
                            "fnRender": function (oObj) {
                                return '<a href=\"CRM/Company/Details/' + oObj.aData[0] + '\">View</a>';
                            }
                        },
			            { "sName": "COMPANYNAME" },
			            { "sName": "POCLastName" },
                        { "sName": "POCFirstName" },
			            { "sName": "CITY" },
                        { "sName": "Country" }
        ]
    });
});