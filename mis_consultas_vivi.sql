-- ----------------------------------------
-- 🔍 Consulta 02: Actualizar películas que no tengan clasificación de edad
-- ----------------------------------------
SET SQL_SAFE_UPDATES = 0;

update pelicula
set clasificacion_edad = 0
where clasificacion_edad is null;
-- 🔍 Consulta 03: Filtrar películas en cartelera que no tengan clasificación de edad
-- ----------------------------------------
select distinct p.id, p.nombre
from pelicula p
left join cartelera c on p.id=c.id_pelicula
where p.clasificacion_edad = 0 and c.id_pelicula is not null;

-- 🔍 Consulta 04: Filtrar cines que estén disponibles
-- ----------------------------------------
select distinct c.* 
from cine c
inner join cartelera on c.id = cartelera.id_cine;

-- 🔍 Consulta 05: Películas en cada cine 
-- ----------------------------------------
select 
p.nombre as pelicula, 
c.nombre as cine,
c.estado as estado,
c.pais as pais
from pelicula p 
right join cartelera ca on ca.id_pelicula = p.id
right join cine c on c.id = ca.id_cine
where p.nombre is not null;

