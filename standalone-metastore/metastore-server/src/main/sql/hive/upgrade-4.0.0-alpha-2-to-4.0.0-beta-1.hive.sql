SELECT 'Upgrading MetaStore schema from 4.0.0-alpha-2 to 4.0.0-beta-1';

USE SYS;

-- HIVE-27228
DROP TABLE IF EXISTS `COMPACTION_QUEUE`;
CREATE EXTERNAL TABLE IF NOT EXISTS `COMPACTION_QUEUE` (
  `CQ_ID` bigint,
  `CQ_DATABASE` string,
  `CQ_TABLE` string,
  `CQ_PARTITION` string,
  `CQ_STATE` string,
  `CQ_TYPE` string,
  `CQ_TBLPROPERTIES` string,
  `CQ_WORKER_ID` string,
  `CQ_ENQUEUE_TIME` bigint,
  `CQ_START` bigint,
  `CQ_RUN_AS` string,
  `CQ_HIGHEST_WRITE_ID` bigint,
  `CQ_HADOOP_JOB_ID` string,
  `CQ_ERROR_MESSAGE` string,
  `CQ_NEXT_TXN_ID` bigint,
  `CQ_TXN_ID` bigint,
  `CQ_COMMIT_TIME` bigint,
  `CQ_INITIATOR_ID` string,
  `CQ_INITIATOR_VERSION` string,
  `CQ_WORKER_VERSION` string,
  `CQ_CLEANER_START` bigint,
  `CQ_POOL_NAME` string,
  `CQ_NUMBER_OF_BUCKETS` string
)
STORED BY 'org.apache.hive.storage.jdbc.JdbcStorageHandler'
TBLPROPERTIES (
"hive.sql.database.type" = "METASTORE",
"hive.sql.query" =
"SELECT
  \"COMPACTION_QUEUE\".\"CQ_ID\",
  \"COMPACTION_QUEUE\".\"CQ_DATABASE\",
  \"COMPACTION_QUEUE\".\"CQ_TABLE\",
  \"COMPACTION_QUEUE\".\"CQ_PARTITION\",
  \"COMPACTION_QUEUE\".\"CQ_STATE\",
  \"COMPACTION_QUEUE\".\"CQ_TYPE\",
  \"COMPACTION_QUEUE\".\"CQ_TBLPROPERTIES\",
  \"COMPACTION_QUEUE\".\"CQ_WORKER_ID\",
  \"COMPACTION_QUEUE\".\"CQ_ENQUEUE_TIME\",
  \"COMPACTION_QUEUE\".\"CQ_START\",
  \"COMPACTION_QUEUE\".\"CQ_RUN_AS\",
  \"COMPACTION_QUEUE\".\"CQ_HIGHEST_WRITE_ID\",
  \"COMPACTION_QUEUE\".\"CQ_HADOOP_JOB_ID\",
  \"COMPACTION_QUEUE\".\"CQ_ERROR_MESSAGE\",
  \"COMPACTION_QUEUE\".\"CQ_NEXT_TXN_ID\",
  \"COMPACTION_QUEUE\".\"CQ_TXN_ID\",
  \"COMPACTION_QUEUE\".\"CQ_COMMIT_TIME\",
  \"COMPACTION_QUEUE\".\"CQ_INITIATOR_ID\",
  \"COMPACTION_QUEUE\".\"CQ_INITIATOR_VERSION\",
  \"COMPACTION_QUEUE\".\"CQ_WORKER_VERSION\",
  \"COMPACTION_QUEUE\".\"CQ_CLEANER_START\",
  \"COMPACTION_QUEUE\".\"CQ_POOL_NAME\",
  \"COMPACTION_QUEUE\".\"CQ_NUMBER_OF_BUCKETS\"
FROM \"COMPACTION_QUEUE\"
"
);

DROP TABLE IF EXISTS `COMPLETED_COMPACTIONS`;
CREATE EXTERNAL TABLE IF NOT EXISTS `COMPLETED_COMPACTIONS` (
  `CC_ID` bigint,
  `CC_DATABASE` string,
  `CC_TABLE` string,
  `CC_PARTITION` string,
  `CC_STATE` string,
  `CC_TYPE` string,
  `CC_TBLPROPERTIES` string,
  `CC_WORKER_ID` string,
  `CC_ENQUEUE_TIME` bigint,
  `CC_START` bigint,
  `CC_END` bigint,
  `CC_RUN_AS` string,
  `CC_HIGHEST_WRITE_ID` bigint,
  `CC_HADOOP_JOB_ID` string,
  `CC_ERROR_MESSAGE` string,
  `CC_NEXT_TXN_ID` bigint,
  `CC_TXN_ID` bigint,
  `CC_COMMIT_TIME` bigint,
  `CC_INITIATOR_ID` string,
  `CC_INITIATOR_VERSION` string,
  `CC_WORKER_VERSION` string,
  `CC_POOL_NAME` string,
  `CC_NUMBER_OF_BUCKETS` string
)
STORED BY 'org.apache.hive.storage.jdbc.JdbcStorageHandler'
TBLPROPERTIES (
"hive.sql.database.type" = "METASTORE",
"hive.sql.query" =
"SELECT
  \"COMPLETED_COMPACTIONS\".\"CC_ID\",
  \"COMPLETED_COMPACTIONS\".\"CC_DATABASE\",
  \"COMPLETED_COMPACTIONS\".\"CC_TABLE\",
  \"COMPLETED_COMPACTIONS\".\"CC_PARTITION\",
  \"COMPLETED_COMPACTIONS\".\"CC_STATE\",
  \"COMPLETED_COMPACTIONS\".\"CC_TYPE\",
  \"COMPLETED_COMPACTIONS\".\"CC_TBLPROPERTIES\",
  \"COMPLETED_COMPACTIONS\".\"CC_WORKER_ID\",
  \"COMPLETED_COMPACTIONS\".\"CC_ENQUEUE_TIME\",
  \"COMPLETED_COMPACTIONS\".\"CC_START\",
  \"COMPLETED_COMPACTIONS\".\"CC_END\",
  \"COMPLETED_COMPACTIONS\".\"CC_RUN_AS\",
  \"COMPLETED_COMPACTIONS\".\"CC_HIGHEST_WRITE_ID\",
  \"COMPLETED_COMPACTIONS\".\"CC_HADOOP_JOB_ID\",
  \"COMPLETED_COMPACTIONS\".\"CC_ERROR_MESSAGE\",
  \"COMPLETED_COMPACTIONS\".\"CC_NEXT_TXN_ID\",
  \"COMPLETED_COMPACTIONS\".\"CC_TXN_ID\",
  \"COMPLETED_COMPACTIONS\".\"CC_COMMIT_TIME\",
  \"COMPLETED_COMPACTIONS\".\"CC_INITIATOR_ID\",
  \"COMPLETED_COMPACTIONS\".\"CC_INITIATOR_VERSION\",
  \"COMPLETED_COMPACTIONS\".\"CC_WORKER_VERSION\",
  \"COMPLETED_COMPACTIONS\".\"CC_POOL_NAME\",
  \"COMPLETED_COMPACTIONS\".\"CC_NUMBER_OF_BUCKETS\"
FROM \"COMPLETED_COMPACTIONS\"
"
);

CREATE OR REPLACE VIEW `COMPACTIONS`
(
  `C_ID`,
  `C_CATALOG`,
  `C_DATABASE`,
  `C_TABLE`,
  `C_PARTITION`,
  `C_TYPE`,
  `C_STATE`,
  `C_WORKER_HOST`,
  `C_WORKER_ID`,
  `C_WORKER_VERSION`,
  `C_ENQUEUE_TIME`,
  `C_START`,
  `C_DURATION`,
  `C_HADOOP_JOB_ID`,
  `C_RUN_AS`,
  `C_ERROR_MESSAGE`,
  `C_NEXT_TXN_ID`,
  `C_TXN_ID`,
  `C_COMMIT_TIME`,
  `C_HIGHEST_WRITE_ID`,
  `C_INITIATOR_HOST`,
  `C_INITIATOR_ID`,
  `C_INITIATOR_VERSION`,
  `C_CLEANER_START`,
  `C_POOL_NAME`,
  `C_NUMBER_OF_BUCKETS`,
  `C_TBLPROPERTIES`
) AS
SELECT
  CC_ID,
  'default',
  CC_DATABASE,
  CC_TABLE,
  CC_PARTITION,
  CASE WHEN CC_TYPE = 'i' THEN 'minor' WHEN CC_TYPE = 'a' THEN 'major' ELSE 'UNKNOWN' END,
  CASE WHEN CC_STATE = 'f' THEN 'failed' WHEN CC_STATE = 's' THEN 'succeeded'
    WHEN CC_STATE = 'a' THEN 'did not initiate' WHEN CC_STATE = 'c' THEN 'refused' ELSE 'UNKNOWN' END,
  CASE WHEN CC_WORKER_ID IS NULL THEN cast (null as string) ELSE split(CC_WORKER_ID,"-")[0] END,
  CASE WHEN CC_WORKER_ID IS NULL THEN cast (null as string) ELSE split(CC_WORKER_ID,"-")[size(split(CC_WORKER_ID,"-"))-1] END,
  CC_WORKER_VERSION,
  FROM_UNIXTIME(CC_ENQUEUE_TIME DIV 1000),
  FROM_UNIXTIME(CC_START DIV 1000),
  CASE WHEN CC_END IS NULL THEN cast (null as string) ELSE CC_END-CC_START END,
  CC_HADOOP_JOB_ID,
  CC_RUN_AS,
  CC_ERROR_MESSAGE,
  CC_NEXT_TXN_ID,
  CC_TXN_ID,
  FROM_UNIXTIME(CC_COMMIT_TIME DIV 1000),
  CC_HIGHEST_WRITE_ID,
  CASE WHEN CC_INITIATOR_ID IS NULL THEN cast (null as string) ELSE split(CC_INITIATOR_ID,"-")[0] END,
  CASE WHEN CC_INITIATOR_ID IS NULL THEN cast (null as string) ELSE split(CC_INITIATOR_ID,"-")[size(split(CC_INITIATOR_ID,"-"))-1] END,
  CC_INITIATOR_VERSION,
  NULL,
  NVL(CC_POOL_NAME, 'default'),
  CC_NUMBER_OF_BUCKETS,
  CC_TBLPROPERTIES
FROM COMPLETED_COMPACTIONS
UNION ALL
SELECT
  CQ_ID,
  'default',
  CQ_DATABASE,
  CQ_TABLE,
  CQ_PARTITION,
  CASE WHEN CQ_TYPE = 'i' THEN 'minor' WHEN CQ_TYPE = 'a' THEN 'major' ELSE 'UNKNOWN' END,
  CASE WHEN CQ_STATE = 'i' THEN 'initiated' WHEN CQ_STATE = 'w' THEN 'working' WHEN CQ_STATE = 'r' THEN 'ready for cleaning' ELSE 'UNKNOWN' END,
  CASE WHEN CQ_WORKER_ID IS NULL THEN NULL ELSE split(CQ_WORKER_ID,"-")[0] END,
  CASE WHEN CQ_WORKER_ID IS NULL THEN NULL ELSE split(CQ_WORKER_ID,"-")[size(split(CQ_WORKER_ID,"-"))-1] END,
  CQ_WORKER_VERSION,
  FROM_UNIXTIME(CQ_ENQUEUE_TIME DIV 1000),
  FROM_UNIXTIME(CQ_START DIV 1000),
  cast (null as string),
  CQ_HADOOP_JOB_ID,
  CQ_RUN_AS,
  CQ_ERROR_MESSAGE,
  CQ_NEXT_TXN_ID,
  CQ_TXN_ID,
  FROM_UNIXTIME(CQ_COMMIT_TIME DIV 1000),
  CQ_HIGHEST_WRITE_ID,
  CASE WHEN CQ_INITIATOR_ID IS NULL THEN NULL ELSE split(CQ_INITIATOR_ID,"-")[0] END,
  CASE WHEN CQ_INITIATOR_ID IS NULL THEN NULL ELSE split(CQ_INITIATOR_ID,"-")[size(split(CQ_INITIATOR_ID,"-"))-1] END,
  CQ_INITIATOR_VERSION,
  FROM_UNIXTIME(CQ_CLEANER_START DIV 1000),
  NVL(CQ_POOL_NAME, 'default'),
  CQ_NUMBER_OF_BUCKETS,
  CQ_TBLPROPERTIES
FROM COMPACTION_QUEUE;

CREATE OR REPLACE VIEW `VERSION` AS SELECT 1 AS `VER_ID`, '4.0.0-beta-1' AS `SCHEMA_VERSION`,
  'Hive release version 4.0.0-beta-1' AS `VERSION_COMMENT`;

USE INFORMATION_SCHEMA;

CREATE OR REPLACE VIEW `COMPACTIONS`
(
  `C_ID`,
  `C_CATALOG`,
  `C_DATABASE`,
  `C_TABLE`,
  `C_PARTITION`,
  `C_TYPE`,
  `C_STATE`,
  `C_WORKER_HOST`,
  `C_WORKER_ID`,
  `C_WORKER_VERSION`,
  `C_ENQUEUE_TIME`,
  `C_START`,
  `C_DURATION`,
  `C_HADOOP_JOB_ID`,
  `C_RUN_AS`,
  `C_ERROR_MESSAGE`,
  `C_NEXT_TXN_ID`,
  `C_TXN_ID`,
  `C_COMMIT_TIME`,
  `C_HIGHEST_WRITE_ID`,
  `C_INITIATOR_HOST`,
  `C_INITIATOR_ID`,
  `C_INITIATOR_VERSION`,
  `C_CLEANER_START`,
  `C_POOL_NAME`,
  `C_NUMBER_OF_BUCKETS`,
  `C_TBLPROPERTIES`
) AS
SELECT DISTINCT
  C_ID,
  C_CATALOG,
  C_DATABASE,
  C_TABLE,
  C_PARTITION,
  C_TYPE,
  C_STATE,
  C_WORKER_HOST,
  C_WORKER_ID,
  C_WORKER_VERSION,
  C_ENQUEUE_TIME,
  C_START,
  C_DURATION,
  C_HADOOP_JOB_ID,
  C_RUN_AS,
  C_ERROR_MESSAGE,
  C_NEXT_TXN_ID,
  C_TXN_ID,
  C_COMMIT_TIME,
  C_HIGHEST_WRITE_ID,
  C_INITIATOR_HOST,
  C_INITIATOR_ID,
  C_INITIATOR_VERSION,
  C_CLEANER_START,
  C_POOL_NAME,
  C_NUMBER_OF_BUCKETS,
  C_TBLPROPERTIES
FROM
  `sys`.`COMPACTIONS` C JOIN `sys`.`TBLS` T ON (C.`C_TABLE` = T.`TBL_NAME`)
                        JOIN `sys`.`DBS` D ON (C.`C_DATABASE` = D.`NAME`)
                        LEFT JOIN `sys`.`TBL_PRIVS` P ON (T.`TBL_ID` = P.`TBL_ID`)
WHERE
  (NOT restrict_information_schema() OR P.`TBL_ID` IS NOT NULL
  AND (P.`PRINCIPAL_NAME`=current_user() AND P.`PRINCIPAL_TYPE`='USER'
    OR ((array_contains(current_groups(), P.`PRINCIPAL_NAME`) OR P.`PRINCIPAL_NAME` = 'public') AND P.`PRINCIPAL_TYPE`='GROUP'))
  AND P.`TBL_PRIV`='SELECT' AND P.`AUTHORIZER`=current_authorizer());

CREATE OR REPLACE VIEW `TRANSACTIONS` (
                                       `TXN_ID`,
                                       `STATE`,
                                       `STARTED`,
                                       `LAST_HEARTBEAT`,
                                       `USER`,
                                       `HOST`,
                                       `AGENT_INFO`,
                                       `META_INFO`,
                                       `HEARTBEAT_COUNT`,
                                       `TYPE`,
                                       `TC_DATABASE`,
                                       `TC_TABLE`,
                                       `TC_PARTITION`,
                                       `TC_OPERATION_TYPE`,
                                       `TC_WRITEID`
  ) AS
SELECT DISTINCT
  `TXN_ID`,
  `STATE`,
  `STARTED`,
  `LAST_HEARTBEAT`,
  `USER`,
  `HOST`,
  `AGENT_INFO`,
  `META_INFO`,
  `HEARTBEAT_COUNT`,
  `TYPE`,
  `TC_DATABASE`,
  `TC_TABLE`,
  `TC_PARTITION`,
  `TC_OPERATION_TYPE`,
  `TC_WRITEID`
FROM `SYS`.`TRANSACTIONS` AS TXN JOIN `sys`.`TBLS` T ON (TXN.`TC_TABLE` = T.`TBL_NAME`)
                                 JOIN `sys`.`DBS` D ON (TXN.`TC_DATABASE` = D.`NAME`)
                                 LEFT JOIN `sys`.`TBL_PRIVS` P ON (T.`TBL_ID` = P.`TBL_ID`)
WHERE
  (NOT restrict_information_schema() OR P.`TBL_ID` IS NOT NULL
    AND (P.`PRINCIPAL_NAME`=current_user() AND P.`PRINCIPAL_TYPE`='USER'
      OR ((array_contains(current_groups(), P.`PRINCIPAL_NAME`) OR P.`PRINCIPAL_NAME` = 'public') AND P.`PRINCIPAL_TYPE`='GROUP'))
    AND P.`TBL_PRIV`='SELECT' AND P.`AUTHORIZER`=current_authorizer());

CREATE OR REPLACE VIEW `LOCKS` (
                                `LOCK_EXT_ID`,
                                `LOCK_INT_ID`,
                                `TXNID`,
                                `DB`,
                                `TABLE`,
                                `PARTITION`,
                                `LOCK_STATE`,
                                `LOCK_TYPE`,
                                `LAST_HEARTBEAT`,
                                `ACQUIRED_AT`,
                                `USER`,
                                `HOST`,
                                `HEARTBEAT_COUNT`,
                                `AGENT_INFO`,
                                `BLOCKEDBY_EXT_ID`,
                                `BLOCKEDBY_INT_ID`
  ) AS
SELECT DISTINCT
  `LOCK_EXT_ID`,
  `LOCK_INT_ID`,
  `TXNID`,
  `DB`,
  `TABLE`,
  `PARTITION`,
  `LOCK_STATE`,
  `LOCK_TYPE`,
  `LAST_HEARTBEAT`,
  `ACQUIRED_AT`,
  `USER`,
  `HOST`,
  `HEARTBEAT_COUNT`,
  `AGENT_INFO`,
  `BLOCKEDBY_EXT_ID`,
  `BLOCKEDBY_INT_ID`
FROM SYS.`LOCKS` AS L JOIN `sys`.`TBLS` T ON (L.`TABLE` = T.`TBL_NAME`)
                      JOIN `sys`.`DBS` D ON (L.`DB` = D.`NAME`)
                      LEFT JOIN `sys`.`TBL_PRIVS` P ON (T.`TBL_ID` = P.`TBL_ID`)
WHERE
  (NOT restrict_information_schema() OR P.`TBL_ID` IS NOT NULL
    AND (P.`PRINCIPAL_NAME`=current_user() AND P.`PRINCIPAL_TYPE`='USER'
      OR ((array_contains(current_groups(), P.`PRINCIPAL_NAME`) OR P.`PRINCIPAL_NAME` = 'public') AND P.`PRINCIPAL_TYPE`='GROUP'))
    AND P.`TBL_PRIV`='SELECT' AND P.`AUTHORIZER`=current_authorizer());

SELECT 'Finished upgrading MetaStore schema from 4.0.0-alpha-2 to 4.0.0-beta-1';