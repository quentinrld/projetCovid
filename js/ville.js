"use strict";

document.addEventListener("DOMContentLoaded", initVille);

function initVille(){
    let xhr = new XMLHttpRequest();
    xhr.open('get', 'recuperationVille', true);
    xhr.onload = callbackVilles;
    xhr.send();
}


function callbackVilles() {
    let employes = JSON.parse(this.responseText);
    console.log(employes);
    let htmlTr = "";
    for(let employe of employes){
        htmlTr += "<li>" +
            employe.codePostal +' '+ employe.villeNom +
            "</li>";
    }
    console.log(htmlTr);
    document.getElementById("listeVilles").innerHTML = htmlTr;
    document.getElementById('zoneListeVille').style.display = 'block';
}

function ajouterVille(formulaireVille) {
    let xhr = new XMLHttpRequest();
    xhr.open('get', 'ajouterVilles?villeNom=(formulaireVille.nomVille.value)&codePostale=(formulaireVille.codePostal.value)', true);
    xhr.onload = initVille;
    xhr.send();
    return false;
}
