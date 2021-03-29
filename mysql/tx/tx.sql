-- 查看事务是否自动提交
SHOW VARIABLES LIKE 'autocommit';
SELECT @@autocommit;

-- 查看事务隔离界别
SELECT @@tx_isolation;

-- 查看行锁
SHOW STATUS LIKE 'innodb_row_lock%';