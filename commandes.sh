#!/usr/bin/env bash
# Quêtes.dev — Docker, étape 1 « Découverte de Docker »
set -e

# 1. Vérifier client et serveur Docker
docker version

# 2. Test hello-world
docker run --rm hello-world

# 3. Lancer PostgreSQL 16 en arrière-plan
docker run -d --name demo-db \
  -e POSTGRES_USER=demo \
  -e POSTGRES_PASSWORD=demo \
  -e POSTGRES_DB=demo \
  postgres:16-alpine

# 4. Vérifier que le conteneur tourne et que Postgres est prêt
docker ps
docker logs demo-db 2>&1 | grep "database system is ready to accept connections"

# 5. Créer la table, insérer une ligne, vérifier
docker exec demo-db psql -U demo -d demo -c "CREATE TABLE products (id serial primary key, name text, price_cents int);"
docker exec demo-db psql -U demo -d demo -c "INSERT INTO products (name, price_cents) VALUES ('Sticker Démo', 150);"
docker exec demo-db psql -U demo -d demo -c "SELECT * FROM products;"
docker exec demo-db psql -U demo -d demo -c "\dt"

# 6. Les 3 dernières lignes des logs
docker logs demo-db 2>&1 | tail -3

# 7. Nettoyage
docker stop demo-db && docker rm demo-db
docker ps -a
