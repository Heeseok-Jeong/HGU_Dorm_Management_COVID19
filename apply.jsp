<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "java.text.SimpleDateFormat" %>


<body>
<%

	request.setCharacterEncoding("utf-8");
	
	String rc=request.getParameter("RC");
	String dates=request.getParameter("datepicker");
	String reason=request.getParameter("reason");
	String id=request.getParameter("ID");
	String location=request.getParameter("location");
	int accepted=0;

	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String ss=sdf.format(new java.util.Date());
	java.sql.Date apply_data= java.sql.Date.valueOf(ss);
	
	SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
	String ss2=sdf2.format(new java.util.Date());
	java.sql.Date accpt_data= java.sql.Date.valueOf(ss2);
	
	Connection conn = null;
    PreparedStatement pstmt = null;
    PreparedStatement pstmt2 = null;
	
	try{
		
		Class.forName("com.mysql.jdbc.Driver");

		
        // 2. 연결하기
        String url = "jdbc:mysql://"+"ec2-54-180-159-220.ap-northeast-2.compute.amazonaws.com"+":3306/SE";
        conn = DriverManager.getConnection(url, "hgu", "handong0");
        
        
        String sql = "INSERT INTO Overnights VALUES (?,?,?,?,?,?,?)";
        String sql2 = "INSERT INTO Locations VALUES (?,?,?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt2 = conn.prepareStatement(sql2);
        // 4. 데이터 binding
        
        pstmt.setString(1, id );
        pstmt.setString(2, rc);
        pstmt.setString(3, dates);
        pstmt.setString(4, reason);
        pstmt.setInt(5, accepted);
        pstmt.setDate(6, apply_data);
        pstmt.setDate(7, accpt_data);
        
        pstmt2.setString(1, id );
        pstmt2.setString(2, dates);
        pstmt2.setString(3, dates);
        pstmt2.setString(4, location);

        // 5. 쿼리 실행 및 결과 처리
        // SELECT와 달리 INSERT는 반환되는 데이터들이 없으므로
        // ResultSet 객체가 필요 없고, 바로 pstmt.executeUpdate()메서드를 호출하면 됩니다.
        // INSERT, UPDATE, DELETE 쿼리는 이와 같이 메서드를 호출하며
        // SELECT에서는 stmt.executeQuery(sql); 메서드를 사용했었습니다.
        // @return     int - 몇 개의 row가 영향을 미쳤는지를 반환
        int count = pstmt.executeUpdate();
        int count2 = pstmt2.executeUpdate();
        if( count == 0 || count2==0 ){
            System.out.println("데이터 입력 실패");
        }
        else{
            System.out.println("데이터 입력 성공");
            
        }
        
        pageContext.forward("new_index.jsp");
    }
    catch( ClassNotFoundException e){
        System.out.println("드라이버 로딩 실패");
    }
    catch( SQLException e){
        System.out.println("에러 " + e);
    }
    finally{
        try{
            if( conn != null && !conn.isClosed()){
                conn.close();
            }
            if( pstmt != null && !pstmt.isClosed()){
                pstmt.close();
                pstmt2.close();
            }
        }
        catch( SQLException e){
            e.printStackTrace();
        }
    }	

%>
</body>