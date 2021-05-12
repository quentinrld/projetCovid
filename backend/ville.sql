ALTER PROCEDURE "DBA"."recupereVilles"()
result(codePostal char(4), villeNom char(30))
begin 

select codePostale, villeNom
from tbVilles
order by codePostale asc

end

ALTER PROCEDURE "DBA"."remplirVille"(codeVille INTEGER , nomVille CHAR(50))
BEGIN 

    insert into tbVilles (codePostale, villeNom)
    VALUES 
	(codeVille,nomVille)
	
END
