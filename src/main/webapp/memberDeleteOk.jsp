<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원탈퇴처리</title>
</head>
<body>
	<% 
		String m_id=request.getParameter("id");
		String m_pw=request.getParameter("pw");

	
		String sql = "delete from members where id = ?";
				
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/address";
		String user = "root";
		String password = "1234";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		

		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, user, password);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m_id);
			
			int flag = pstmt.executeUpdate(); 
			if(flag ==1){
				out.println("회원탈퇴성공");
			}else{
				out.println("회원탈퇴실패");
			}
			//out.println(conn);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				if(conn != null) {
					conn.close();
				}
			} catch(Exception e2) {
				e2.printStackTrace();}
		}
		
		%>
</body>
</html>