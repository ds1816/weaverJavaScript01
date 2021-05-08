<!-- 使用时请将本文件更名为 getTime.jsp ，并将本文件放到 WEAVER/ecology/userDefined/java/ 下 -->
<%@ page trimDirectiveWhitespaces="true" %><!-- 去掉开始的空格即回车 -->
<%@ page contentType="text/html; charset=UTF-8" %><!-- utf-8 -->

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
	try
	{
		response.setHeader("Access-Control-Allow-Origin","*");
		Date dateTime = new Date();
		String dateParm = (request.getParameter("F")==null)? request.getParameter("f"): request.getParameter("F");
		if(dateParm != null) 
		{
			if(dateParm.length()<200)
			{
				if(dateParm.equalsIgnoreCase("Date"))
				{
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
					out.print(df.format(dateTime));
				}
				else if(dateParm.equalsIgnoreCase("Time"))
				{
					SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");
					out.print(df.format(dateTime));
				}
				else if(dateParm.equalsIgnoreCase("Year"))
				{
					SimpleDateFormat df = new SimpleDateFormat("yyyy");
					out.print(df.format(dateTime));
				}		
				else if(dateParm.equalsIgnoreCase("Mouth"))
				{
					SimpleDateFormat df = new SimpleDateFormat("MM");
					out.print(df.format(dateTime));
				}
				else if(dateParm.equalsIgnoreCase("Day"))
				{
					SimpleDateFormat df = new SimpleDateFormat("dd");
					out.print(df.format(dateTime));
				}
				else if(dateParm.equalsIgnoreCase("Hour"))
				{
					SimpleDateFormat df = new SimpleDateFormat("HH");
					out.print(df.format(dateTime));
				}
				else if(dateParm.equalsIgnoreCase("Minute"))
				{
					SimpleDateFormat df = new SimpleDateFormat("mm");
					out.print(df.format(dateTime));
				}
				else if(dateParm.equalsIgnoreCase("Second"))
				{
					SimpleDateFormat df = new SimpleDateFormat("ss");
					out.print(df.format(dateTime));
				}
				else if(dateParm.equalsIgnoreCase("DateTime"))
				{
					SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
					out.print(df.format(dateTime));
				}
				else
				{
					SimpleDateFormat df = new SimpleDateFormat(dateParm);
					out.print(df.format(dateTime));
				}
			}
		}
		else
		{
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			out.print(df.format(dateTime));
		}
	}
	catch (Exception e){}
%>