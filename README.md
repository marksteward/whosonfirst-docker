Build
=====

```
docker build -t whosonfirst-gb --build-arg country=gb .
```

Run
===

```
docker run --rm -ti whosonfirst-gb
spatialite> with p as (select MakePoint(-0.0776988, 51.5187911, 4326) geom)
select distinct h.depth, n.id, n.tag, n.name
from p, spatialindex si
 left join geometry g on g.rowid = si.rowid
 join name n using (source, id)
 join hierarchy h on h.child_id = g.id
where si.f_table_name = 'geometry'
 and si.f_geometry_column = 'geom'
 and si.search_frame = p.geom
 and st_intersects(g.geom, p.geom)
 and n.lang = 'eng'
 and n.tag in ('colloquial', 'preferred')
order by h.depth desc, n.tag, n.abbr
limit 1;
```

