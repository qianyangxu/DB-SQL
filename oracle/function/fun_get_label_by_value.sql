-- 按value获取字段表对应的label
create or replace FUNCTION fun_get_label_by_value (
	p_str IN VARCHAR, -- 待切割字符串
	p_dict_type IN VARCHAR, -- 数据库字典类型
	p_split_str IN VARCHAR -- 切割符
) RETURN VARCHAR2 IS RESULT VARCHAR2 (1024) ;
dictLabel VARCHAR2(50);
BEGIN
	FOR dictValue IN (
		SELECT DISTINCT
			REGEXP_SUBSTR (p_str, '[^,]+', 1, LEVEL) AS dValue
		FROM
			DUAL CONNECT BY REGEXP_SUBSTR (p_str, '[^,]+', 1, LEVEL) IS NOT NULL
		ORDER BY
			1
	) loop
dbms_output.put_line(dictValue.dValue);
select label into dictLabel from sys_dict t where t.type = p_dict_type and t.value = dictValue.dValue;
--RESULT := dictLabel || ',' || RESULT;
RESULT := RESULT || ',' || dictLabel;
end loop ;
RETURN (SUBSTR(RESULT, 2)) ;
END fun_get_label_by_value ;