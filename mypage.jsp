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

  <!--calendar-->
  <script type="text/javascript" src="./js/init.js"></script>
  <script type="text/javascript" src="./js/lib/util.js"></script>
  <script type="text/javascript" src="./js/view/schedule/schedule-display.js"></script>
  <script type="text/javascript" src="./js/view/calendar/calendar.js"></script>
  <script type="text/javascript" src="./js/view/calendar/button.js"></script>
  <script type="text/javascript" src="./js/view/calendar/mini-calendar.js"></script>

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

    .tables {
      width:800px;
    }


    #calendar {
			position: absolute;
			left: 250px;
			max-width: 900px;
      max-height:900px;
			margin: 60px 0px 50px 0px;
		}

		button {
			border: 0;
			outline: 0;
		}
		#sidebar {
            position: absolute;
			border: 1px solid #e3e3e3;
            width: auto;
            height: 722px;
        }
		#scheduleButton {
			background:#2caa22;
			cursor: pointer;
		}
		#scheduleButton:hover {
			background: rgba(44, 186, 34, 0.2);
		}
		#scheduleButton:hover .scheduleButton {
			background: none;
			color:#2caa22;
		}
		.fc-day-number {
			color: #7c8a95;
		}
		.fc-sun, .fc-sun a {
			color: #BA392F;
		}
		.fc-sun a:hover {
			color: #7F2720;
			text-decoration: none;
		}
		.fc-sat, .fc-sat a {
			color: #4354BA;
		}
		.fc-sat a:hover {
			color: #2E3A7F;
			text-decoration: none;
		}
		.fc-widget-content {
			cursor:context-menu;
		}
		.inputStyle{
			background-color: LightGray;
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
	
	function goMainPage() {
	    location.href='new_index.jsp?ID='+new_ID;
	}
</script>

<body id="page-top">
	
	<!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg fixed-top" style="background-color: rgb(245,240,245); height: 4.5rem;">
    <div class="container">
      <a class="navbar-brand" href='javascript:goMainPage()'><strong>HGU Dorm Overnight Management - COVID19</strong></a>
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
          <a class="nav-link js-scroll-trigger" href="#education">Register result</a>
        </li>
        <li class="nav-item">
          <a class="nav-link js-scroll-trigger" href="#experience">Calendar</a>
        </li>

      </ul>
    </div>
  </nav>

  <div class="container-fluid p-0">
  
  	<%	
		request.setCharacterEncoding("utf-8");
		
		Connection conn = null;
		PreparedStatement stmt = null;
	    Statement pstmt = null;
	    ResultSet rs=null;
	    String ID = request.getParameter("ID");
	    
		try{
		
			Class.forName("com.mysql.jdbc.Driver");
		    
		    String url = "jdbc:mysql://"+"ec2-54-180-159-220.ap-northeast-2.compute.amazonaws.com"+":3306/SE";
		    
	        // 2. 연결하기
	        conn = DriverManager.getConnection(url, "hgu", "handong0");
	        
	        String sql = "SELECT RC,dates, accepted FROM Overnights WHERE id = ?";
	        
	        stmt = conn.prepareStatement(sql);
			stmt.setString(1, ID);
			rs = stmt.executeQuery();
			
	%>
	

    <section class="resume-section p-3 p-lg-5 d-flex justify-content-center" id="education">
      <div class="w-100">
        <h2 class="mb-5">My Page</h2>
         <% while(rs.next()){ %>
		
        <div class="resume-item d-flex flex-column flex-md-row justify-content-between mb-5">
          <div class="resume-content">
            <h3 class="mb-0">RC : <text id='RC'></text> </h3>
             <script>
			  	var RC = "<%=rs.getString("RC")%>";
			  	
			  	$(function() {
			    	$("#RC").text(RC);
			  	});
			  </script>
            <br/>
            <div class="table">
              <form>

    <table class="tables" align="center">
    	<thead>
        	<th>From</th>
            <th>To</th>
            <th>Result</th>
      
        </thead>   
   
 
    	<tbody id="table_tbody">
	    	<td> <%= rs.getString("dates") %> </td>
	        <td> ~ 1 day </td>
	        <td><%= rs.getInt("accepted") %></td>
	    
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

    <hr class="m-0">
        <div class="column middle" id="experience">

              <!-- main calendar -->
              	<div id="calendar" class="fc fc-unthemed fc-ltr">
              		<div class="fc-toolbar fc-header-toolbar">
              			<div class="fc-left">
              				<div class="fc-button-group">
              					<button type="button" class="fc-prev-button fc-button fc-state-default fc-corner-left"><span class="fc-icon fc-icon-left-single-arrow"></span></button>
              					<button type="button" class="fc-next-button fc-button fc-state-default fc-corner-right"><span class="fc-icon fc-icon-right-single-arrow"></span></button>
              				</div>
              				<button type="button" class="fc-today-button fc-button fc-state-default fc-corner-left fc-corner-right">today</button>
              			</div>
              			<div class="fc-center">
              				<h2></h2></div>
              			<div class="fc-clear"></div>
              		</div>
              		<div class="fc-view-container">
              			<div class="fc-view fc-month-view fc-basic-view">
              				<table>
              					<thead class="fc-head">
              						<tr>
              							<td class="fc-head-container fc-widget-header">
              								<div class="fc-row fc-widget-header">
              									<table>
              										<thead>
              											<tr>
              												<th class="fc-day-header fc-widget-header fc-sun"><span>Sun</span></th>
              												<th class="fc-day-header fc-widget-header fc-mon"><span>Mon</span></th>
              												<th class="fc-day-header fc-widget-header fc-tue"><span>Tue</span></th>
              												<th class="fc-day-header fc-widget-header fc-wed"><span>Wed</span></th>
              												<th class="fc-day-header fc-widget-header fc-thu"><span>Thu</span></th>
              												<th class="fc-day-header fc-widget-header fc-fri"><span>Fri</span></th>
              												<th class="fc-day-header fc-widget-header fc-sat"><span>Sat</span></th>
              											</tr>
              										</thead>
              									</table>
              								</div>
              							</td>
              						</tr>
              					</thead>
              					<tbody class="fc-body">
              						<tr>
              							<td class="fc-widget-content">
              								<div class="fc-scroller fc-day-grid-container" style="overflow: hidden; height: 647px;">
              									<div class="fc-day-grid fc-unselectable">
              										<div class="fc-row fc-week fc-widget-content fc-rigid" style="height: 107px;">
              											<div class="fc-bg">
              												<table>
              													<tbody>
              														<tr>
              															<td class="fc-day fc-widget-content fc-sun"></td>
              															<td class="fc-day fc-widget-content fc-mon"></td>
              															<td class="fc-day fc-widget-content fc-tue"></td>
              															<td class="fc-day fc-widget-content fc-wed"></td>
              															<td class="fc-day fc-widget-content fc-thu"></td>
              															<td class="fc-day fc-widget-content fc-fri"></td>
              															<td class="fc-day fc-widget-content fc-sat"></td>
              														</tr>
              													</tbody>
              												</table>
              											</div>
              											<div class="fc-content-skeleton">
              												<table>
              													<thead>
              														<tr>
              															<td class="fc-day-top fc-sun">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-mon">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-tue">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-wed">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-thu">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-fri">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-sat">
              																<a class="fc-day-number"></a>
              															</td>
              														</tr>
              													</thead>
              													<tbody>
              														<tr>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              														</tr>
              													</tbody>
              												</table>
              											</div>
              										</div>
              										<div class="fc-row fc-week fc-widget-content fc-rigid" style="height: 107px;">
              											<div class="fc-bg">
              												<table>
              													<tbody>
              														<tr>
              															<td class="fc-day fc-widget-content fc-sun"></td>
              															<td class="fc-day fc-widget-content fc-mon"></td>
              															<td class="fc-day fc-widget-content fc-tue"></td>
              															<td class="fc-day fc-widget-content fc-wed"></td>
              															<td class="fc-day fc-widget-content fc-thu"></td>
              															<td class="fc-day fc-widget-content fc-fri"></td>
              															<td class="fc-day fc-widget-content fc-sat"></td>
              														</tr>
              													</tbody>
              												</table>
              											</div>
              											<div class="fc-content-skeleton">
              												<table>
              													<thead>
              														<tr>
              															<td class="fc-day-top fc-sun">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-mon">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-tue">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-wed">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-thu">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-fri">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-sat">
              																<a class="fc-day-number"></a>
              															</td>
              														</tr>
              													</thead>
              													<tbody>
              														<tr>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              														</tr>
              													</tbody>
              												</table>
              											</div>
              										</div>
              										<div class="fc-row fc-week fc-widget-content fc-rigid" style="height: 107px;">
              											<div class="fc-bg">
              												<table>
              													<tbody>
              														<tr>
              															<td class="fc-day fc-widget-content fc-sun"></td>
              															<td class="fc-day fc-widget-content fc-mon"></td>
              															<td class="fc-day fc-widget-content fc-tue"></td>
              															<td class="fc-day fc-widget-content fc-wed"></td>
              															<td class="fc-day fc-widget-content fc-thu"></td>
              															<td class="fc-day fc-widget-content fc-fri"></td>
              															<td class="fc-day fc-widget-content fc-sat"></td>
              														</tr>
              													</tbody>
              												</table>
              											</div>
              											<div class="fc-content-skeleton">
              												<table>
              													<thead>
              														<tr>
              															<td class="fc-day-top fc-sun">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-mon">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-tue">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-wed">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-thu">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-fri">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-sat">
              																<a class="fc-day-number"></a>
              															</td>
              														</tr>
              													</thead>
              													<tbody>
              														<tr>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              														</tr>
              													</tbody>
              												</table>
              											</div>
              										</div>
              										<div class="fc-row fc-week fc-widget-content fc-rigid" style="height: 107px;">
              											<div class="fc-bg">
              												<table>
              													<tbody>
              														<tr>
              															<td class="fc-day fc-widget-content fc-sun"></td>
              															<td class="fc-day fc-widget-content fc-mon"></td>
              															<td class="fc-day fc-widget-content fc-tue"></td>
              															<td class="fc-day fc-widget-content fc-wed"></td>
              															<td class="fc-day fc-widget-content fc-thu"></td>
              															<td class="fc-day fc-widget-content fc-fri"></td>
              															<td class="fc-day fc-widget-content fc-sat"></td>
              														</tr>
              													</tbody>
              												</table>
              											</div>
              											<div class="fc-content-skeleton">
              												<table>
              													<thead>
              														<tr>
              															<td class="fc-day-top fc-sun">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-mon">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-tue">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-wed">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-thu">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-fri">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-sat">
              																<a class="fc-day-number"></a>
              															</td>
              														</tr>
              													</thead>
              													<tbody>
              														<tr>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              														</tr>
              													</tbody>
              												</table>
              											</div>
              										</div>
              										<div class="fc-row fc-week fc-widget-content fc-rigid" style="height: 107px;">
              											<div class="fc-bg">
              												<table>
              													<tbody>
              														<tr>
              															<td class="fc-day fc-widget-content fc-sun"></td>
              															<td class="fc-day fc-widget-content fc-mon"></td>
              															<td class="fc-day fc-widget-content fc-tue"></td>
              															<td class="fc-day fc-widget-content fc-wed"></td>
              															<td class="fc-day fc-widget-content fc-thu"></td>
              															<td class="fc-day fc-widget-content fc-fri"></td>
              															<td class="fc-day fc-widget-content fc-sat"></td>
              														</tr>
              													</tbody>
              												</table>
              											</div>
              											<div class="fc-content-skeleton">
              												<table>
              													<thead>
              														<tr>
              															<td class="fc-day-top fc-sun">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-mon">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-tue">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-wed">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-thu">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-fri">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-sat">
              																<a class="fc-day-number"></a>
              															</td>
              														</tr>
              													</thead>
              													<tbody>
              														<tr>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              														</tr>
              													</tbody>
              												</table>
              											</div>
              										</div>
              										<div class="fc-row fc-week fc-widget-content fc-rigid" style="height: 112px;">
              											<div class="fc-bg">
              												<table>
              													<tbody>
              														<tr>
              															<td class="fc-day fc-widget-content fc-sun"></td>
              															<td class="fc-day fc-widget-content fc-mon"></td>
              															<td class="fc-day fc-widget-content fc-tue"></td>
              															<td class="fc-day fc-widget-content fc-wed"></td>
              															<td class="fc-day fc-widget-content fc-thu"></td>
              															<td class="fc-day fc-widget-content fc-fri"></td>
              															<td class="fc-day fc-widget-content fc-sat"></td>
              														</tr>
              													</tbody>
              												</table>
              											</div>
              											<div class="fc-content-skeleton">
              												<table>
              													<thead>
              														<tr>
              															<td class="fc-day-top fc-sun">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-mon">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-tue">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-wed">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-thu">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-fri">
              																<a class="fc-day-number"></a>
              															</td>
              															<td class="fc-day-top fc-sat">
              																<a class="fc-day-number"></a>
              															</td>
              														</tr>
              													</thead>
              													<tbody>
              														<tr>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              															<td></td>
              														</tr>
              													</tbody>
              												</table>
              											</div>
              										</div>
              									</div>
              								</div>
              							</td>
              						</tr>
              					</tbody>
              				</table>
              			</div>
              		</div>
              	</div>
        </div>
	<!--calendar-->
	
	  </div>
    
 	<%
    }
	catch( ClassNotFoundException e){
	    System.out.println("드라이버 로딩 실패");
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