function tablaExcel(tableID, filename = ''){
    var downloadLink;
    var dataType = 'data:application/vnd.ms-excel';
    var tableSelect = document.getElementById(tableID);
    var tableHTML = tableSelect.outerHTML.replace(/ /g, '%20');
    
    filename = filename ? filename + '.xls' : 'excel_data.xlss';
    
    // Creando el link de descarga
    downloadLink = document.createElement("a");
    
    document.body.appendChild(downloadLink);
    
    if(navigator.msSaveOrOpenBlob){
        var blob = new Blob(['\ufeff', tableHTML], {
            type: dataType
        });
        navigator.msSaveOrOpenBlob(blob, filename);
    }
    
    else{
        // Creando el link del archivo
        downloadLink.href = 'data:' + dataType + ', ' + tableHTML;
    
        // configurando el nombre del archivo
        downloadLink.download = filename;
        
        //lanzando la función
        downloadLink.click();
    }
}

function descargarTXT(csv, filename) {
    var csvFile;
    var downloadLink;

    csvFile = new Blob([csv], {type: "text/plain"});

    downloadLink = document.createElement("a");

    downloadLink.download = filename;

    downloadLink.href = window.URL.createObjectURL(csvFile);

    downloadLink.style.display = "none";

    document.body.appendChild(downloadLink);

    downloadLink.click();
}

function tablaTXT(filename) {
    var txt = [];
    var rows = document.querySelectorAll("table tr");
    
    for (var i = 0; i < rows.length; i++) {
        var row = [], cols = rows[i].querySelectorAll("tbody td, tbody th");
        
        for (var j = 0; j < cols.length - 6; j++) {
        	row.push("----------------");
            row.push(cols[1].innerText);
            row.push(cols[2].innerText);
            row.push(cols[3].innerText);
            row.push("----------------");
        }
        
        txt.push(row.join("\n"));        
    }

    descargarTXT(txt.join(""), filename);
}