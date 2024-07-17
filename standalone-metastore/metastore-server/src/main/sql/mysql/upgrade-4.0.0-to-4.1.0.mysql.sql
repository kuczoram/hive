--liquibase formatted sql

--changeset deniskuzZ:13 labels:4.1.0 dbms:mssql
--comment: Upgrade MetaStore schema from 4.0.0 to 4.1.0

SELECT 'Upgrading MetaStore schema from 4.0.0 to 4.1.0' AS MESSAGE;

-- HIVE-27725
DROP INDEX TAB_COL_STATS_IDX ON TAB_COL_STATS;
CREATE INDEX TAB_COL_STATS_IDX ON TAB_COL_STATS (TBL_ID, COLUMN_NAME) USING BTREE;
ALTER TABLE TAB_COL_STATS DROP COLUMN CAT_NAME, DROP COLUMN DB_NAME, DROP COLUMN TABLE_NAME;

DROP INDEX PCS_STATS_IDX ON PART_COL_STATS;
CREATE INDEX PCS_STATS_IDX ON PART_COL_STATS (PART_ID, COLUMN_NAME) USING BTREE;
ALTER TABLE PART_COL_STATS DROP COLUMN CAT_NAME, DROP COLUMN DB_NAME, DROP COLUMN TABLE_NAME, DROP COLUMN PARTITION_NAME;

-- These lines need to be last.  Insert any changes above.
UPDATE VERSION SET SCHEMA_VERSION='4.1.0', VERSION_COMMENT='Hive release version 4.1.0' where VER_ID=1;
SELECT 'Finished upgrading MetaStore schema from 4.0.0 to 4.1.0' AS MESSAGE;
