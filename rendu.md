# Rendu — Quêtes.dev, Docker étape 1

## `\dt` — liste des tables

```
         List of relations
 Schema |   Name   | Type  | Owner 
--------+----------+-------+-------
 public | products | table | demo
(1 row)
```

## `SELECT * FROM products;`

```
 id |     name     | price_cents 
----+--------------+-------------
  1 | Sticker Démo |         150
(1 row)
```

## Dernières lignes de `docker logs demo-db`

```
2026-10-06 09:34:30.795 UTC [1] LOG:  listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
2026-10-06 09:34:30.797 UTC [57] LOG:  database system was shut down at 2026-10-06 09:34:30 UTC
2026-10-06 09:34:30.799 UTC [1] LOG:  database system is ready to accept connections
```
