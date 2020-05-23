Build
=====

```
docker build -t whosonfirst-gb --build-arg country=gb .
```

Run
===

```
docker run --rm -ti whosonfirst-gb
spatialite> select distinct h.depth, n.id, n.tag, n.name from geometry g join name n using (id) join hierarchy h on h.child_id = g.id where intersects(g.geom, MakePoint(-0.0776988, 51.5187911, 4326)) and n.lang = 'eng' and n.tag in ('colloquial', 'preferred') order by h.depth desc, n.tag, n.abbr, abbr limit 10;
```

