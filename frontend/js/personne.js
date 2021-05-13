"use strict";

document.addEventListener("DOMContentLoaded", initPersonne);

function initPersonne(){
    let xhr = new XMLHttpRequest();
    xhr.open('get', 'recupereEmpl', true);
    xhr.onload = callbackEmpl;
    xhr.send();
}

function callbackEmpl(){
    let employe = JSON.parse(this.responseText);
    let htmltx = "";
    let listPersonne ="";
    let date = new Date();
    let dateact = date.getFullYear()+"-"+date.getMonth()+'-'+date.getDay();
    let result = [];
    let positif = "<b style='color:red'>oui</b>"
    for(let empl of employe){
        if(empl.resultTest == 'Positif'){
            if(empl.ExpirationTest <= dateact){
                result[empl.resultTest] = positif;
            }
        }else{result[empl.resultTest] = 'non';}
    }
    for (let empl of employe){
        htmltx += "<tr><td>"+
            empl.EmplId+"</td><td>"+
            empl.Prenom+"</td><td>"+
            empl.Nom+"</td><td>"+
            empl.DateNaiss+"</td><td>"+
            result[empl.resultTest]+"</td></tr>"
        listPersonne += "<option value="+empl.EmplId+">"+empl.Nom +" "+ empl.Prenom +"</option>";
    }
    document.getElementById("tbodyPersonnes").innerHTML = htmltx;
    document.getElementById("personneTestCovid").innerHTML = listPersonne;
}

function ajouterPersonne(formulaire){
    let xhr = new XMLHttpRequest();
    xhr.open('get','ajouterEmpl?nom='+formulaire.nomPersonne.value+'&prenom='+formulaire.prenomPersonne.value+'&naissance='+formulaire.dateNaissance.value+'&genre='+formulaire.sexePersonne.value,true);
    xhr.onload = initPersonne;
    xhr.send();
    return false;
}

function ajouterTest(formulaire){
    let xhr = new XMLHttpRequest();
    xhr.open('get','remplirTest?dateTest='+formulaire.dateTestCovid.value+'&dateExpir='+formulaire.dateExpirationTestCovid.value+'&reusltat='+formulaire.resultatTestCovid.value+'&idEmpl='+formulaire.personneTestCovid.value,true);
    xhr.onload = initPersonne;
    xhr.send();
    return false;
}
