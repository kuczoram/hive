--liquibase formatted sql

--changeset Stamatis:12 labels:4.0.0 dbms:derby
--comment: Upgrade MetaStore schema from 4.0.0-beta-1 to 4.0.0

-- HIVE-24815 Remove "IDXS" Table from Metastore Schema
DROP TABLE "APP"."INDEX_PARAMS";
DROP TABLE "APP"."IDXS";

-- HIVE-27827
DROP INDEX "APP"."UNIQUEPARTITION";
CREATE UNIQUE INDEX "APP"."UNIQUEPARTITION" ON "APP"."PARTITIONS" ("TBL_ID", "PART_NAME");

-- This needs to be the last thing done.  Insert any changes above this line.
UPDATE "APP".VERSION SET SCHEMA_VERSION='4.0.0', VERSION_COMMENT='Hive release version 4.0.0' where VER_ID=1;
