# Docker Image for PostgreSQL with additions for RBAC service

## Backup Instructions

On the running postgres container do:

	docker exec -t <your-db-container> pg_dumpall -c -U <db-user> > dump_rbac-postgres`date +%d-%m-%Y"_"%H_%M_%S`.sql

## Restore Instructions

Without any related containers running do:

	./build-volume-postgres.sh

This will create data-only volumes and volume containers for restoring data.

Now, run a container mounting the recently create containers:

	docker run -d -P --volumes-from dockerrbaccomposed_rbac-auth-services-postgres-volume --name rbac-restore -v $(pwd):/var/lib/postgresql/backup postgres:9.5.4

Bear in mind that you must use the same postgres image version. Otherwise,
postgres server will complain the versions are different on initialization

Finnaly restore the data by doing:

	cat dump_rbac-auth-services-postgres-<backup-date>.sql | docker exec -i rbac-restore psql -U postgres

Cleanup temporary containers:

	docker stop rbac-restore
	docker rm rbac-restore
