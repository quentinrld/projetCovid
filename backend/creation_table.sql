CREATE DOMAIN Dsexe char(1) not null check(@col in('M','F'));
CREATE TABLE tbEmployers (
        EmplId INTEGER not null DEFAULT AUTOINCREMENT ,
        EmplNom char(50) not null,
        EmplPrenom char(50) not null,
        EmplSexe Dsexe not null,
        EmplDateNaiss date null,
        CONSTRAINT pkEmpl PRIMARY KEY (emplId)
);

CREATE TABLE tbVilles (
        codePostale char(5),
        villeNom char(30),
        CONSTRAINT pkVille PRIMARY KEY (codePostale)
); 
CREATE domain Rtest char(7) not null check(@clo in('positif','negatif'));

CREATE TABLE tbTestCovid (
        TestId INTEGER not NULL DEFAULT AUTOINCREMENT,
        EmplId INTEGER NOT NULL DEFAULT AUTOINCREMENT,
        DateTest date not null,
        ExpirationTest date not null,
        resultTest Rtest not null,
        CONSTRAINT pktest PRIMARY KEY (TestId),
        CONSTRAINT fktestEmpl FOREIGN KEY (EmplId) REFERENCE tbEmployers (EmplId)
);

CREATE TABLE tbvisites (
        dateVisite date not null,
        EmplId INTEGER NOT NULL DEFAULT AUTOINCREMENT,
        codePostale char(5),
        CONSTRAINT pkVisite PRIMARY KEY (dateVisite),
        CONSTRAINT fkcodePost FOREIGN KEY (codePostale) REFERENCE tbVilles (codePostale),
        CONSTRAINT fkVistEmpl FOREIGN KEY (EmplId) REFERENCE tbEmployers (EmplId)
);
        
