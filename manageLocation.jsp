<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>

<html>
<body>
	<%
	request.setCharacterEncoding("utf-8");

	String ID = request.getParameter("ID");
	String location = request.getParameter("location");
	

		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;

		String sql = "select ID, pwd from Managerss where id = ?";
		String password;
		ResultSet rs = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");

			String url = "jdbc:mysql://54.180.159.220/SE";

			conn = DriverManager.getConnection(url, "hgu", "handong0");
			System.out.println("연결 성공");

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ID);
			rs = pstmt.executeQuery();
			rs.next();
			password = rs.getString("pwd");
			try {
		if (rs != null) {
			rs.close();
		}
			} catch (Exception e) {
		e.printStackTrace();
			}
			try {
		if (pstmt != null) {
			pstmt.close();
		}
			} catch (Exception e) {
		e.printStackTrace();
			}
			try {
		if (conn != null) {
			conn.close();
		}
			} catch (Exception e) {
		e.printStackTrace();
			}

			

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("에러: " + e);
		} finally {
			try {
		if (conn != null && !conn.isClosed()) {
			conn.close();
		}
			} catch (SQLException e) {
		e.printStackTrace();
			}
		}
	%>
</body>
</html> 