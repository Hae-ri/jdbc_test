<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<% 
		String m_id=request.getParameter("id");
		String m_pw=request.getParameter("pw");
		String m_email=request.getParameter("email");
		
	
		String sql = "INSERT INTO members(id,passwd,email) values('"+ m_id +"','"+m_pw+"','"+m_email+"')";

		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/address";
		String user = "root";
		String password = "1234";
		Connection conn = null;
		

		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, user, password);
			Statement sm = conn.createStatement(); // sql�� ��������ִ� ��ü ����(statement)
			
			int flag = sm.executeUpdate(sql); // sql���� ���������� ����Ǹ� 1�� ��ȯ
			if(flag ==1){
				out.println("ȸ�����Լ���");
			}else{
				out.println("ȸ�����Խ���");
			}
			//out.println(conn);
		} catch(ClassNotFoundException e) {
			out.println("jdbc ����̹� ����");
		} catch(SQLException e) {
			out.println("SQL ����");
		} finally {
			try {
				if(conn != null) {
					conn.close();
				}
			} catch(SQLException e) {}
		}
		
		%>
</body>
</html>