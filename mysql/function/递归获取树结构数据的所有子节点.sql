DELIMITER $$
DROP FUNCTION IF EXISTS Func_GetStruChilds $$
CREATE FUNCTION Func_GetStruChilds (
	v_currentId VARCHAR (36), -- 传入的父节点
	v_rootId VARCHAR (10), -- 企业根组织编码
	v_isContainSelf INT -- 0:不包含当前节点,其它包含当前节点
)
RETURNS VARCHAR (4000)
BEGIN
  -- 功能: 递归获取组织结构树当前节点和它的所有子节点
	-- 返回: 逗号分割的长串
	-- 如: SELECT Func_getStruChilds('0273f322-3d99-4fda-97a6-6dcfbd17f87c', 'tech', 0);
  DECLARE ptemp VARCHAR (4000) ;
  DECLARE ctemp VARCHAR (4000) ;
  SET ptemp = '' ;
  SET ctemp = v_currentId ;
  WHILE
    ctemp IS NOT NULL DO SET ptemp = CONCAT(ptemp, ',', ctemp) ;
    SELECT
      GROUP_CONCAT(STRU_ID) INTO ctemp
    FROM
      pt_structure
     WHERE pt_structure.in_use = '1'
      and pt_structure.IS_VIRTUAL = '0'
      and pt_structure.root_id = v_rootId
      and FIND_IN_SET(PARENT_STRU_ID, ctemp) > 0;
  END WHILE ;
  RETURN if(v_isContainSelf = 0, substring(ptemp, length(v_currentId) + 3), substring(ptemp, 2))  ;
END $$

DELIMITER ;