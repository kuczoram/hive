--liquibase formatted sql

--changeset Gates:2 labels:2.0.0 dbms:postgresql
--comment: Upgrade MetaStore schema from 1.2.0 to 2.0.0

SELECT 'Upgrading MetaStore schema from 1.2.0 to 2.0.0';

--\i 021-HIVE-11970.postgres.sql;
ALTER TABLE "COLUMNS_V2" ALTER "COLUMN_NAME" TYPE character varying(1000);
ALTER TABLE "PART_COL_PRIVS" ALTER "COLUMN_NAME" TYPE character varying(1000);
ALTER TABLE "TBL_COL_PRIVS" ALTER "COLUMN_NAME" TYPE character varying(1000);
ALTER TABLE "SORT_COLS" ALTER "COLUMN_NAME" TYPE character varying(1000);
ALTER TABLE "TAB_COL_STATS" ALTER "COLUMN_NAME" TYPE character varying(1000);
ALTER TABLE "PART_COL_STATS" ALTER  "COLUMN_NAME" TYPE character varying(1000);

--\i 022-HIVE-12807.postgres.sql;
ALTER TABLE COMPACTION_QUEUE ADD COLUMN CQ_HIGHEST_TXN_ID bigint;

--\i 023-HIVE-12814.postgres.sql;
ALTER TABLE COMPACTION_QUEUE ADD COLUMN CQ_META_INFO bytea;

--\i 024-HIVE-12816.postgres.sql;
ALTER TABLE COMPACTION_QUEUE ADD COLUMN CQ_HADOOP_JOB_ID varchar(32);

--\i 025-HIVE-12818.postgres.sql;
CREATE TABLE COMPLETED_COMPACTIONS (
  CC_ID bigint PRIMARY KEY,
  CC_DATABASE varchar(128) NOT NULL,
  CC_TABLE varchar(128) NOT NULL,
  CC_PARTITION varchar(767),
  CC_STATE char(1) NOT NULL,
  CC_TYPE char(1) NOT NULL,
  CC_WORKER_ID varchar(128),
  CC_START bigint,
  CC_END bigint,
  CC_RUN_AS varchar(128),
  CC_HIGHEST_TXN_ID bigint,
  CC_META_INFO bytea,
  CC_HADOOP_JOB_ID varchar(32)
);



--\i 026-HIVE-12819.postgres.sql;
ALTER TABLE TXNS ADD COLUMN TXN_AGENT_INFO varchar(128);

--\i 027-HIVE-12821.postgres.sql;
ALTER TABLE TXNS ADD COLUMN TXN_HEARTBEAT_COUNT integer;
ALTER TABLE HIVE_LOCKS ADD COLUMN HL_HEARTBEAT_COUNT integer;

--\i 028-HIVE-12822.postgres.sql;
ALTER TABLE TXNS ADD COLUMN TXN_META_INFO varchar(128);

--\i 029-HIVE-12823.postgres.sql;
ALTER TABLE HIVE_LOCKS ADD COLUMN HL_AGENT_INFO varchar(128);

--\i 030-HIVE-12831.postgres.sql;
ALTER TABLE HIVE_LOCKS ADD COLUMN HL_BLOCKEDBY_EXT_ID bigint;
ALTER TABLE HIVE_LOCKS ADD COLUMN HL_BLOCKEDBY_INT_ID bigint;

--\i 031-HIVE-12832.postgres.sql;
CREATE TABLE AUX_TABLE (
  MT_KEY1 varchar(128) NOT NULL,
  MT_KEY2 bigint NOT NULL,
  MT_COMMENT varchar(255),
  PRIMARY KEY(MT_KEY1, MT_KEY2)
);


UPDATE "VERSION" SET "SCHEMA_VERSION"='2.0.0', "VERSION_COMMENT"='Hive release version 2.0.0' where "VER_ID"=1;
SELECT 'Finished upgrading MetaStore schema from 1.2.0 to 2.0.0';


--
-- Name: PCS_STATS_IDX; Type: INDEX; Schema: public; Owner: hiveuser; Tablespace:
--


