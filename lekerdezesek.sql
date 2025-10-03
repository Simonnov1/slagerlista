-- 2fekete
select eloado, cim
from album
where cim like "%fekete%" or eloado like "%fekete%";

-- 3kiadolista
select kiado, count(*)
from toplista
group by kiado
order by count(*) desc;

-- 4sikeres
select eloado, platinadb
from toplista inner join album on album.id = albumid
order by platinadb desc
limit 1; 

-- 5tartos
select eloado, cim, count(*)
from toplista inner join album on album.id = albumid
group by cim
having count(*) >= 3;

-- 6nevcimben
select cim, eloado
from toplista inner join album on album.id = albumid
where cim like concat('%', eloado, '%');

-- 7palya
select distinct eloado
from toplista inner join album on album.id = albumid
where kiado in (select kiado
from toplista inner join album on album.id = albumid
where eloado = "Palya Bea") and eloado <> "Palya Bea";
