function requestTableData() {
    var http = false;
    var resp = "";
    if (navigator.appName == "Microsoft Internet Explorer") {
        http = new ActiveXObject("Microsoft.XMLHTTP");
    } else {
        http = new XMLHttpRequest();
    }

    http.open("GET", "handler.ashx?on=gclf&id="+OwnerID);
    http.onreadystatechange = function() {
        if (http.readyState == 4) {
            resp = http.responseText;
            if (resp != "")
            {
            StartMakingJTable(resp);
            }
            
        }
    }
    http.send(null);
}



var TableRows = new Array();
var OwnerID="";

function StartMakingJTable(xdata) {
 TableRows.length=0;
    TableRows = xdata.split("?");
var RowsDetails = new Array();

         // name, family, group, masoliat, shomareh
    for (var i=1;i<TableRows.length;i++)
    {
        RowsDetails.length=0;
        RowsDetails = TableRows[i].split(",");
        TableRows[i,0] = RowsDetails[0];
        TableRows[i,1] = RowsDetails[1];
        TableRows[i,2] = RowsDetails[2];
        TableRows[i,3] = RowsDetails[3];
        TableRows[i,4] = RowsDetails[4];
    }
    $("#divTable").dataTable( {
    "aaData":TableRows,"aoClumnn": [
            { "sTitle": "نام" },
            { "sTitle": "نام خانوادگی" },
            { "sTitle": "گروه" },
            { "sTitle": "مسئولیت" },
            { "sTitle": "شماره" }
        ]
    });
















}

