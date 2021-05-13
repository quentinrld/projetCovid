ALTER PROCEDURE "DBA"."remplirEmpl"(prenom char(50), nom char(50), naissance date, genre char(1))
BEGIN 
insert into tbEmployers (EmplId, EmplNom, EmplPrenom, EmplSexe, EmplDateNaiss)
VALUES 
(nom,prenom,naissance,genre)
end
