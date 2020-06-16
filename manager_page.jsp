<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.* ,java.util.*"%>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Resume - Start Bootstrap Theme</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor2/bootstrap/css/bootstrap.min.css" rel="stylesheet">


  <!-- Custom styles for this template >>template css!!-->
  <link href="css2/resume.min.css" rel="stylesheet">

  <!--calendar-->
  <link href='./style/fullcalendar.min.css' rel='stylesheet' />

  <script src='./js/lib/jquery.min.js'></script>
	<!-- Latest compiled and minified CSS -->
	<link href='./style/bootstrap.min.css' rel='stylesheet'>
	<!-- Optional theme -->

  <style>

    @import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

    #plus{
      background-color:green;
      color:white;
      font-weight:bold;
      border-radius:6px;
    }
    #minus{
      background-color:red;
      color:white;
      font-weight:bold;
      border-radius:6px;
    }
    #submit{
      background-color:blue;
      color:white;
      margin:10px 0;
    }

    .tables, .tables2 {
      width:800px;
    }
    .tables2 {
      margin-left:50px;
    }

    .middle {
      height:600px;
      margin-top: 50px;
    }
    


  </style>
</head>

<script>
	function getParam(sname) {
	    var params = location.search.substr(location.search.indexOf("?") + 1);
	    var sval = "";
	    params = params.split("&");
	    for (var i = 0; i < params.length; i++) {
	        temp = params[i].split("=");
	        if ([temp[0]] == sname) { sval = temp[1]; }
	    }
	    return sval;
	
	}
	new_ID = getParam('ID');
	
	function goThisPage() {
	    location.href='new_index.jsp?ID='+new_ID;
	}
	
	function goMyPage() {
	    location.href='mypage.jsp?ID='+new_ID;
	}
	
	function goManagerPage() {
	    location.href='manager_page.jsp?ID='+new_ID;
	}
	
	function goApplyPage() {
	    location.href='apply_form.jsp?ID='+new_ID;
	}
	function goRegisterPage() {
	    location.href='registerLocation.jsp?ID='+new_ID;
	}
</script>

<body id="page-top">

	<!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg fixed-top" style="background-color: rgb(245,240,245); height: 4.5rem;">
    <div class="container">
      <a class="navbar-brand" href='javascript:goThisPage()'><strong>HGU Dorm Overnight Management - COVID19</strong></a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
        data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    </div>
  </nav>

  <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top" id="sideNav">
    <a class="navbar-brand js-scroll-trigger" href="#page-top">
      <span class="d-block d-lg-none">Clarence Taylor</span>
      <span class="d-none d-lg-block">
        <img class="img-fluid img-profile rounded-circle mx-auto mb-2" src="./img/profile.jpg" alt="">
      </span>
    </a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#education">Student's Register</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#experience">Student's Location</a>
        </li>

      </ul>
    </div>
  </nav>
  
  <%
		request.setCharacterEncoding("utf-8");
  
  		String ID = request.getParameter("ID");
		
		Connection conn = null;
	    Statement pstmt = null;
	    ResultSet rs=null;

		Class.forName("com.mysql.jdbc.Driver");
	    
	    String url = "jdbc:mysql://"+"ec2-54-180-159-220.ap-northeast-2.compute.amazonaws.com"+":3306/SE";
	    
	    
		try{
		
		    
	        // 2. 연결하기
	        conn = DriverManager.getConnection(url, "hgu", "handong0");
	        
	        pstmt=conn.createStatement();
	        
	        String sql = "SELECT Students.ID,name, st_id,dates,reason FROM Students LEFT JOIN Overnights ON Students.ID=Overnights.ID";
	        rs = pstmt.executeQuery(sql);
        
	%>

  <div class="container-fluid p-0">

    <section class="resume-section p-3 p-lg-5 d-flex justify-content-center" id="education">
      <div class="w-100">
        <h2 class="mb-5">Manager Page</h2>

        <div class="resume-item d-flex flex-column flex-md-row justify-content-between mb-5">
          <div class="resume-content">

            <div class="subheading mb-3"><h3 class="mb-0"></h3></div>
            <br/>
            <div class="table">
              <form>

	
	
    <table class="tables" align="center">
        <thead>
        	<th>Name</th>
            <th>School number</th>
            <th>Date</th>
            <th>Reason</th>
            <th>Permission</th>
            
    	</thead>  
   
    <% while(rs.next()){ %>
    	<tbody id="table_tbody">
        	<td><%= rs.getString("name") %></td>
            <td><%= rs.getString("st_id") %></td>
            <td><%= rs.getString("dates") %></td>
            <td><%= rs.getString("reason") %></td>
            <td><input type="button" value="Yes" onClick="location.href='accpet_do.jsp?id=<%=rs.getString("Students.ID")%>'">
         		<input type="button" value="No" onClick="location.href='noaccpet_do.jsp?id=<%=rs.getString("Students.ID")%>'"></td>
        </tbody>
    
    <% } //end while %>
    
    	</table>
      </form>
    </div>
     
          </div>
          <div class="resume-date text-md-right">
            <span class="text-primary">2020 - 1 semester</span>
          </div>
        </div>
    
    
    </section>
    
    <%
   	 	rs.close();
    	
    }
    catch( SQLException e){
        System.out.println("에러 " + e);
    }
	%>

    <hr class="m-0">
        <div class="column middle" id="experience">

          <!-- Location -->

          <div class="table">
            <form>
            
     <%
		try{
		
	        String sql = "SELECT i.*, accepted FROM (SELECT Students.ID,name, st_id,dates,location FROM Students LEFT JOIN Locations ON Students.ID=Locations.ID) AS i LEFT JOIN Overnights ON Overnights.ID=i.ID WHERE Overnights.accepted=1";
	        rs = pstmt.executeQuery(sql);  
	%>
               
            
              <table class="tables2">
                <thead>
                  <th>Name</th>
                  <th>School number</th>
                  <th>Date</th>
                  <th>Location</th>
                  <th>Check</th>
  
                </thead>

			<% while(rs.next()){ %>
		    	<tbody id="table_tbody2">
		    		<td> <%= rs.getString("name") %> </td>
	                <td> <%= rs.getString("st_id") %> </td>
	                <td> <%= rs.getString("dates") %> </td>
	                <td> <%= rs.getString("location") %> ></td>
	                <td><input type="text" value="check"></td>
			    
		    	</tbody>
	        <% } //end while %>

              </table>
            </form>
          </div>

        </div>
	
	  </div>
    
 	<%
    }
    catch( SQLException e){
        System.out.println("에러 " + e);
	%>
	<%
    }
	finally{
		if(rs!=null)
			try{
				rs.close();
			}
			catch(SQLException e){}
		if(pstmt != null)
			try{
				pstmt.close();
			}
			catch(SQLException e){}
		if(conn!=null)
			try{
				conn.close();
				
			}
			catch(SQLException e){}
	}
	%>
</body>

</html>