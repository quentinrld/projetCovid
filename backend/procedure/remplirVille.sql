ALTER PROCEDURE "DBA"."remplirVille"(codeVille INTEGER , nomVille CHAR(50))
BEGIN 

    insert into tbVilles (codePostale, villeNom)
    VALUES 
	(codeVille,nomVille)
	
END
