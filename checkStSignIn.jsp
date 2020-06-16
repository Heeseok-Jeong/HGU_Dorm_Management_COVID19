<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>

<html>
<body>
	<%
	request.setCharacterEncoding("utf-8");

	String ID = request.getParameter("ID");
	String pass = request.getParameter("Password");
	
	
	
	if (ID.isEmpty() || pass.isEmpty()) {
		out.println("<script>");
		out.println("location.href='index.jsp'");
		out.println("alert('Empty information!')");
		out.println("</script>");
	} else {

		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;

		String sql = "select ID, pwd from Students where id = ?";
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

			if (password.equals(pass)) {
				%>
				<script>
				var new_ID = "<%=ID%>";
				location.href = 'new_index.jsp?ID='+new_ID;
				</script>
				<%
			} else {
				%>
				<script>
				location.href = 'index.jsp';
				alert('Wrong information!')
				</script>
				<%
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
	}
	%>
</body>
</html>