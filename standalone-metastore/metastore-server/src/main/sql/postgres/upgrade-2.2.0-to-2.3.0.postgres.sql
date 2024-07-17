--liquibase formatted sql

--changeset Gates:5 labels:2.3.0 dbms:postgresql
--comment: Upgrade MetaStore schema from 2.2.0 to 2.3.0

SELECT 'Upgrading MetaStore schema from 2.2.0 to 2.3.0';

--\i 039-HIVE-16399.postgres.sql;
CREATE INDEX TC_TXNID_INDEX ON TXN_COMPONENTS USING hash (TC_TXNID);

UPDATE "VERSION" SET "SCHEMA_VERSION"='2.3.0', "VERSION_COMMENT"='Hive release version 2.3.0' where "VER_ID"=1;
SELECT 'Finished upgrading MetaStore schema from 2.2.0 to 2.3.0';

