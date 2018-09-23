.PHONY: all pma run stop connect sql

all: run pma
run:
	./scripts/run.sh

pma:
	./scripts/pma.sh

stop:
	./scripts/stop.sh

connect:
	./scripts/connect.sh

sql:
	./scripts/sql.sh
