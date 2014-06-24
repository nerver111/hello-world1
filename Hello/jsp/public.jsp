<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%!//对中文字符串进行内码转换，防止出现乱码
     public String getStr(String s)
     {
        String str=s;
        try
        {
          byte b[]=str.getBytes("utf-8");
          str=new String(b);
          return str;
        }
        catch(Exception e)
        {
          return null;
        }
     }  
%>
<%!
      public String int2Str(int num)
      {
        String str=null;
        if(num==1)
        {
          str="Yes";
        }
        if(num==0)
        {
          str="No";
        }
        return str;
      }
%>
