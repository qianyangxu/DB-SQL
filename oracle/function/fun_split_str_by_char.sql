create or replace FUNCTION fun_split_str_by_char(str IN VARCHAR, split_char IN VARCHAR,behind IN NUMBER) RETURN VARCHAR2 IS
  /* (用时需测试,split_char在str里只出现一次)
   *  参数:
   *  str : (要切割的字符串)
   *  split_char : (根据此字符切割字符串)
   *  behind : (0 : 截取'split_char'之前的字符串, 1 : 截取'split_char'之后的字符串, 其它:返回空串)
   *  eg: fun_split_str_bychar('12345|7890', '|' , 0) , 结果:12345
   */
  RESULT VARCHAR2(1024);
  v_index NUMBER;
BEGIN
  v_index := instr(str,split_char,1,1);
  IF behind = 0 THEN
    RESULT := substr(str,1,v_index-1);
  ELSIF behind = 1 THEN
    RESULT := substr(str,v_index+1,length(str));
  ELSE RETURN('');
  END IF;
  RETURN(RESULT);
END fun_split_str_by_char;