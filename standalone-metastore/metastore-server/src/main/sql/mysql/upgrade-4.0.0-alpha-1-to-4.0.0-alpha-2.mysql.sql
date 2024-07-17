-- liquibase formatted sql

-- changeset Pvary:10 labels:4.0.0-alpha-2 dbms:mysql
-- comment: Upgrade MetaStore schema from 4.0.0-alpha-1 to 4.0.0-alpha-2

SELECT 'Upgrading MetaStore schema from 4.0.0-alpha-1 to 4.0.0-alpha-2' AS MESSAGE;

-- HIVE-26280
ALTER TABLE `COMPLETED_COMPACTIONS` ADD COLUMN `CC_NEXT_TXN_ID` bigint;
ALTER TABLE `COMPLETED_COMPACTIONS` ADD COLUMN `CC_TXN_ID` bigint;
ALTER TABLE `COMPLETED_COMPACTIONS` ADD COLUMN `CC_COMMIT_TIME` bigint;

-- HIVE-27749
ALTER TABLE `NOTIFICATION_SEQUENCE` ADD CONSTRAINT `ONE_ROW_CONSTRAINT` CHECK (`NNI_ID` = 1);

-- HIVE-26443
ALTER TABLE `COMPACTION_QUEUE` ADD COLUMN `CQ_POOL_NAME` VARCHAR(128);
ALTER TABLE `COMPLETED_COMPACTIONS` ADD COLUMN `CC_POOL_NAME` VARCHAR(128);

-- These lines need to be last.  Insert any changes above.
UPDATE VERSION SET SCHEMA_VERSION='4.0.0-alpha-2', VERSION_COMMENT='Hive release version 4.0.0-alpha-2' where VER_ID=1;
SELECT 'Finished upgrading MetaStore schema from 4.0.0-alpha-1 to 4.0.0-alpha-2' AS MESSAGE;
