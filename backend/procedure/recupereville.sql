ALTER PROCEDURE "DBA"."recupereVilles"()
result(codePostal char(4), villeNom char(30))
begin 

select codePostale, villeNom
from tbVilles
order by codePostale asc

end
