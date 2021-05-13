ALTER PROCEDURE "DBA"."nouveauTest"(dateTest date, dateExpir date, resultat char(10), idEmpl char(4))
BEGIN 
insert into tbTestCovid(TestId, DateTest, ExpirationTest, resultTest, EmplId)
values
(TestId, dateTest, dateExpir, resultat, EmplId)
end
