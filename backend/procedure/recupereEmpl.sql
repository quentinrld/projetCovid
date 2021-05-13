alter procedure "DBA"."recupereEmpl"()
result(EmplId char(4), Nom char(30), Prenom char(30), Sexe char(1), DateNaiss date, testid char(4), DateTest date, ExpirationTest date, resultTest char(10)) 
begin
select E.EmplId, EmplNom, EmplPrenom, EmplSexe, EmplDateNaiss, T.TestId, T.DateTest, T.ExpirationTest, T.resultTest
from tbEmployers as E
left JOIN tbTestCovid as T ON E.EmplId = T.EmplId
end
