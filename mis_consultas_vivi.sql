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