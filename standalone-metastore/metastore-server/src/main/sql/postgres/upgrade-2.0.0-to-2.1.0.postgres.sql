--liquibase formatted sql

--changeset Gates:3 labels:2.1.0 dbms:postgresql
--comment: Upgrade MetaStore schema from 2.0.0 to 2.1.0

SELECT 'Upgrading MetaStore schema from 2.0.0 to 2.1.0';

--\i 033-HIVE-13076.postgres.sql;
CREATE TABLE "KEY_CONSTRAINTS"
(
  "CHILD_CD_ID" BIGINT,
  "CHILD_INTEGER_IDX" BIGINT,
  "CHILD_TBL_ID" BIGINT,
  "PARENT_CD_ID" BIGINT NOT NULL,
  "PARENT_INTEGER_IDX" BIGINT NOT NULL,
  "PARENT_TBL_ID" BIGINT NOT NULL,
  "POSITION" BIGINT NOT NULL,
  "CONSTRAINT_NAME" VARCHAR(400) NOT NULL,
  "CONSTRAINT_TYPE" SMALLINT NOT NULL,
  "UPDATE_RULE" SMALLINT,
  "DELETE_RULE" SMALLINT,
  "ENABLE_VALIDATE_RELY" SMALLINT NOT NULL,
  PRIMARY KEY ("CONSTRAINT_NAME", "POSITION")
) ;
CREATE INDEX "CONSTRAINTS_PARENT_TBLID_INDEX" ON "KEY_CONSTRAINTS" USING BTREE ("PARENT_TBL_ID");

--\i 034-HIVE-13395.postgres.sql;
CREATE TABLE WRITE_SET (
  WS_DATABASE varchar(128) NOT NULL,
  WS_TABLE varchar(128) NOT NULL,
  WS_PARTITION varchar(767),
  WS_TXNID bigint NOT NULL,
  WS_COMMIT_ID bigint NOT NULL,
  WS_OPERATION_TYPE char(1) NOT NULL
);

ALTER TABLE TXN_COMPONENTS ADD TC_OPERATION_TYPE char(1) NOT NULL;

--\i 035-HIVE-13354.postgres.sql;
ALTER TABLE COMPACTION_QUEUE ADD CQ_TBLPROPERTIES varchar(2048);
ALTER TABLE COMPLETED_COMPACTIONS ADD CC_TBLPROPERTIES varchar(2048);

UPDATE "VERSION" SET "SCHEMA_VERSION"='2.1.0', "VERSION_COMMENT"='Hive release version 2.1.0' where "VER_ID"=1;
SELECT 'Finished upgrading MetaStore schema from 2.0.0 to 2.1.0';

